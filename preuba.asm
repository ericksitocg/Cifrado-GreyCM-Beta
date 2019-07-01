.data 
    buffer_codigo: .asciiz "AEF"   
    buffer_mensaje: .asciiz "MENSAJE"
    
.text

.globl main 
main:
	la $a0,buffer_mensaje
	#Tomando solo la ultima letra del codigo sumando 2 desde el inicio del string moviendo el puntero
	la $t0,buffer_codigo
	addi $a1,$t0,2
	
	jal principal
		
	li $v0,10
	syscall 
	
principal:
	#Cargando el arreglo (string)
	lb $t0, ($a1)
	#Le restamos 64 por su valor en ASCCI ya que la A mayus empieza en 65
	li $t1,64
	#Restamos para que nos quede en valores desde el 1 hsta 36
	sub $t0,$t0,$t1
	#Valor a retornar el indice del arreglo sumando el numero de pasos del digito
	add $v0,$a0,$t0
	jr $ra
	