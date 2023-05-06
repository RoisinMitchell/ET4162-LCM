	.globl   lcm_asm
    .p2align 2
	.type    lcm_asm,%function

lcm_asm:
// x10 = product & return result
// x11 = gcd
// x0 = x
// x1 = y
		sub 	SP, SP, #16 // Stack pointer up by 16 bits to allocate space for variables on the stack
		str 	X30, [SP, #0] //return address
		str 	X10, [SP, #8] //product & resturn result
		str 	X11, [SP, #16] //gcd


		mul		x10, x0, x1 //product
		bl		gcd_asm
		sdiv	x10, x10, x0
		mov		x0, x10 //storing result

		//Loading registers back from stack
		ldr 	X11, [SP, #16]
		ldr 	X10, [SP, #8]
		ldr 	X30, [SP, #0]

		//resetting stack to 0
		add 	SP, SP, #16
		br		x30


gcd_asm:
		//Setting up the stack
		//sub		sp, sp, #16
		//str		x9, [sp, #16]


loop_check:
		// if (y == 0) branch to return
		cbz		x1, return

		// if (x > y) branch to loop
		cmp		x0, x1
		b.ge		loop_body

		//else
		mov		x9, x0 //temp = x;
		mov		x0, x1 //x = y;
		mov		x1, x9 //y = temp;


loop_body:
		sub		x9, x0, x1 //n = x - y;
		mov		x0, x1 // x = y;
		mov		x1, x9 // y = n;

		//Go to loop check
		b		loop_check


return:
		//Restoring stack
		//ldr		x9, [SP, #16]
		//add		sp, sp, #16

		//Branch to return address
		br		x30
