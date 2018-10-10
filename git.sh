BASE_DIR=`dirname $0 | xargs readlink -f`

echo "### Init submodules ###"
git submodule update --init

echo "### submodules thales-risc-v-fault-detector ###"
cd $BASE_DIR/thales-risc-v-fault-detector
git submodule update --init rocket-chip
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

echo "### submodules thales-risc-v-jtag-router ###"
cd $BASE_DIR/thales-risc-v-jtag-router
git submodule update --init rocket-chip
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

echo "### submodules thales-risc-v-registers-router ###"
cd $BASE_DIR/thales-risc-v-registers-router
git submodule update --init rocket-chip
cd rocket-chip
git submodule update --init firrtl chisel3 torture hardfloat

echo "### submodules thales-risc-v-chisel-project ###"
cd $BASE_DIR/thales-risc-v-chisel-project
git submodule update --init testchipip
git submodule update --init rocket-chip/firrtl rocket-chip/chisel3 rocket-chip/torture rocket-chip/hardfloat 
