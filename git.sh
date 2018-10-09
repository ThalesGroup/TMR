BASE_DIR=`dirname $0 | xargs readlink -f`

cd $BASE_DIR/thales-risc-v-fault-detector
git submodule update --init rocket-chip
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

cd $BASE_DIR/thales-risc-v-jtag-router
git submodule update --init rocket-chip
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

cd $BASE_DIR/thales-risc-v-registers-router
git submodule update --init rocket-chip
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

cd $BASE_DIR/thales-risc-v-chisel-project
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

