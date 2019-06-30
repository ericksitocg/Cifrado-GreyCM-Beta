	# Directiva de ensamblador .text todas las lineas debajo son codigo
	.text

	# Declarando la funcion global main
	.globl	main
	
main:	
	#Presentando para pedir mensaje
	li $v0,4
	la $a0,menj_pedir_mensaje
	syscall

	#Tomando la entrada del usuario como texto (mensaje)
	li $v0,8
	la $a0,buffer
	li $a1,50
	syscall
	
	#Presentando para pedir codigo
	li $v0,4
	la $a0,menj_pedir_codigo
	syscall
	
	#Tomando la entrada del usuario como texto (codigo)
	li $v0,8
	la $a0,buffer2
	li $a1,50
	syscall
	
	#Presentando mensaje informacion_1
	li $v0,4
	la $a0,menj_informar_encriptacion1
	syscall 
	
	#Presentado datos finales (mensaje)
	li $v0,4
	la $a0,buffer
	syscall
	
	#Presentando mensaje informacion_2
	li $v0,4
	la $a0,menj_informar_encriptacion2
	syscall 
	
	#Presentado datos finales (codigo)
	li $v0,4
	la $a0,buffer2
	syscall
	
	#terminando el programa
	li $v0,10		# Syscall Salir
	syscall

	# .data Directiva ensamblador todas las estructuras de memoria estand declaradas de la directiva
	.data
	
buffer: .space 50
buffer2: .space 50
menj_pedir_mensaje:	.asciiz "Ingrese el mensaje a encriptar(max 50 letras): "
menj_pedir_codigo:	.asciiz "Ingrese el codigo a usar para la encriptacion: "
menj_informar_encriptacion1:	.asciiz "Su codigo encriptado es: "
menj_informar_encriptacion2:	.asciiz "Usando el codigo: "