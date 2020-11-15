START:
	jal THINGY
	ebreak

.byte 0xFF, 0xFF, 0xFF, 0xFF

/* increment x3 from 0 to 9 */
THINGY:
	li  x3,  0
	li  x4,  1
	li  x5, 10
1:
	add x3, x3, x4
	sw  x3, 0x00000030(x0)
	blt x3, x5, 1b

	ret

.byte 0xFF, 0xFF, 0xFF, 0xFF

	jal THINGY
