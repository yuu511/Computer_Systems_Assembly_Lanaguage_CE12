# Elijah Cordova 
# ejcordov@ucsc.edu
# Lab 3 : Decimal Converter
# TA: C. Ibanez
# Due 11/1
# Lab3.asm

# this file will not work correctly unless you have arguments to the program
# be sure to add them before you try to run it.
.text
main:
    move     $s0,$a1
    lw   $s0,($s0)
    la   $a0, hello_msg # load the addr of hello_msg into $a0.
    li   $v0, 4 # 4 is the print_string syscall.
    syscall     # do the syscall.
    # your code goes here above the exit syscall
   
    #Print "Your Number:"
    la $a0, YourNumber
    li $v0, 4
    syscall
   
    # Print number
    move $a0, $s0
    li $v0,4
    syscall
   
    #load 1st character of string input
    lb $t0,0($s0)
    #load - in byte form
    lb $t1,Negative
    
    # if t0 and t1 are both -,ignore the first charcter , flag $s3 =1 indicates a negative number
    bne $t0,$t1,Else
    	 addi $s0,$s0,1
    	 li $s3,1 
Else:
     nop

# ascii to decimal conversion

#let t0 = 10 for decimal conversion, s2 be our number to return
li $t0,10
li $s2,0

loop:
	lbu $t1, ($s0) #get character 
	beq $t1, $0, end #end the loop at /0
	addiu $t1,$t1,-48 #convert to integer
	mul $s2,$s2,$t0 #sum x 10
	addu $s2,$s2,$t1 #s2+=char(s0) (converted)
	addiu $s0,$s0,1 #increment character address
	j loop

end:

#binary conversion 
  la $a0, newlinegenerator #generates newline
  li $v0, 4
  syscall
  
  la $a0, OutputNumber #Prints Output number:
  li $v0, 4
  syscall
  
	move $t0,$s2 #Our input number
	beq $s3,$zero, notNeg #2s complement step,+1 if number is negative (-1 in the actual operation, as we parsed the number as a positive number)
	  addiu $t0,$t0,-1
	notNeg:
	li $t1,0 #t1=0
	li $t3,1 #t3=1 (MASK)
	sll $t3,$t3,31 #leftshift by 31
	li $t4 32 #32 bits (for loop)
	li $s4,0 #store binary number here!

	binaryloop:
		and $t1,$t0,$t3 #input+mask and
		beq $t1,$zero,loop2 #if t1 =0, call loop2
		li $t1,0 #t1=0
		addiu $t1,$zero,1 #put 1
		j loop2 

	loop2:	
	     #beq conditional inverts binary digits if number is negative (1sc)
		beq $s3,$zero, notNeg2
		 	 beq $t1,$zero,is1
                  	li $t1,0
                  	j notNeg2
		 	is1:
		  	bne $t1,$zero,notNeg2
		  	li $t1,1
	          	j notNeg2
	      notNeg2:
		move $a0,$t1
		li $v0,1 #print
		syscall
		srl $t3,$t3,1 #shift right by one
		addiu $t4,$t4,-1  #increment by -1
		bne $t4,$zero,binaryloop #keep going until t4 =0

 finished:
    # your code goes here above the exit syscall
    li   $v0, 10 # 10 is the exit syscall.
    syscall     # do the syscall.
# Data for the program:
.data
hello_msg: .asciiz  "akagi\n"
YourNumber: .asciiz     "Input Number: "
OutputNumber: .asciiz   "Output Number: "
Negative: .byte   '-'
newlinegenerator: .asciiz  "\n"
# end Lab3.asm


