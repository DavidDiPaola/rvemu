.set SERIAL_IN,  0xFF004
.set SERIAL_OUT, 0xFF008

START:
	jal FILL
	ebreak

/* fill screen with colors */
FILL:
	li  x3, 0           /* character */
	li  x4, '?'         /* exit character */
	li  x5, SERIAL_IN   /* input pointer */
	li  x6, SERIAL_OUT  /* output pointer */

1:
	lw  x3, 0(x5)   /* get char */
	beq x3, x4, 3f  /* break loop if input is "?" */
	beq x3, x0, 2f  /* don't output if input is 0 */
	sw  x3, 0(x6)   /* put char */
2:
	j 1b            /* loop */
3:
	ret
