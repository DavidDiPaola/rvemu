.set SCREEN_START, 0xFB000
.set SCREEN_END,   0xFF000

START:
	jal FILL
	ebreak

/* fill screen with colors */
FILL:
	li  x3,        0  /* color */
	li  x4, 0x010305  /* color increment */
	li  x5, SCREEN_START /* screen pointer */
	li  x6, SCREEN_END   /* screen end pointer */
	li  x7, 4            /* screen pointer increment */

1:
	sw  x3, 0(x5)   /* write color */
	add x3, x3, x4  /* next color */

	add x5, x5, x7  /* next pixel */
	blt x5, x6, 1b  /* loop */

	ret
