
#
# script generated @ Wed Apr 25 09:37:13 CEST 2018
#

create_project project_1 ./project_1 -part xczu6cg-ffvc900-1-i -force
set_property "ip_repo_paths" "./git/ip_repo/" [get_filesets sources_1]
update_ip_catalog -rebuild
set_property target_language Verilog [current_project]
import_files -fileset sources_1 ".//git/src/hdl/clk_control.v"
import_files -fileset sources_1 ".//git/src/hdl/design_1_wrapper.v"
import_files -fileset sources_1 ".//git/src/hdl/JTAGRouter.v"
import_files -fileset sources_1 ".//git/src/hdl/split.v"
import_files -fileset constrs_1 ".//git/src/constrs/MercuryXU1_PE1.xdc"
source ./git/src/bd/design_1.tcl
set_property synth_checkpoint_mode Hierarchical [get_files ./project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]
set_property top design_1_wrapper [current_fileset]

#uncomment this to automatically run synthesis and implementation
#launch_runs synth_1 -jobs 6
#wait_on_run synth_1
#launch_runs impl_1 -to_step write_bitstream
#wait_on_run impl_1
