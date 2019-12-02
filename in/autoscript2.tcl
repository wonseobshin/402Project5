
########################### 2.6 Standard cell placement #############################
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteWidenWireRule LEFSpecialRouteSpec
setPlaceMode -fp false
placeDesign -inPlaceOpt

### add filler
getFillerMode -quiet

addFiller -cell FILL1 FILL2 FILL4 FILL8 FILL16 FILL32 FILL64 DECAP2 DECAP3 DECAP4 DECAP5 DECAP6 DECAP7 DECAP8 DECAP9 DECAP10 -prefix FILLER

##
########################### 2.7 Route #############################

setDesignMode -process 45
setDesignMode -flowEffort high
setOptMode -allEndPoints true
changeUseClockNetStatus -noFixedNetWires
setNanoRouteMode -routeDesignFixClockNets false
setNanoRouteMode -routeConcurrentMinimizeViaCountEffort medium
setNanoRouteMode -drouteUseMultiCutViaEffort high
globalNetConnect VDD -type tiehi
globalNetConnect VDD -type pgpin -pin VDD -override
globalNetConnect VSS -type tielo
globalNetConnect VSS -type pgpin -pin VSS -override
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign 


########################### 2.8 Verification #############################
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000

verifyGeometry -report ./out/encounter.geometry.rpt 
verify_drc -report ./out/encounter.drc.rpt -limit 1000


########################### 3 Output FIles #############################
extractRC
#############        change the output file names              ###############
##############################################################################

saveNetlist ./out/fsm_map.v
############################## sdf file for modelsim simulation #####################################

write_sdf ./out/fsm_map.sdf                          
saveDesign ./out/fsm_map.enc
############################## gds file for Virtuoso Import #####################################

streamOut ./out/fsm_map.gds -mapFile ./in/gds2.map -libName DesignLib -units 1000 -mode ALL 


