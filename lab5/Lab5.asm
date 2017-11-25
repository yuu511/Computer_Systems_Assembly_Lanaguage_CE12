# Elijah Cordova 
# ejcordov@ucsc.edu
# Lab 5 : Viegenere Cipher
# TA: C. Ibanez
# Due 11/23
# Lab5.asm

.text

# Let $s0 be key
# Let $s1 be clear text
# Let #s2 be cipher text
# Let #s3 be key len
# let #s4 be cleartext len

main:
    move $s0,$a1
    lw $s0,($s0)
    move $s1,$a1
    lw $s1,4($s1)
    jal keylen
    jal cipherlen
    jal encode
    jal decode
    li   $v0, 10 # 10 is the exit syscall.
    syscall     # do the syscall.  

keylen:
    # loop to find key text length ($s3)
    li $s3,0
    loop:
    lbu $t0, ($s0) #get character 
    beq $t0, $0, end #end the loop at /0
    addi $s3,$s3,1
    addi $s0,$s0,1 #increment character address
    j loop
    end:
    subu $s0,$s0,$s3
    jr $ra


cipherlen:
    # loop to find clear text length (#s4)
    li $s4,0
    loop2:
    lbu $t0, ($s1) #get character 
    beq $t0, $0, end2 #end the loop at /0
    addi $s4,$s4,1
    addi $s1,$s1,1 #increment character address
    j loop2
    end2:
    subu $s1,$s1,$s4
   
    jr $ra


encode: 
 
    # Print arguments (key,given text)
    la $a0,givenkeyis 
    li $v0, 4
    syscall
    move $a0, $s0
    li $v0,4
    syscall

    la $a0,giventextis
    li $v0, 4
    syscall
    move $a0, $s1
    li $v0,4
    syscall

    #QUICK DEBUG (PRINT keylen,clearlen)
#    move $a0,$s3 #DEBUG
#    li $v0,1 #print
#    syscall

#    move $a0,$s4 #DEBUG
#    li $v0,1 #print
#    syscall

    #Freaking DO THIS stuff bro
    #We're going to loop through the entirety of the clearlen text DUDE ($s4)
    li $t0,0
    li $t1,0
    loop3:
    beq $t0,$s4 ,end3
    
    # CURRENT CLEAR LEN CHAR stored in ($t6)
    la $t1,($s1)
    #addu $t1,$t1,$t0
    lb $t2, ($t1)
    
    
    # CURRENT KEY CHAR stored in ($t5)
    la $t3,($s0)
    li $t4,0
    #remainder  of i ($t0) and length of key $s3
    rem $t4,$t0,$s3
    addu $t3,$t3,$t4
    lb $t5,($t3)





    #DEBUG
     #   move $a0,$t5 #DEBUG
     #   li $v0,11 #print
     #   syscall
     #   la $a0,newlinegenerator
     #   li $v0, 4
     #   syscall

    subu $t3,$t3,$t0
    addi $t0,$t0,1    
    j loop3

    end3:
    subu $s1,$s1,$s4
    jr $ra
    
decode: 
     

    jr $ra

    
.data
  givenkeyis: .asciiz  "The given key is: "
  giventextis: .asciiz "\nThe given text is: "
  encryptedtextis: .asciiz "\nThe encrypted text is: "
  decryptedtextis: .asciiz "\nThe decrypted text is: "
  debug: .asciiz "\ndebug\n"
newlinegenerator: .asciiz  "\n"
# end Lab5.asm


