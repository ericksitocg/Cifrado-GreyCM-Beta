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
	la $a0,buffer_mensaje
	li $a1,50
	syscall
	
	#Presentando para pedir codigo
	li $v0,4
	la $a0,menj_pedir_codigo
	syscall
	
	#Tomando la entrada del usuario como texto (codigo)
	li $v0,8
	la $a0,buffer_codigo
	li $a1,50
	syscall
	
	#Convirtiendo en mayusculas el mensaje
	
	#Iniciando en cero el registro t0
	li $t0, 0

loop:
    lb $t1, buffer_mensaje($t0)
    beq $t1, 0, exit_loop
    blt $t1, 'a', case
    bgt $t1, 'z', case
    sub $t1, $t1, 32
    sb $t1, buffer_mensaje($t0)

case: 
    addi $t0, $t0, 1
    j loop

exit_loop:

	#Convirtiendo en mayusculas el codigo
	
	#Iniciando en cero el registro t0
	li $t0, 0

loop2:
    lb $t1, buffer_codigo($t0)
    beq $t1, 0, exit_loop2
    blt $t1, 'a', case2
    bgt $t1, 'z', case2
    sub $t1, $t1, 32
    sb $t1, buffer_codigo($t0)

case2: 
    addi $t0, $t0, 1
    j loop2

exit_loop2:

    	#Presentando mensaje informacion_1
	li $v0,4
	la $a0,menj_informar_encriptacion1
	syscall 
	
	#Presentado datos finales (mensaje)
	li $v0,4
	la $a0,buffer_mensaje
	syscall
	
	#Presentando mensaje informacion_2
	li $v0,4
	la $a0,menj_informar_encriptacion2
	syscall 
	
	#Presentado datos finales (codigo)
	li $v0,4
	la $a0,buffer_codigo
	syscall
	
	#terminando el programa
	li $v0,10		# Syscall Salir
	syscall

	# .data Directiva ensamblador todas las estructuras de memoria estand declaradas de la directiva
	.data
	
buffer_mensaje: .space 50
buffer_codigo: .space 50

menj_pedir_mensaje:	.asciiz "Ingrese el mensaje a encriptar(max 50 letras): "
menj_pedir_codigo:	.asciiz "Ingrese el codigo a usar para la encriptacion: "
menj_informar_encriptacion1:	.asciiz "Su codigo encriptado es: "
menj_informar_encriptacion2:	.asciiz "Usando el codigo: "

newline: .asciiz "\n"
