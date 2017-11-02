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
   
    # load 1st character in $t0 using $s0 pointer
    la $t0, 0($s0)
 
    # Store character "-" in t1
    la $t1,Negative
   
    # if character = - , start at 2nd character, otherwise start at chracter
    beq  $t0,$t1,NEG
    NEG:     
        addi $s0,$s0,-1 #go back to first character
   
    loop:
        lb $a0,($t0)
        beqz $a0,exit
        addi $s0,$s0,1
        la $t0,($s0)
        lb $a0,($t0)
        li $v0, 11
        syscall
        j loop
       
    exit:
        nop
 
 
 
 
 
   
 
    # your code goes here above the exit syscall
    li   $v0, 10 # 10 is the exit syscall.
    syscall     # do the syscall.
# Data for the program:
.data
hello_msg: .asciiz  "akagi\n"
YourNumber: .asciiz     "Input Number: "
Negative: .asciiz   "-"
debugln: .asciiz    "\nDEBUG PRINTLN\n"
# end hello.asm
