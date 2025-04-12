.global lab1
.syntax unified

lab1:
    push {lr}
    mov r0, #4  // a
    mov r1, #1  // b
    mov r2, #2  // c
    mov r3, #3  // Multiplier
    mov r4, #1  // Power result
    bl testVar
    pop {pc}

testVar:
	push { r0, r1, r2, r3, r4, lr }
	sub r0, r0, r1  // (a - b)
	mul r0, r0, r3  // (a - b) * 3
	mov r3, #2

pow:
	cmp r2, #0  // Check if c == 0
	beq e
	mul r4, r4, r3  // r4 *= 2
	sub r2, r2, #1  // c -= 1
	b pow

e:
	add r0, r0, r4  // (a - b) * 3 + 2^c
	pop { r0, r1, r2, r3, r4, lr }
	bx lr
