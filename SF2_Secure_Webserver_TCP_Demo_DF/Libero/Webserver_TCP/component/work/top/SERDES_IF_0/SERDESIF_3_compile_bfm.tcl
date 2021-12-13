# ===========================================================
# Created by Microsemi SmartDesign Fri Jun 11 22:56:31 2021
# 
# Warning: Do not modify this file, it may lead to unexpected 
#          simulation failures in your design.
#
# ===========================================================

if {$tcl_platform(os) == "Linux"} {
  exec "$env(ACTEL_SW_DIR)/bin64/bfmtovec"   -in SERDESIF_3_user.bfm   -out SERDESIF_3.vec
} else {
  exec "$env(ACTEL_SW_DIR)/bin64/bfmtovec.exe"   -in SERDESIF_3_user.bfm   -out SERDESIF_3.vec
}
