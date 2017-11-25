Elijah Cordova
ejcordov
1425119 
Lab 5 : Viegenere Cipher
Due 11/24

Discuss the encode/decode algorithms. What similarities are there between them?
 
  Both encode and decode look to manipulate a message using a given key by taking the ascii values of both.

  They are almost completely similar, except for the fact that encode adds the two ascii values of the original string and key
  while decode subtracts the two ascii values of the string and key.

Discuss the functions you made and what you were required to save.

  For this assignment, I chose to take the length of the key so I could use modulo as a way of "repeating" the key over and over again 
  in comparison to the string. This is calculated by keylen.

  I also had to take the length of the cipher of the key, and the length of the clear text of the key, to ensure that I was doing
  the appropriate amount of conversions. This is calculated by clearlen and encryptlen.

  The original text to be converted and the encrypted text are stored in variable $s1 and $s2, while the key is stored in $s0.
	
  The final string, decrypted from the encrypted string, is stored in $s7.


Overall, I would say that this lab helped me gain more practice using pointers and pointer arithmetic. 

  