#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Fri Nov 15 18:37:23 2019                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.13-s036_1 (64bit) 08/14/2014 18:19 (Linux 2.6)
#@(#)CDS: NanoRoute v14.13-s019 NR140805-0429/14_13-UB (database version 2.30, 237.6.1) {superthreading v1.19}
#@(#)CDS: CeltIC v14.13-s013_1 (64bit) 08/14/2014 12:47:36 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.13-s010 (64bit) 08/14/2014 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.13-s011_1 (64bit) Aug 14 2014 10:00:19 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.13-s029
#@(#)CDS: IQRC/TQRC 13.2.0-s451 (64bit) Tue Jul 22 19:06:40 PDT 2014 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getVersion
win
set init_gnd_net VSS
set init_lef_file {/CMC/kits/AMSKIT616_GPDK/tech/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef /CMC/kits/AMSKIT616_GPDK/tech/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef /CMC/kits/AMSKIT616_GPDK/tech/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef}


#############        change the verilog file name              ###############
##############################################################################

set init_verilog in/fsm_map.v

##############################################################################


set init_mmmc_file in/MMMC.tcl
set init_top_cell fsm_map
set init_pwr_net VDD
init_design

########################### 2.2 Floorplan #############################
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CoreSite -r 0.758795562599 0.499887 3 3 3 3
uiSetTool select
getIoFlowFlag
fit

########################### 2.4 Power Planing #############################

########################### 2.41 Power Rings #############################
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer Metal11 -type core_rings -jog_distance 0.6 -threshold 0.6 -nets {VDD VSS} -follow core -stacked_via_bottom_layer Metal1 -layer {bottom Metal1 top Metal1 right Metal2 left Metal2} -width 1 -spacing 0.25 -offset 0.6

########################### 2.42 Power Stripes #############################

sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { Metal1 Metal11 } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { Metal1 Metal11 } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { Metal1 Metal11 }

addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit Metal3 -max_same_layer_jog_length 0.44 -padcore_ring_bottom_layer_limit Metal1 -number_of_sets 1 -skip_via_on_pin Standardcell -stacked_via_top_layer Metal11 -padcore_ring_top_layer_limit Metal3 -spacing 0.2 -xleft_offset 13 -merge_stripes_value 0.6 -layer Metal2 -block_ring_bottom_layer_limit Metal1 -width 0.22 -nets {VDD VSS} -stacked_via_bottom_layer Metal1

puts "Press ENTER to continue..."
gets stdin







