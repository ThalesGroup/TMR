BASE_DIR=`dirname $0 | xargs readlink -f`

# Init submodules
git submodule update --init

# submodules thales-risc-v-fault-detector
cd $BASE_DIR/thales-risc-v-fault-detector
git submodule update --init rocket-chip
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

# submodules thales-risc-v-jtag-router
cd $BASE_DIR/thales-risc-v-jtag-router
git submodule update --init rocket-chip
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

# submodules thales-risc-v-registers-router
cd $BASE_DIR/thales-risc-v-registers-router
git submodule update --init rocket-chip
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

# submodules thales-risc-v-chisel-project
cd $BASE_DIR/thales-risc-v-chisel-project
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

