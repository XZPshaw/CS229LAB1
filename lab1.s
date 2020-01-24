.data
space: .space 4

.text
main:
	#read the integer
	li	$v0, 5
	syscall
	
	#use an address to store the input number
	la	$t1, space     #t1 is the address used to store the number
	move	$t0, $v0
	sw	$t0, 0($t1)    #save the input to address t1

	#locate each byte of integer and swap their position
	#change the location of 1st and 4th byte
	lb	$t3, 0($t1)	#t3 is the binary representation of int byte 0 
	lb	$t4, 3($t1)	#t4 is the binary representation of int byte 3
	sb	$t3, 3($t1)	#shift the binary representation of first byte into last byte
	sb	$t4, 0($t1)

      	#change the location of 4th byte
	lb	$t3, 1($t1)	#t3 is the binary representation of int byte 1 
	lb	$t4, 2($t1)	#t4 is the binary representation of int byte 2
	sb	$t3, 2($t1)	#shift the binary representation of first byte into last byte
	sb	$t4, 1($t1)   	

	#print the converted integer
	li 	$v0, 1		#system call code to print the integer
	lw	$a0, 0($t1)	#load the sorted int 
	syscall
	
	jr	$ra
