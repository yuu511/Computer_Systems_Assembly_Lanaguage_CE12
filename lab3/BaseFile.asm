# Elijah Cordova 10/22/17
# BaseFile.asm-- Starter File to begin coding assignment1
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
   
    la $a0, debugln #DEBUG FORMAT
    li $v0, 4
    syscall
   
    #load 1st character of string input
    lb $t0,0($s0)
    #load - in byte form
    lb $t1,Negative
    
    # if t0 and t1 are both -,ignore the first charcter
    bne $t0,$t1,Else
    	 addi $s0,$s0,1 
Else:
     nop
#let t0 = Length of number
li $t0,0
#iterates through string and finds out length of number, points $s0 at exit character      	
loop:
  	lb $t1,($s0)
  	beqz $t1,exit
  	addi $s0,$s0,1
  	addi $t0,$t0,1
  	j loop 
  		
exit:
     nop
 
#subtraction of -1 back to go back to the last number
addi $s0,$s0,-1
    la $a0, debugln #DEBUG FORMAT
    li $v0, 4
    syscall 

#length of number t0
move $a0, $t0 
li $v0, 1
syscall
    la $a0, debugln #DEBUG FORMAT
    li $v0, 4
    syscall
lb $t1,($s0)
addi $t1,$t1, -48

    move $a0,$t1 #DEBUG
    li $v0, 1
   syscall
   
addi $s0,$s0,-1
lb $t1,($s0)
addi $t1,$t1, -48
    move $a0,$t1 #DEBUG
    li $v0, 1
   syscall






 
 
 
   
 
    # your code goes here above the exit syscall
    li   $v0, 10 # 10 is the exit syscall.
    syscall     # do the syscall.
# Data for the program:
.data
hello_msg: .asciiz  "akagi\n"
YourNumber: .asciiz     "Input Number: "
Negative: .byte   '-'
debugln: .asciiz    "\nDEBUG PRINTLN\n"
# end hello.asm


