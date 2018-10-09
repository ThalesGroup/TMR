#include <stdio.h>
#include <stdlib.h>

#include <fcntl.h>
#include <unistd.h>

#include <sys/stat.h>
#include <sys/ioctl.h>
#include <endian.h>
#include <string.h>
#include <errno.h>

#include "risc-v-ft.h"

#define DEV_FILE "/dev/risc-v-ft"

int main(int argc, char *argv[])
{
	int dev_fd, firmware_fd, recovery_fd;
	struct stat st,r_st;
	int firmware_size;
	int unsigned long ioctl_cmd;
	int ret;
	int c;

	unsigned char *firmware_data;
	unsigned char *recovery_data;
	char *firmware_path = NULL;
	char *recovery_path = NULL;
	int clock = 1;
	int reset = 1;
	int break_cpu = 4;
	int reset_cpu = 4;
	int firmware_type = 0; // 0 - firmware, 1 - recovery

	while ((c = getopt (argc, argv, "b:c:f:r:s:u:")) != -1)
	switch (c)
	{
	case 'b':
		break_cpu = atoi(optarg);
	case 'c':
		clock = atoi(optarg);
        break;
	case 'f':
		firmware_path = optarg;
        break;
	case 'r':
		reset = atoi(optarg);
        break;
	case 's':
		reset_cpu = atoi(optarg);
	break;
	case 'u':
		recovery_path = optarg;
		break;
	default:
		return 1;
	}

	if(firmware_path) {
		if(stat(firmware_path, &st)) {
			printf("Failed to open input file \n");
			return 1;
		}

		firmware_size = htole32(st.st_size);
		firmware_type = 0;
	}

	if(recovery_path) {
		if(stat(recovery_path, &r_st)) {
			printf("Failed to open input file \n");
			return 1;
		}
		firmware_type = 1;
	}

	dev_fd = open(DEV_FILE, O_RDWR);

	if(!dev_fd) {
		printf("Failed to open \n");
		return 1;
	}

	if(break_cpu  < 4) {
		printf("Going to break CPU %d\n", break_cpu);
		ret = ioctl(dev_fd, RISC_V_BREAK_CPU, &break_cpu);
		if(ret) {
			printf("Failed to brak the CPU number %d [%d]\n", break_cpu, ret);
			printf("%d: %s\n", errno, strerror(errno));
		}
		return ret;
	}

	if(reset_cpu  < 4) {
		printf("Going to reset CPU %d\n", reset_cpu);
		ret = ioctl(dev_fd, RISC_V_RESET_SINGLE, &reset_cpu);
		if(ret) {
			printf("Failed to reset the CPU number %d [%d]\n", reset_cpu, ret);
			printf("%d: %s\n", errno, strerror(errno));
		}
		return ret;
	}

	if(firmware_path) {
		firmware_fd = open(firmware_path, O_RDONLY);

		if(!firmware_fd) {
			printf("Failed to open firmware file\n");
			return 1;
		}

		/* read the firmware data */
		firmware_data = (unsigned char*) malloc(st.st_size);
		if(!firmware_data) {
			printf("Failed to allocate memory\n");
			return 1;
		}

		read(firmware_fd, firmware_data, st.st_size);

		/* assert the reset */

		ret = ioctl(dev_fd, RISC_V_RESET_CPUS);
		if(ret < 0)
			printf("RESET cpus ioctl failed [%d]\n", ret);

		printf("Setting firmware type to: %s\n", (firmware_type) ? "recovery" : "program");
		ret = ioctl(dev_fd, RISC_V_SET_FIRMWARE_TYPE, &firmware_type);
		if(ret < 0)
			printf("Setting firmware type ioctl failed [%d]\n", ret);

		printf("Writing %s firmware \n", (firmware_type) ? "recovery" : "program");
		ret = write(dev_fd, firmware_data, st.st_size);

		printf("Wrote %d bytes\n", ret);

		ret = ioctl(dev_fd, RISC_V_RELEASE_RESET);
		if(ret < 0)
			printf("RESET release cpus ioctl failed [%d]\n", ret);

		close(firmware_fd);
	}

	if(recovery_path) {
		recovery_fd = open(recovery_path, O_RDONLY);

		if(!recovery_fd) {
			printf("Failed to open recovery file\n");
			return 1;
		}

		/* read the firmware data */
		recovery_data = (unsigned char*) malloc(r_st.st_size);
		if(!recovery_data) {
			printf("Failed to allocate memory\n");
			return 1;
		}

		read(recovery_fd, recovery_data, r_st.st_size);

		/* assert the reset */

		ret = ioctl(dev_fd, RISC_V_RESET_CPUS);
		if(ret < 0)
			printf("RESET cpus ioctl failed [%d]\n", ret);

		printf("Setting firmware type to: %s\n", (firmware_type) ? "recovery" : "program");
		ret = ioctl(dev_fd, RISC_V_SET_FIRMWARE_TYPE, &firmware_type);
		if(ret < 0)
			printf("Setting firmware type ioctl failed [%d]\n", ret);

		printf("Writing %s firmware \n", (firmware_type) ? "recovery" : "program");
		ret = write(dev_fd, recovery_data, r_st.st_size);

		printf("Wrote %d bytes\n", ret);

		ret = ioctl(dev_fd, RISC_V_RELEASE_RESET);
		if(ret < 0)
			printf("RESET release cpus ioctl failed [%d]\n", ret);

		close(recovery_fd);
	}

	/* handle clk */
	printf("%s clock\n", clock ? "enabling" : "disabling");
	ioctl_cmd = clock ? RISC_V_ENABLE_CLKS : RISC_V_DISABLE_CLKS;
	ret = ioctl(dev_fd, ioctl_cmd);
	if(ret) {
		printf("IOCTL err [%d]\n", ret);
	}

	printf("%s reset\n", reset ? "asserting" : "deasserting");
	ioctl_cmd = reset ? RISC_V_RESET_CPUS : RISC_V_RELEASE_RESET;
	ret = ioctl(dev_fd, ioctl_cmd);
	if(ret) {
		printf("IOCTL err [%d]\n", ret);
	}

	return 0;
}
