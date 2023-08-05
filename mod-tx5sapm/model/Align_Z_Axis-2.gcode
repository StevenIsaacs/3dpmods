; Home with Z adjust and Z alignment
; move up just to be safe
G91
G0 F480 Z20
G90
; first Home
G28
G0 Z10
; move to a place where the nozzle safely move below the bed
G0 F3000 X340 Y165
; Z calibration step
G0 F480 Z-5
G0 Z20
G28
; End of Calibrated Home
