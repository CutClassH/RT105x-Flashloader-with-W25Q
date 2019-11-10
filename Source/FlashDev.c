/*********************************************************************
*            (c) 1995 - 2018 SEGGER Microcontroller GmbH             *
*                        The Embedded Experts                        *
*                           www.segger.com                           *
**********************************************************************
----------------------------------------------------------------------
File    : FlashDev.c
Purpose : Flash device description Template
--------  END-OF-HEADER  ---------------------------------------------
*/

#include "FlashOS.h"

struct FlashDevice const FlashDevice __attribute__ ((section ("DevDscr"))) =  {
  ALGO_VERSION,              // Algo version
  "RT105x external flash", // Flash device name
  ONCHIP,                    // Flash device type
  0x60000000U,                // Flash base address
  0x60400000U,                // Total flash device size in Bytes (4 MB)
  256,                       // Page Size (number of bytes that will be passed to ProgramPage(). May be multiple of min alignment in order to reduce overhead for calling ProgramPage multiple times
  0,                         // Reserved, should be 0
  0xFF,                      // Flash erased value
  10000,                       // Program page timeout in ms
  20000,                      // Erase sector timeout in ms
  //
  // Flash sector layout definition
  //
  0x00001000, 0x60000000,   // 4k
  0xFFFFFFFF, 0xFFFFFFFF    // Indicates the end of the flash sector layout. Must be present.
};