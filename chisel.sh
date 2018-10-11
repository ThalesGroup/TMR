BASE_DIR=`dirname $0 | xargs readlink -f`

# submodules thales-risc-v-fault-detector
cd $BASE_DIR/thales-risc-v-fault-detector
make verilog

# submodules thales-risc-v-jtag-router
cd $BASE_DIR/thales-risc-v-jtag-router
make verilog

# submodules thales-risc-v-registers-router
cd $BASE_DIR/thales-risc-v-registers-router
make verilog

# submodules thales-risc-v-chisel-project
cd $BASE_DIR/thales-risc-v-chisel-project
make verilog

