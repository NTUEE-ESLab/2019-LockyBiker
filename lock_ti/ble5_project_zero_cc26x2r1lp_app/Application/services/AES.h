#ifndef _AES_H_
#define _AES_H_

#include <stdint.h>

// #define the macros below to 1/0 to enable/disable the mode of operation.
//
// CBC enables AES encryption in CBC-mode of operation.
// CTR enables encryption in counter-mode.
// ECB enables the basic ECB 16-byte block algorithm. All can be enabled simultaneously.

// The #ifndef-guard allows it to be configured before #include'ing or at compile time.





#define AES128 1


#define AES_BLOCKLEN 16 //Block length in bytes AES is 128b block only


#define AES_KEYLEN 16   // Key length in bytes
#define AES_keyExpSize 176
#include <stdlib.h>
#include <stdio.h>

struct AES_ctx
{
  uint8_t RoundKey[AES_keyExpSize];
};





// buffer size is exactly AES_BLOCKLEN bytes;
// you need only AES_init_ctx as IV is not used in ECB
// NB: ECB is considered insecure for most uses
void encrypt(char* msg, char* buf);
void decrypt(char* cipher, char* buf);




#endif //_AES_H_
