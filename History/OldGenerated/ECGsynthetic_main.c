/*
 * Project name:
     ECGsynthetic.mcpar
 * Generated by:
     Visual TFT
 * Date of creation
     7/1/2023
 * Test configuration:
     MCU:             STM32F407ZG
     Dev.Board:       Mikromedia_5_for_STM32_Capacitive
     Oscillator:      168000000 Hz
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 */

#include "ECGsynthetic_objects.h"

void main() {

  Start_TP();

  while (1) {
    Check_TP();
  }
}