	.text
	
main:
	jal funcion
	
	li $v0,4
	la $a0,buffer
	syscall
	
	li $v0,10
	syscall
	
funcion:
	addi $t0,$zero,0
	
	loop:
		lb $t1, buffer($t0)
    		beq $t1, 0, exit_loop
	 	blt $t1, 'a', case
		bgt $t1, 'z', case
		sub $t1, $t1, 32
		sb $t1, buffer($t0)

	case: 
    		addi $t0, $t0, 1
    		j loop

	exit_loop:
		jr $ra
	
	.data

buffer: .asciiz "H"
