	# All program code is placed after the
	# Directiva de ensamblador .text todas las lineas debajo son codigo
	.text

	# Declarando la funcion global main
	.globl	main
	
main:
	#Pruebas Hola mundo de base para iniciar el programa
	li	$v0,4		# Syscall imprimir un string loadinmediate
	la	$a0, msg	# Puntero a string (load the address of msg)
	syscall
	li	$v0,10		# Syscall Salir
	syscall

	# .data Directiva ensamblador todas las estructuras de memoria estand declaradas de la directiva
	.data
	
	#La directiva .asciiz crea un string en memoria terminado en caracter null
msg:	.asciiz	"Pruebas cifrado GreyCM!\n"