/******************************************************************************

   @file  project_zero.h

   @brief This file contains the Project Zero sample application
        definitions and prototypes.

   Group: CMCU, LPRF
   Target Device: CC2652

 ******************************************************************************
   
 Copyright (c) 2015-2018, Texas Instruments Incorporated
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:

 *  Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.

 *  Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

 *  Neither the name of Texas Instruments Incorporated nor the names of
    its contributors may be used to endorse or promote products derived
    from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 ******************************************************************************
   Release Name: simplelink_cc26x2_sdk_2_30_00_34
   Release Date: 2018-10-04 14:27:27
 *****************************************************************************/

#ifndef APP_H
#define APP_H

#ifdef __cplusplus
extern "C"
{
#endif

/*********************************************************************
 * INCLUDES
 */
#include <stdint.h>
#include <ti/sysbios/knl/Queue.h>
#include <ti/drivers/PIN.h>

#include <bcomdef.h>
#include <Board.h>
#include <stdbool.h>
#include "bcomdef.h"
#include "osal.h"
#include "sm.h"
#include "ll_ae.h"

/*********************************************************************
 *  EXTERNAL VARIABLES
 */
#define GPIO_UP 512
#define GPIO_DOWN 0

enum lock { LOCK, UNLOCK };
enum reg { WAIT_HELLO, CALL_BUTTON, WAIT_BUTTON, RESPONSE_HELLO, WAIT_PASSWORD, RESPONSE_PASSWORD };
enum con { WAIT_HELLO_C, SEND_CIPHER, WAIT_GUESS, SEND_ACK, SEND_NAK, WAIT_INSTRUCTION, RESPONSE_INSTRUCTION };
enum bles { IDLES, REGISTER, CONNECTION };
volatile extern char BLE_PASSWORD[16];
volatile extern enum bles BLE_State;
volatile extern enum lock Lock_State;
volatile extern enum reg Register_State;
volatile extern enum con Connection_State;
extern PIN_State SpeakerPinState;
extern PIN_State MotorPinState;
//PIN_Handle SpeakerPinHandle;
//PIN_Config SpeakerPinTable[] = {
//    Board_DIO22 | PIN_INPUT_EN | PIN_PULLUP | PIN_IRQ_NEGEDGE,PIN_TERMINATE
//};
extern PIN_Handle MotorPinHandle;
extern PIN_Config MotorPinTable[];
extern bool lock;
extern PIN_Handle SpeakerPinHandle;
extern PIN_Config SpeakerPinTable[];
extern bool shout;
extern bool lock_init;
//= {
//    Board_DIO21 | PIN_INPUT_EN | PIN_PULLUP | PIN_IRQ_NEGEDGE,PIN_TERMINATE
//};

/*********************************************************************
 * CONSTANTS
 */

/*********************************************************************
 * MACROS
 */

/*********************************************************************
 * TYPEDEFS
 */

/*********************************************************************
 * FUNCTIONS
 */

/*
 * Task creation function for the Project Zero.
 */
extern void ProjectZero_createTask(void);
/*********************************************************************
*********************************************************************/

#ifdef __cplusplus
}
#endif

#endif /* APP_H */
