
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name oscilloscope -dir "C:/Documents and Settings/21011253/Desktop/uni-digital-oscilloscope-master/import/oscilloscope/planAhead_run_1" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Documents and Settings/21011253/Desktop/uni-digital-oscilloscope-master/import/oscilloscope/oscTop.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Documents and Settings/21011253/Desktop/uni-digital-oscilloscope-master/import/oscilloscope} }
set_property target_constrs_file "basys2.ucf" [current_fileset -constrset]
add_files [list {basys2.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
