#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

/* Digest::Tiger xs written by Clinton Wong */
/* This program is free software; you can redistribute it and/or */
/* modify it under the same terms as Perl itself.                */

typedef unsigned long long int word64;
typedef unsigned long word32;
typedef unsigned char byte;

/* Big endian: */
#if !(defined(__alpha)||defined(__i386__)||defined(__vax__))
#define BIG_ENDIAN
#else
#undef BIG_ENDIAN
#define IS_LITTLE_ENDIAN
#endif

/* The following macro denotes that an optimization    */
/* for Alpha is required. It is used only for          */
/* optimization of time. Otherwise it does nothing.    */
#ifdef __alpha
#define OPTIMIZE_FOR_ALPHA
#endif

#define BYTESWAP(x)   ((((x)&0xFF)<<24)       \
                        |(((x)>>24)&0xFF)       \
                        |(((x)&0x0000FF00)<<8)  \
                        |(((x)&0x00FF0000)>>8)  )


void endian_swap(word32 *kinda_res) {
#ifdef IS_LITTLE_ENDIAN
    word32 temp;

    temp = kinda_res[0];
    kinda_res[0] = kinda_res[1];
    kinda_res[1] = temp;
    kinda_res[0] = BYTESWAP(kinda_res[0]);
    kinda_res[1] = BYTESWAP(kinda_res[1]);

    temp = kinda_res[2];
    kinda_res[2] = kinda_res[3];
    kinda_res[3] = temp;
    kinda_res[2] = BYTESWAP(kinda_res[2]);
    kinda_res[3] = BYTESWAP(kinda_res[3]);

    temp = kinda_res[4];
    kinda_res[4] = kinda_res[5];
    kinda_res[5] = temp;
    kinda_res[4] = BYTESWAP(kinda_res[4]);
    kinda_res[5] = BYTESWAP(kinda_res[5]);
#endif
}

#include "sboxes.c"
#include "tigerhash.c"


MODULE = Digest::Tiger		PACKAGE = Digest::Tiger
PROTOTYPES: DISABLE

void
hash(...)
  PREINIT:
    unsigned char *data;
    STRLEN len;
    word64 res[3];
  PPCODE:
    data = (unsigned char *)(SvPV(ST(0), len));
    tiger(data, len,  res);

    endian_swap(res);

    ST(0) = sv_2mortal(newSVpv( (char *) res, 24));
    XSRETURN(1);
