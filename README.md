
# Wordle Game Instructions

Wordle is a captivating word-guessing game where the objective is to guess a hidden word correctly to win. The gameplay involves a series of guesses, with feedback provided after each guess to help you deduce the correct word.

## How to Play

1. **Word Length**: The game begins by prompting you to specify the length of the word you need to guess.
2. **Make a Guess**: You then guess the word by typing it in.
3. **Feedback System**: After each guess, the game provides feedback using a color-coded system:

   - **Green**: The letter is correctly guessed and is in the correct position.
   - **Yellow**: The letter is in the word but in a different position.
   - **Red**: The letter is not in the word at all.

## Game Modes

Wordle offers three distinct game modes, each with its own level of difficulty and features:

### 1. Normal Mode

This is the standard mode of the game. In Normal Mode, you receive feedback based solely on the color-coded system described above. There are no additional hints or difficulties. It's a straightforward test of your word-guessing skills.

### 2. Easy Mode

In Easy Mode, the game provides extra guidance based on your previous guesses. This assistance helps you make better-informed guesses. Some features of Easy Mode include:

- **Word Validity Notification**: If the word you guessed is not in the game's dictionary, you will be notified.
- **Letter Usage Reminder**: The game will remind you to use letters that you know are in the word (based on previous feedback) but which you may not have included in your latest guess.

### 3. Expert Mode

Expert Mode is designed for players looking for the ultimate challenge. In this mode, the game introduces an element of deception. With a probability of 1/8, the game may provide incorrect feedback about the letters during your guess. This added twist requires a higher level of strategy and deductive reasoning.

## Starting the Game

To start the Wordle game, you need to use the GHC (Glasgow Haskell Compiler). Follow these steps to compile and run the game:

1. **Navigate to the Game Directory**: Open your terminal and navigate to the directory where the game files are located.
2. **Compile the Game**: Use the following command to compile the game:
   ```sh
   ghc Main.hs
   ```
3. **Run the Game**: Once the compilation process is complete, start the game by typing:
   ```sh
   Main.exe
   ```

Enjoy playing Wordle and challenge yourself to guess the word in as few attempts as possible!
