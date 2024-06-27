main
	ldi r1,v
	ldw r2,max
	ldi lr,retmain
	bnz r7,max_subarray
retmain
	ldi r1,v1
	ldw r2,max1
	ldi lr,retmain1
	bnz r7,max_subarray
retmain1
	ldi r1,v2
	ldw r2,max2
	ldi lr,end
	bnz r7,max_subarray
end
    hcf

max_subarray
	sub r7,2
	stw lr,r7

	sub r7,2
	stw 0,r7
	sub r7,2
	stw 0,r7
	
	ldi r3,0
	ldi r4,-1000
	ldi r5,0
	ldi r6,0
max_subarray_loop
	sub r7,2
	stw r1,r7

	slt r1,r3,r2
	bez r1,max_subarray_end

	ldw r1,r7
	add r7,2
	
	sub r7,2
	stw r2,r7

	ldw r2,r1
	add r1,2
	
	add r5,r5,r2
	
	slt r2,r4,r5
	bnz r2,check_max_subarray

	sub r7,2
	stw r1,r7
	
	ldi r1,0
	slt r2,r5,r1
	bnz r2,new_start

	bnz r7,end_loop
check_max_subarray
	ldw r2,r7
	add r7,2
	
	ldi r4,0
	add r4,r4,r5
	
	add r7,2
	stw r6,r7
	
	sub r7,2
	stw r3,r7
	
	sub r7,2
	stw r2,r7
		
	sub r7,2
	stw r1,r7
	
	ldi r1,0
	slt r2,r5,r1
	bnz r2,new_start

	bnz r7,end_loop

new_start
	ldi r5,0
	ldi r6,1
	add r6,r6,r3
end_loop
	ldw r1,r7
	add r7,2

	ldw r2,r7
	add r7,2

	add r3,1
	bnz r7,max_subarray_loop

max_subarray_end
	ldw r1,r7
	add r7,2
	
	ldw r5,r7
	add r7,2

	ldw r1,r7
	add r7,2

print_all
	ldi r2,0x73
	stw r2,0xf000
	ldi r2,0x6f
	stw r2,0xf000
	ldi r2,0x6d
	stw r2,0xf000
	ldi r2,0x61
	stw r2,0xf000
	ldi r2,0x3a
	stw r2,0xf000

	stw r4,0xf002

	ldi r2,0x0a
	stw r2,0xf000

	ldi r2,0x69
	stw r2,0xf000
	ldi r2,0x6e
	stw r2,0xf000
	ldi r2,0x69
	stw r2,0xf000
	ldi r2,0x63
	stw r2,0xf000
	ldi r2,0x69
	stw r2,0xf000
	ldi r2,0x6f
	stw r2,0xf000
	ldi r2,0x3a
	stw r2,0xf000

	stw r1,0xf002

	ldi r2,0x0a
	stw r2,0xf000

	ldi r2,0x66
	stw r2,0xf000
	ldi r2,0x69
	stw r2,0xf000
	ldi r2,0x6e
	stw r2,0xf000
	ldi r2,0x61
	stw r2,0xf000
	ldi r2,0x6c
	stw r2,0xf000
	ldi r2,0x3a
	stw r2,0xf000

	stw r5,0xf002

	ldi r2,0x0a
	stw r2,0xf000

	ldw r6,r7
	add r7,2

	bnz r7,r6
	
v       5 2 -2 -7 3 14 10 -3 9 -6 4 1
max     12
v1      5 -2 -3 7 -1 2 3 10 -4 2 -1 6
max1    12
v2      -320 555 120 30 -10 -5 10 -20 50
max2    9