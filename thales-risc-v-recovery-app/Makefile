recovery_img = recovery.rv64.img recovery.rv32.img
recovery_dump = recovery.rv64.dump recovery.rv32.dump

GCC=riscv64-unknown-elf-gcc
CFLAGS_RV64=-mabi=lp64 -march=rv64ima
CFLAGS_RV32=-mabi=ilp32 -march=rv32ima
OBJCOPY=riscv64-unknown-elf-objcopy
OBJDUMP=riscv64-unknown-elf-objdump

img: $(recovery_img)

dump: $(recovery_dump)

%.img: %.elf
	$(OBJCOPY) -O binary --change-addresses=-0x51000000 $< $@

%.rv32.elf: %.S linker.ld
	$(GCC) $(CFLAGS_RV32) -Tlinker.ld -DDDR_TARGET_ADDR=0x60000000 $< -nostdlib -static -o $@

%.rv64.elf: %.S linker.ld
	$(GCC) $(CFLAGS_RV64) -Tlinker.ld -DDDR_TARGET_ADDR=0x60000000 $< -nostdlib -static -o $@

%.dump: %.elf
	$(OBJDUMP) -d $< > $@

.SECONDARY: recovery.rv32.elf

clean:
	rm -f *.elf *.dump *.img
