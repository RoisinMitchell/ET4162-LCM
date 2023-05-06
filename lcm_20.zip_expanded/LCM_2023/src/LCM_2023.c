/*
 ============================================================================
 Name        : LCM_2023.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include "lcm_asm.h"

long long int gcd_c(long long int x, long long int y);
long long int lcm_c(long long int x, long long int y);

int main(void) {

	long long int x, y, lcm;

	x = 153;
	y = 68;
	printf("Numbers are: %lld\t and %lld\n", x, y);

	lcm = lcm_c(x, y);

	printf("LCM (C function) = %lld\n", lcm);

	lcm = lcm_asm(x, y);
	printf("LCM (ASM code) = %lld\n", lcm);

	return EXIT_SUCCESS;
}

long long int lcm_c(long long int x, long long int y)
{
	long long int gcd, product;

	product = x*y;
	gcd = gcd_c(x, y);

	return product/gcd;
}

long long int gcd_c(long long int x, long long int y)
{
	long long int n, temp;

	while (y > 0)
	{
	    if (x < y)
	      {
	      temp = x;
	      x = y;
	      y = temp;
	      }
	    n = x - y;
		x = y;
		y = n;
	}
	return x;
}
