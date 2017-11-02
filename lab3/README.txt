Elijah Cordova 
ejcordov@ucsc.edu
Lab 3
Section 01I

Discuss the algorithm(s) you designed. Were there any issues in implementing them?
--
To convert the ascii number to an integer was hard without the use of syscall 5. You have
to deal with not only first finding a way to convert ascii to decimal, but also putting together
the individual parts of the numbers. The binary converter was also hard to implement, as you had to design a way to
use the MASK correctly. The 2sc version of the converter was very short in code, but it took a while to conceptualize
the correct algorithm for it.



Discuss any assembly language techniques you developed or discovered.
--
	Pointer arithmetic : Not really assembly specific, but you have to understand how byte addressing works
	to get the algorithms going

	Using Addresses : You have to understand the difference between an address and the actual value stored in the address
	to use pointers

	ASCII : The use of ASCII codes to convert strings into decimals.



Several pseudo-ops were needed to complete this lab. Compare the code written with the
assembled code and look at what the assembler did. How many more lines of assembly were
written? 
--

The Assembler had to through about 10 more lines of assembly. 