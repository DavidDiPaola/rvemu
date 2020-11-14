/* increment x3 from 0 to 9 */
LOOP:
	li  x3,  0
	li  x4,  1
	li  x5, 10
	add x3, x3, x4
	sw  x3, 0x00000030(x0)
	blt x3, x5, LOOP

	ebreak
