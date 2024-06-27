main
	ldi r1,string1
	ldi r6,next_string 
	bnz r7,first_letter
	
next_string
	ldi r1,string2
	ldi r6,next_string1
	bnz r7,first_letter

next_string1
	ldi r1,string3
	ldi r6,end
	bnz r7,first_letter

first_letter
	ldi r4,1
	ldb r3,r1 
	ldi r2,0x20
	sub r3,r3,r2
	bez r3,decreases_one
	bnz r7,loop 

decreases_one
	sub r4,1
	bnz r7,loop

loop
	ldb r3,r1
	ldi r2,0x20
	sub r3,r3,r2
	bez r3,check_space
	ldb r3,r1
	add r1,1
	bnz r3,loop

print_all
	stw r4,0xf002
	ldi r4,0xa
	stw r4,0xf000
	bnz r7,r6

check_space
	add r1,1
	ldb r3,r1
	ldi r2,0x20
	sub r3,r3,r2
	bez r3,check_space

if_last
	ldb r3,r1
	bez r3,loop

increment_one
	add r4,1
	bnz r7,loop

end
	hcf

string1 "estou testando"
string2 "aa bcd ef  g h"
string3 "123 assembly  a"