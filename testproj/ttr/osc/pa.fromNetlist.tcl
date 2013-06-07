
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name osc -dir "E:/SEM2/SSC/project-repo/uni-digital-oscilloscope/testproj/ttr/osc/planAhead_run_2" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/SEM2/SSC/project-repo/uni-digital-oscilloscope/testproj/ttr/osc/oscTop.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/SEM2/SSC/project-repo/uni-digital-oscilloscope/testproj/ttr/osc} }
set_property target_constrs_file "basys2.ucf" [current_fileset -constrset]
add_files [list {basys2.ucf}] -fileset [get_property constrset [current_run]]
link_design
