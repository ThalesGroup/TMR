BASE_DIR=`dirname $0 | xargs readlink -f`

# copy generated verilog files
FPGATOP=$BASE_DIR/thales-risc-v-chisel-project/generated-src/antmicro_ft.FPGATop.AntmicroConfig.v
VIVADOFPGATOP=$BASE_DIR/thales-risc-v-vivado/git/ip_repo/risc_v_CPU_1.0/src/
cp $FPGATOP $VIVADOFPGATOP

FAULT=$BASE_DIR/thales-risc-v-fault-detector/FaultDetector.v
VIVADOFAULT=$BASE_DIR/thales-risc-v-vivado/git/ip_repo/fault_detector_1.0/src/
cp $FAULT $VIVADOFAULT

JTAG=$BASE_DIR/thales-risc-v-jtag-router/JTAGRouter.v
VIVADOJTAG=$BASE_DIR/thales-risc-v-vivado/git/src/hdl/
cp $JTAG $VIVADOJTAG

REGROUT=$BASE_DIR/thales-risc-v-registers-router/RegsRouter.v
VIVADOREGROUT=$BASE_DIR/thales-risc-v-vivado/git/ip_repo/regs_router_1.0/src/
cp $REGROUT $VIVADOREGROUT

# generate project (you need to have vivado sourced here)
cd $BASE_DIR/thales-risc-v-vivado
./git/tools/generate_project.sh > project.tcl
vivado -mode batch -source project.tcl
