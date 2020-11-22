	/* encoded as csrrwi x0, mie, <imm> */
	csrw mie, 1  /* interrupt enable */
	csrw mie, 0  /* interrupt disable */
