_main:
;ECGsynthetic_main.c,20 :: 		void main() {
;ECGsynthetic_main.c,22 :: 		Start_TP();
BL	_Start_TP+0
;ECGsynthetic_main.c,24 :: 		systemInit();
BL	_systemInit+0
;ECGsynthetic_main.c,25 :: 		applicationInit();
BL	_applicationInit+0
;ECGsynthetic_main.c,27 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
