Elijah Cordova
ejcordov
1425119 
Lab 2 
Due 10/22

Discuss issues you had building the circuit. Describe what you added to the minimum specifications to
make debugging easier.
--

The biggest issue with building the circuit was finding out the logic for the "subtracting" part of the calculator.
I had to go with an approach that involved the inverter giving the 1sc version of a number, and converting it later
to 2sc within the adder circuit. To aid with debugging I tested the parts individually before reproducing them and 
integrating them to the circuit, and hooked up led displays to various parts of the circuit to observe if it was
behaving as expected.

--
What happens when you subtract a larger number from a smaller number? Does the result make
sense? What happens when you add two numbers that won’t fit in 6 bits? 
--

-The calcuator gives you a large number, which makes sense given that you are "adding" the 2sc to subtract. 

-The calculator, depending on what you added, gives you a partial and incorrect representation of the number you are trying to add when attempting
to perform an operation involving more than 6 bits, as it does not posses the hardware to hold or calculate the correct amount.

--
Overall the lab helped me understand the reasoning behind using a 2sc for subtraction and actually assembling the
gates in the program helped me visualize an adder / subractor and solidified my understanding of them.