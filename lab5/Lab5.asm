# Elijah Cordova 
# ejcordov@ucsc.edu
# Lab 5 : Viegenere Cipher
# TA: C. Ibanez
# Due 11/23
# Lab5.asm

.text

# Let $s0 be key
# Let $s1 be clear text
# Let $s2 be cipher text
# Let $s3 be key len
# let $s4 be cleartext len
# let $s5 be ciphertext len
# let $s6 be const ASCII = 128
# let #s7 be the final, unencypted string

main:
    # load 1st arg (key)
    move $s0,$a1
    lw $s0,($s0)

    # load 2nd arg (clear text)
    move $s1,$a1
    lw $s1,4($s1)

    # initialize cipher text
    move $s2,$a1
    lw $s2,4($s2)

    # initialize final text
    move $s7,$a1
    lw $s7,4($s7)

    # initialize const $s6 to 128
    li $s6,128

    # find length of key , clear text 
    jal keylen
    jal clearlen
    
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

    # encrypt clear text with given key

    jal encode

    # take encrypted text length

    jal encryptlen

    # print encrypted text

    la $a0,encryptedtextis
    li $v0, 4
    syscall
    move $a0, $s2
    li $v0,4
    syscall


    # decrypt and print text
    jal decode
    la $a0, decryptedtextis
    li $v0, 4
    syscall
    move $a0, $s7
    li $v0,4
    syscall
    li   $v0, 10 # 10 is the exit syscall.
    syscall     # do the syscall.  

keylen:
    # loop to find key text length (stored in ($s3))
    li $t0,0
    loop:
    la $t1,($s0)
    addu $t1,$t1,$t0
    lb $t2,($t1)
    beq $t2, $0, end #end the loop at /0
    addi $t0,$t0,1
    j loop
    end:
    addu $s3,$s3,$t0
    jr $ra


clearlen:
    # loop to find clear text length (stored in($s4))
    li $t0,0
    loop2:
    la $t1,($s1)
    addu $t1,$t1,$t0
    lb $t2,($t1)
    beq $t2, $0, end2 #end the loop at /0
    addi $t0,$t0,1
    j loop2
    end2:
    addu $s4,$s4,$t0
    jr $ra

encryptlen:
    #loop to find encrypt text length (stored in ($s5))
    li $t0,0
    loop3:
    la $t1,($s2)
    addu $t1,$t1,$t0
    lb $t2,($t1)
    beq $t2, $0, end3 #end the loop at /0
    addi $t0,$t0,1
    j loop3
    end3:
    addu $s5,$s5,$t0
    jr $ra


encode: 
    # let i = $t0 
    # Loop the entirety of the clear text length $s4 
    li $t0,0

    loop4:
    beq $t0,$s4,end4
    
    # CURRENT CLEAR CHAR stored in ($t2)
    la $t1,($s1)
    addu $t1,$t1,$t0
    lb $t2, ($t1)

    # remainder  of i ($t0) and length of key ($s3)
    divu $t0,$s3
    MFHI $t3

    # CURRENT KEY CHARACTER, stored in ($t5)
    la $t4,($s0)
    addu $t4,$t4,$t3
    lb $t5,($t4)         
    
    # ADD $t2 and $t5
    addu $t6,$t2,$t5

    # Find remainder of number we just calculated and 128($s6) 
    divu $t6,$s6
    MFHI $t7

    #store $t7 into cipher text
    la $t1,($s2)
    addu $t1,$t1,$t0
    sb $t7,($t1)
    addi $t0,$t0,1  
    j loop4

   end4:
     la $t1,($s2) #add null terminator
     addu $t1,$t1,$s4
     sb $zero,($t1)
     jr $ra
 
decode:
    # let i = $t0 
    # Loop the entirety of the crypt text length $s5 
    li $t0,0

    loop5:
    beq $t0,$s5,end5
    
    # CURRENT encrypted text stored in ($t2)
    la $t1,($s2)
    addu $t1,$t1,$t0
    lb $t2, ($t1)

    # remainder  of i ($t0) and length of key ($s3)
    divu $t0,$s3
    MFHI $t3

    # CURRENT KEY CHARACTER, stored in ($t5)
    la $t4,($s0)
    addu $t4,$t4,$t3
    lb $t5,($t4)    

    # SUB $t2 and $t5
    subu $t6,$t2,$t5
 
    # Find remainder of number we just calculated and 128($s6) 
    divu $t6,$s6
    MFHI $t7

    # store $t7 into $s7 to create final string
    la $t1,($s7)
    addu $t1,$t1,$t0
    sb $t7,($t1)
    addi $t0,$t0,1  
    j loop5

   end5: 
     la $t1,($s1) #add null terminator
     addu $t1,$t1,$s4
     sb $zero,($t1)
     jr $ra
    
.data
  givenkeyis: .asciiz  "The given key is: "
  giventextis: .asciiz "\nThe given text is: "
  encryptedtextis: .asciiz "\nThe encrypted text is: "
  decryptedtextis: .asciiz "\nThe decrypted text is: "
  debug: .asciiz "debug"
  newline: .asciiz "\n"


# end Lab5.asm