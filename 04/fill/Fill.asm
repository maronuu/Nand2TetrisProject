// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(INIT)
    @SCREEN
    D=A
    @addr
    M=D // addr = SCREEN_TOP_LEFT

    @KBD
    D=M // Load Key Board
    @IFKEY
    D;JGT   // D > 0 then go to Black
    @ELSE
    0;JMP   // White

(IFKEY)
    @color
    M=-1 // black
    @ENDIF
    0;JMP
(ELSE)
    @color
    M=0 // white
(ENDIF)

(LOOP)
    // read color
    @color
    D=M // D = color
    
    // display address
    @addr
    A=M
    M=D // *addr = color (write)
    @addr
    M=M+1   // ++addr
    
    @8192
    D=A
    @SCREEN
    D=D+A
    @addr
    D=D-M   // D = 8192 + SCREEN - addr
    // do you continue?
    @LOOP
    D;JGT

    // go to initial state
    @INIT
    0;JMP
