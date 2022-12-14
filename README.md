https://www.codeproject.com/Articles/15971/Using-Inline-Assembly-in-C-C

See section "Basic Inline Code". Do NOT use extended assembly as shown in the "Extended Assembly" section.

# CSE202-Assembly-SP2022
Assembly: A programming exercise to write, compile, and link assembly code

# Learning Objectives
1) Apply learning of X86-64 ISA assembly mnemonics and assembler "goto" style 
2) Understand how to compile assembly (.S) source files using the GNU AS(as) assembler
3) Understand how to link compiled assembly object files
4) Learn how to view the values in registers and the stack frame in gdb.

# Instructions
Use the C program named prog1.c to call externally defined functions that you will write in assembly. You do NOT need (nor should you) edit the prog1.c code. In prog1.c, you will see six function prototypes that are defined in separate assembly source code files: fn1arg.S, fn1argB.S, fn2args.S, fn3args.S, fn6args.S, and fn8args.S. Their named based on the number of arguments they are passed or they use, e.g., fn2args is the function that is passed two arguments.

Your task is to implement each function in X86-64 assembly. Because of this requirement, it is highly recommended you do your development work on the sunlab machines. You can connect from a remote machine using "ssh -J username@ssh.lehigh.edu username@sunlab.cse.lehigh.edu". (Replace "username" with your Lehigh email ID, which is the same as your sunlab ID.) 

The fn1arg function has already been implemented, so you have an example of what you are to do. Additionally, function shells have already been written in fn1argB.S, fn2args.S, fn3args.S, fn6args.S, and fn8args.S. 

# Listing of the purpose of the functions
1) fn1arg:  receive one integer and return its negated value.
2) fn1argB: receive one integer and return its decremented value; if decremented value is less than 0, return DEADBEEF.
3) fn2args: receive two integers and numerically sort them in ascending order.
4) fn3args: receives a pointer to the first of three integers (l, w, and h) and returns the volume of a rectangular pyramid; if the intermediate result has a fractional component, round up the result.
5) fn6args: receives six integers representing two, (x,y,z) coordinates in 3D space (x1, y1, z1, x2, y2, z2) and returns the distance in integer form. To calculate the integer square root, you are REQUIRED to use this bitwise function, (integer_sqrt)[https://en.wikipedia.org/wiki/Integer_square_root]; create a function in fn6args.S for this purpose and call it within fn6args.S.
6) << 10% BONUS >> fn8args: receives two arguments (the address of argc and the address of argv) and returns the sum of the ASCII values of the characters in the arguments passed to the function. While all the characters in all the arguments could be accumulated, the 4th and 5th arguments represent the lower-bound and upper-bound of the arguments to be accumulated.

  Here's an example:
  314 = fn(9, 8, 2, 7, 5, 3, 1, 4)  

  Explanation:
  The program is called as "./prog1 9 8 2 7 5 3 1 4". The 4th argument is 2, and the 5th argument is 7. These arguments "tell" the function to add the ASCII values of '8' (56), '2' (50), '7' (55), '5' (53), '3' (51), and '1' (49), which total 314. If the 4th argument is less than 1, or the 5th argument is greater than or equal to the value of argc, or if 4th argument is greater than the 5th argument, the function returns 0.

# Additional Information
Before you modify anything, you should test what you have downloaded. To do this, simply type "bash runTests.sh". This Bash script compiles the program and runs a suite of tests found in tests.in. It compares the output of your program with the output of the reference program (tests.reference) one test at a time. You do NOT need (nor should you) edit runTest.sh, makefile, or tests.in files.

# Additional REQUIRED Actions
In addition to submitting your code in the various assembly .S files, you need to upload two JPEG files. The first JPEG you are to create while you are developing/debugging your fn6args code. While running "gdb -tui --args ./prog1 3 3 3 6 6 6", step into your fn6args function and type the gdb command "info registers" to display all the register values. Know that you can use the shortcut "i r" to do the same thing, and you can type "i r edi" to just print the value in the %edi register. Save a screenshot of the output into a "registers.jpg" file and push this to GitHub. The second JPEG you are to create while you are developing/debugging your fn8args code. While running "gdb -tui --args ./a.out 1 2 3 4 5 6 7 8", step in the main code until you get to the call to fn8args and type the gdb command "frame" to show the stack frame. Doing so will help you identify where on the stack the 7th and 8th arguments are for the call to fn8args. Save a screenshot of the output into a "frame.jpg" file and push this to GitHub. You don't have to use the arguments listed here, those are just examples.

# Recommended Approach
1) Leverage the textbook.
2) Work on this assignment a little every day... try NOT to procrastinate!

# Important Notes
1) The case of the input hex characters can be uppercase, lowercase, or mixed case.
2) Add comments to your code; it will help you and the graders!
3) Do NOT modify the prog1.c, runTests.sh, makefile, tests.in files; only modify the fn1argB.S through fn8args.S files.
4) Push your code often!!! This will give you a backup, enable you to retrieve earlier versions, and demonstrate you actually wrote the code over time. If you only perform one push of your final code, your submission will be THOROUGHLY evaluated to ensure it is original. 
5) Refer to the Programming Assignment Grading Rubric on Coursesite to maximize your score.
6) To submit your code for grading, simply perform a "git push"; which will upload your changes to GitHub Classroom and run the auto-grader. You may continue to push changes until you are informed "All tests passed" or the deadline published on Coursesite has passed.
7) Post any questions to Piazza.

Check out https://en.wikipedia.org/wiki/Hexspeak for some "fun" reading.
