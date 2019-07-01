	# Directiva de ensamblador .text todas las lineas debajo son codigo
	.text

	# Declarando la funcion global main
	.globl	main
	
main:	#####################################################
	#Presentando para pedir mensaje
	li $v0,4
	la $a0,menj_pedir_mensaje
	syscall

	#Tomando la entrada del usuario como texto (mensaje)
	li $v0,8
	la $a0,buffer_mensaje
	li $a1,50
	syscall
	
	#conviertiendo en mayuscula lo que esta en el buffer_mensaje
	jal convertir_a_mayusculas
	
	###############
	
	#Presentando para pedir codigo
	li $v0,4
	la $a0,menj_pedir_codigo
	syscall
	
	#Tomando la entrada del usuario como texto (codigo)
	li $v0,8
	la $a0,buffer_codigo
	li $a1,50
	syscall
	
	#conviertiendo en mayuscula lo que esta en el buffer_mensaje
	jal convertir_a_mayusculas
	
	#########################################################################
		
	#Presentando mensaje informacion_1
	li $v0,4
	la $a0,menj_informar_encriptacion1
	syscall 
	
	#Presentamos lo que hay guardado en el buffer de mensaje
	jal presentar_buffer_mensaje
	
	#Presentando mensaje informacion_2
	li $v0,4
	la $a0,menj_informar_encriptacion2
	syscall 
	
	#Presentamos lo que hay guardado en el buffer de codigo
	jal presentar_buffer_codigo
	
	######################################################################
	#mensaje
	jal presentar_mensaje_info_cifrado_principal
	
	#Aplicando el cifrado principal
	
	la $a0,buffer_mensaje
	#Tomando solo la ultima letra del codigo sumando 2 desde el inicio del string moviendo el puntero
	la $t0,buffer_codigo
	addi $a1,$t0,2
	
	jal cifrado_principal

	#mensaje
	jal presentar_mensaje_info_cifrado_secundario
	
	#Aplicnado el cifrado secundaio
	jal cifrado_secundario
	
	############################################
	
	#terminando el programa
	li $v0,10  # Syscall Salir
	syscall
	
convertir_a_mayusculas:
	
funcion:

    loop:
        lb $t1, ($a0)
        beq $t1, 0, exit_loop
        blt $t1, 'a', case
        bgt $t1, 'z', case
        sub $t1, $t1, 32
        sb $t1, ($a0)

    case: 
            addi $a0, $a0, 1
            j loop

    exit_loop:
        jr $ra
		
cifrado_principal:
	#definicion del cifrado principal
	jr $ra
	
cifrado_secundario:
	#defincion del los cifrados secundarios
	jr $ra
	
presentar_buffer_mensaje:
	#Presentado datos finales (codigo)
	li $v0,4
	la $a0,buffer_mensaje
	syscall
	jr $ra
	
presentar_buffer_codigo:
	#Presentado datos finales (codigo)
	li $v0,4
	la $a0,buffer_codigo
	syscall
	jr $ra

presentar_mensaje_info_cifrado_principal:

	li $v0,4
	la $a0,menj_informar_apli_cifrado_principal
	syscall
	jr $ra
	
presentar_mensaje_info_cifrado_secundario:

	li $v0,4
	la $a0,menj_informar_apli_cifrado_secundario
	syscall
	jr $ra

	# .data Directiva ensamblador todas las estructuras de memoria estand declaradas de la directiva
	.data
	
buffer_mensaje: .space 50
buffer_codigo: .space 50

menj_pedir_mensaje:	.asciiz "Ingrese el mensaje a encriptar(max 50 letras): "
menj_pedir_codigo:	.asciiz "Ingrese el codigo a usar para la encriptacion: "
menj_informar_encriptacion1:	.asciiz "Se va a encriptar  el mensaje : "
menj_informar_encriptacion2:	.asciiz "usando el codigo: "

menj_informar_apli_cifrado_principal: .asciiz "Aplicando cifrado principal\n"
menj_informar_apli_cifrado_secundario: .asciiz "Aplicando cifrado secundario\n"

newline: .asciiz "\n"
