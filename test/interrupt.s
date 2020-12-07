.ORG 0x00000

.EQU TIMER0_CTRL, 0xFF100
.EQU TIMER0_LOAD, 0xFF104

.EQU VEC_TIMER0, 0xFFFEC

START:
/* set up timer 0 interrupt handler */
	/*li x3, ISR_TIMER0*/
	li x3, 0x40
	li x4, VEC_TIMER0
	sw x3, 0(x4)

/* set up timer 0 to go off in 3 seconds*/
	li x3, 3000
	li x4, TIMER0_LOAD
	sw x3, 0(x4)

	li x3, 0b01
	li x4, TIMER0_CTRL
	sw x3, 0(x4)

/* sleep until interrupt */
	csrw mie, 1  /* interrupt enable (encoded as csrrwi x0, mie, 1) */
	wfi

/* all done */
	ebreak

/* ISR for timer */
ISR_TIMER0:
	li x3, 0xFFFFFFFF
	sw x3, 0x000F0(x0)
	mret
