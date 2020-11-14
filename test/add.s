/* x5 = 8 + 4 */
li  x3, 8
li  x4, 4
add x5, x3, x4
sw  x5, 0x00000030(x0)
ebreak
