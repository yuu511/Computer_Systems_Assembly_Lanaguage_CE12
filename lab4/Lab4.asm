# Elijah Cordova 
# ejcordov@ucsc.edu
# Lab 4 : Prime Finder
# TA: C. Ibanez
# Due 11/12
# Lab3.asm

# this file will not work correctly unless you have arguments to the program
# be sure to add them before you try to run it.
.text
main:
   # Asks for input
    li $v0,4
    la $a0,prompt
    syscall
    
   # convert to integer and store in $t0 
    li $v0, 5
    syscall
    move $t0, $v0 
    
   
  # print out 2 for fomatting
    li $a0,2
    li $v0,1
    syscall
  
  # calculate primes:
  
  # initialize i = 3 ($t1) and j =2 ($t2) 
  # Let i = number we check, and j be the numbers we divide it by to see if it's prime
   li $t1,3
   li $t2,2
  
   
   # loop1 iterates i from 3 to n 
   loop1:
  	 # label for to see if n < i : $t3 (i is iterated below in either prime or not prime methods)
	slt $t3, $t0, $t1
 	  # if n < i end
  	 beq $t3,1,end     
   
 	  #have to intialize j=2 every iteration    	
  	 li $t2,2
   	 j loop2
  
   
   loop2:  
 	  # j squared, this is the greatest unique value that i can be a multiple of
 	  # store in $t4
	  mult $t2, $t2 
 	  mflo $t4
   
   	 # have to subtract 1 to t4 because mips doesn't have less than or equal to vaiant for slt
   	 subi $t4,$t4,1                   
  	
  	  # check if t1 is less than or equal to t4 (which is j^2). If so, we are done iterating and t1 is prime because it didn't pass the check below.
   	  slt $t5,$t1,$t4
  	  beq $t5,1,prime		 
  	  
  	  # if at least one number under the sqrt of i can evenly divide. if such a number is found, the number is not prime and we can check i+1
  	  # i will never divide by itself because we set the range from i to sqrt i via j^2.
  	  rem $t6,$t1,$t2
 	  beq $t6,0,notprime
 	  
 	  # iterate j by 1 and start the j loop again.
  	  addi $t2,$t2,1
   	  j loop2
   
   prime:
        # print the formatting stuff ( <, >number)
        la $a0,formattingstuff 
   	li $v0, 4
   	syscall
   	   
   	# print the prime number, check the next value for prime
   	move $a0,$t1 
   	li $v0,1
   	syscall
   	addi $t1,$t1,1
   	j loop1
   
   
   notprime:
   	 # check the next value for prime
  	 addi $t1,$t1,1 
   	 j loop1
   
   
   end:
   	nop  
   
   li   $v0, 10 # 10 is the exit syscall.
   syscall     # do the syscall.      
      
.data
  prompt: .asciiz ""
  formattingstuff: .asciiz  ", "
