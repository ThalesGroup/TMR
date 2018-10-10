
# Triple Module Redundancy

## Licencing

Chiesel project and associated binaries (RTL and bitstream) are released with a BSD licence.
Modifications in the ultrascale linux, u-boot, zephyrOS and openOCD are released under GPL licence.

## Running the demo straight away

This README file helps you regenerate the full project. For that you will need 
- chiesel tools
- Vivado licence for the Ultrascale+
- riscv-tools
- zephyr-sdk

Or you can directly flash the SD card with the provided image 
```Bash
dd bs=1m if=demo-sd-card-img of=/dev/yoursdcard/ 
```

## Source retrieval

Four IP cores has been written in chiesel for this project.
- chisel-project
- registers-router
- jtag-router 
- fault-detector 

They are git submodules that need to be retrieved with the following script.

```Bash
./git.sh
```

## Bitstream generation

To regenerate the chiesel projects, use this script

```Bash
./chiesel.sh
```
It will generate verilog files that need to be copied in the thales-risc-v-vivado project.
To launch synthesis and implementation run the vivado.sh script. You will need to have vivado sourced here. 
It has been tested with vivado 2017.4.

```Bash
./vivado.sh
```
The resulting bitstream should be located in thales-risc-v-vivado/project_1/project_1.runs/impl_1/

## US+ Processing system software

If you want to regenerate the bootloader, the kernel and the Risc-V control software you can follow the instructions in **RISC-V-demonstrator--docs.pdf** *5.1 US+ Processing system software* 

## Riscv-V software

The Risc-V software consists of a ZephyrOS sample named im_alive. To re-generate it you will need to install the zephy-sdk at https://docs.zephyrproject.org/latest/getting_started/installation_linux.html
After that, the `./make_im_alive.sh` script should correctly generate the Risc-V executable. It will be located at `riscv-zephyr/samples/im_alive/build/am_ft_devkit/zephyr/zephyr.elf`.

## SD card generation

To flash the SD card for the US+ target, you can use the instructions at **RISC-V-demonstrator--docs.pdf**   *6.1 Preparing the SD card*


