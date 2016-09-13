/* 
 * CS:APP Data Lab 
 * 
 * <Linh Tran <litran11794@unm.edu>>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function. 
     The max operator count is checked by dlc. Note that '=' is not 
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* Copyright (C) 1991-2014 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
/* 
 * bitAnd - x&y using only ~ and | 
 *   Example: bitAnd(6, 5) = 4
 *   Legal ops: ~ |
 *   Max ops: 8
 *   Rating: 1
 */
int bitAnd(int x, int y) { 
  return ( ~  ( ~  x | ~ y));
}
/* 
 * getByte - Extract byte n from word x
 *   Bytes numbered from 0 (LSB) to 3 (MSB)
 *   Examples: getByte(0x12345678,1) = 0x56
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */

//shift by n bytes and mask out the insignficant bits.
//n<<3 = n*2^3 = n*8
//x >> n*8
//x >> n*8 & 1111 1111
//order of operations?((x >> (n << 3)) & 0*ff)
int getByte(int x, int n) {
  int ff = 255; //0xff
  int shiftByNbytes = n << 3; //n*2^3 = n*8
  return (ff & (x >> (shiftByNbytes)));
}
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalShift(int x, int n) {
  return (x >> n) ^ (((x & (1 << 31)) >> n) << 1);
}
/*
 * bitCount - returns count of number of 1's in word
 *   Examples: bitCount(5) = 2, bitCount(7) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 40
 *   Rating: 4
 */
int bitCount(int x) {
  int bits = 0;
  int mask = 0x1 | (0x1 << 8) | (0x1 << 16) | (0x1 << 24);
  bits += (x & mask);
  bits += ((x >> 1) & mask);
  bits += ((x >> 2) & mask);
  bits += ((x >> 3) & mask);
  bits += ((x >> 4) & mask);
  bits += ((x >> 5) & mask);
  bits += ((x >> 6) & mask);
  bits += ((x >> 7) & mask);
  return (bits & 0xFF) + ((bits >> 8) & 0xFF) + ((bits >> 16) & 0xFF) + ((bits >> 24) & 0xFF);


  /*
  int onesBit     = 1431655765; // 0x55555555
  int twoBits     = 858993459;  // 0x33333333
  int fourBits    = 252645135;  // 0x0f0f0f0f
  int eightBits   = 16711935;   // 0x00ff00ff
  int sixteenBits = 65535;      // 0x0000ffff
 
  x = (onesBit     & x) + ((x >> 1)  & onesBit);
  x = (twoBits     & x) + ((x >> 2)  & twoBits);
  x = (fourBits    & x) + ((x >> 4)  & fourBits);
  x = (eightBits   & x) + ((x >> 8)  & eightBits);
  x = (sixteenBits & x) + ((x >> 16) & sixteenBits); 
  return x;*/
  return 2;
}
/* 
 * bang - Compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int bang(int x) {
  //if x == 0, flipX == -1
  int flipX = ~x; 
  // if flipX == -1, negX == 0;
  // if flipX == -3, negX == -3
  int negX = flipX +1;
  // if negX == 0, turnOnOrigBits == 0
  // if negX == -1, turnOnOrigBits == -1
  int turnOnOrigBits = (x | negX);
  return (turnOnOrigBits >> 31) + 1;  
}
/* 
 * tmin - return minimum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void) {
  int tmin = 1<<31;
  return tmin;
}
/* 
 * fitsBits - return 1 if x can be represented as an 
 *  n-bit, two's complement integer.
 *   1 <= n <= 32
 *   Examples: fitsBits(5,3) = 0, fitsBits(-4,3) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int fitsBits(int x, int n) {
  int mask = x >> 31;
  int nMinus1 = n + ~0;
  return !(((~x & mask) + (x & ~mask)) >> nMinus1);
}
/* 
 * divpwr2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: divpwr2(15,1) = 7, divpwr2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int divpwr2(int x, int n) {
  return (x + ((x >> 31) & ((1 << n) + ~0))) >> n;
}
/* 
 * negate - return -x 
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x) {
  int twosComp = ~x +1;
  return twosComp;
}
/* 
 * isPositive - return 1 if x > 0, return 0 otherwise 
 *   Example: isPositive(-1) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 3
 */
int isPositive(int x) {
  // x>>31 perserves 1 if neg number
  // & 1 turn off the 1s from the left.
  int msb =  (x>>31)&1;
  //one == 1
  int one = !!x; 
  //0^1 => 1, 1^1 => 0
  return msb^one;;
}
/* 
 * isLessOrEqual - if x <= y  then return 1, else return 0 
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) {
  int negX = ~x+1;
  int addY = negX + y; /*negative if x > y*/
  int checkSign = addY >> 31 & 1; /*shifts sign bit to the right*/

  /*the above will not work for values that push the bounds of ints
    the following code checks very large/small values*/
  int leftBit = 1 << 31;
  int xLeft = leftBit & x;
  int yLeft = leftBit & y;
  int xOrd = xLeft ^ yLeft;
  xOrd = (xOrd >> 31) & 1;
 
  return (xOrd & (xLeft>>31)) | (!checkSign & !xOrd);

  //return 2;
}
/*
 * ilog2 - return floor(log base 2 of x), where x > 0
 *   Example: ilog2(16) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 90
 *   Rating: 4
 */
int ilog2(int x) {
  //  x = x << 2;
  //return x;

  /* calculates the log by checking the first four bytes, then two, then 1 then 4 bits ...*/
  int mask1 = 0xFF << 24 | 0xFF << 16;
  int mask2 = 0xFF << 8;
  int mask3 = 0xF0;
  int mask4 = 0x0C;
  int output = 0;
  int shift;
  output = !!(x & mask1) << 4; /* if anythings in high 4 bytes, output is at least 16 */
  x >>= output; /* bring the high bits down, if anythings up there */
  shift = !!(x & mask2) << 3; /* check next two bytes, if anythings there, its at least 8 more*/
  x >>= shift;
  output += shift;
  shift = !!(x & mask3) << 2; /* check the next byte, if anythings there, its at least 4 more */
  x >>= shift;
  output += shift;
  shift = !!(x & mask4) << 1; /* check the next 4 bits, if anythings there, its at least 2 more */
  x >>= shift;
  output += shift;
  output += (x >> 1); /* check the second to last bit, if anythings there, its 1 more */
  /* can disregard the last bit, because it wont matter if to the log */
  return output;
}
/* 
 * float_neg - Return bit-level equivalent of expression -f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
unsigned float_neg(unsigned uf) {
  /* Flips the sign bit if uf isn't inf or NaN */
  unsigned mask = 0x80000000;
  unsigned NaN = 0x7FC00000;
  unsigned inf = 0xFFC00000;
  if (uf == NaN || uf == inf)
    return uf;
  return uf ^ mask;
 return 2;
}
/* 
 * float_i2f - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_i2f(int x) {
  /* squeeze x into 23 bits, rounding following the rounding rules */
  unsigned sign, fraction, exponent = 150, temp, b = 2, top, bottom;
  if (x == 0) return 0;
  if (x == 0x80000000) return 3472883712u;
  sign = (x & 0x80000000);
  fraction = (sign) ? (-x) : (x);

  temp = fraction;
  while (temp & 0xFF000000) {
    /* standard rounding */
    temp = (fraction + (b / 2)) / (b);
    b <<= 1;
    exponent++;
  }
  while (temp <= 0x007FFFFF) {
    temp <<= 1;
    exponent--;
  }
  if (fraction & 0xFF000000) {
    b = 1 << (exponent - 150);

    temp = fraction / b;
    bottom = fraction % b;
    top = b - bottom;

    /* if temp is closer to fraction/b than fraction/b + 1, or its odd,
       round up */
    if ((top < bottom) || ((top == bottom) & temp))
      ++temp;

    fraction = temp;
  } else {
    while (fraction <= 0x007FFFFF)
      fraction <<= 1;
  }

  return (sign) | (exponent << 23) | (fraction & 0x007FFFFF);
  // return 2;
}
/* 
 * float_twice - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_twice(unsigned uf) {
  /* if its denormalized double fraction, if its normailized, increase 
   * exponent, if it on the edege, decrement fraction, increment epx. */
  unsigned expn = (uf >> 23) & 0xFF;
  unsigned sign = uf & 0x80000000;
  unsigned frac = uf & 0x007FFFFF;
  if (expn == 255 || (expn == 0 && frac == 0))
    return uf;

  if (expn) {
    expn++;
  } else if (frac == 0x7FFFFF) {
    frac--;
    expn++;
  } else {
    frac <<= 1;
  }

  return (sign) | (expn << 23) | (frac);
  //  return 2;
}
