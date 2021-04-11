# Study Assistant Application
 ## Table of Contents:  
- [Links](#Links)  
- [Software Development Plan](#Software-development-plan)  
- [Instructions on how to use](#Target-Audience-Usage)
- [Functionality & Features](#Functionality-and-Features)
- [User Interaction and Experience](#User-interaction-and-experience)  
- [Control Flow Development](#Control-flow-development)  
- [Implementation Plan](#Implementation-Plan)  
- [Testing](#Testing)
- [Help Documentation](#Help-Documentation) 

#

## Links

* [GitHub Repository](https://github.com/jeremytuesley/StudyAssistant)

#
# Software Development Plan
## Problem and why:
With inspiration from memories of a child asking my sister to hold the revision paper that contained the questions and answers, and then ask me the questions and tell me if I'm right or wrong. I created this app in place.

## Details of what the application will do:
It will be a questionnaire type of application to help students revise their knowledge by creating categories, questions with the answer, and then afterwards, the application will throw the questions back to them in a random order and requests user input for their answer to that question, giving them a right or wrong response once answered,
At the end, once all questions are gone/ questions from that category, the program will sum up their answers and give a number on how many they got right out and advise them according to their score, e.g.

"You got 12/14 correct! That's 78% correct. These are the questions you got wrong:
- How many legs does a dog have?
You answered: 3
The answer was: 4, better luck next time!

- What's heavier; a kilogram of steel? or a kilogram of feathers?
You answered: a kilogram of steel
The answer was: they both weigh the same, better luck next time!
"

## Target Audience
StudyAssistant will be targetted mainly towards students that would like to self-revise, but also teachers that want to test their students learned knowledge.

#

## Target Audience Usage

## Instructions on how to use:
Once installed (see bottom of readme for installation instructions) <br />
You can run the game either from the install executable or in your terminal by typing:
```code
./StudyAssistant.sh
```
*Note: this command only works once you have run the installation file*

Then
### Follow prompts given by application
- Menu Options 
   - 'Play'
    - 'Instructions'
    - 'Create/ Manage Questions'
    - 'Quit'

- At any time within the user input prompts, user can enter 'back' to go back up a level in the program

If chosen Quit:
- Ends program

If chosen Instructions
- Application displays instructions on how to play the game, and what to do
- Shows some warnings
- 

If chosen Play:
- Program will display another menu for user to select
  - Choose a Category (user chooses category)
  - Random Category (app chooses category for the user)
  - Mayhem (no assigned categories, all questions)
- Answer the questions or type 'back' to back out of the game

If chosen Create/ Manage questions:
- Create a category
  - Name your category
  - Doesn't allow duplicate names
- Create a question (you need to have a category first)
  - Enter in the question (doesn't allow duplicate questions within the same category)
  - Enter in the answer to that question
Once you think you have created a sufficient amount of questions, go back to the menu and select play.

# 

## Functionality and Features

## Features it will have:
- Creating categories as a hash, able to assign questions to an existing category
- Enter questions and answers as arrays, able to pull upon later
- "Game" will 'sample'(choose at random) from either a specified category, or just from all questions, then once asked, remove questions/ answers from the pool once picked
- User answers the questions then receives a right or wrong feedback
- Sums up answers at the end and provides feedback.

## Nice to have features:
- Multiple users, different saved questions, not view other users questions (login, logout)
- Background music

#
## User Interaction and Experience

#
## Help documentation

## Install the application

If you **do not** have Ruby on your computer, follow these instructions to [download and install](https://www.ruby-lang.org/en/documentation/installation/)

Then:

- Clone the repositry files to your computer from the remote repositry here: https://github.com/jeremytuesley/StudyAssistant

- In the terminal command line, navigate to where you saved the directory you just cloned

- If you do not have the 'bundler' gem installed on your computer, please enter the following code.
 
```code
install bundler
```

- Once completed, to install the program, type this command into your terminal: 

```code
./StudyAssistant_install.sh
```
*If this doesn't work, **first**, check if you are in the correct directory (where you cloned the repositry to), **second** ensure all files from the repositry are there (cross match with github)*

- Once installed, the application will prompt if you wish to launch from the installer. Type in 'y' or 'n'

- If 'n' or if you have exited the game after installing
To now run the program, in your terminal, please type:
```code
./StudyAssistant.sh
```

## Dependencies 

StudyAssistant utilises the following gems that are Mac dependent and will not function properly on other operating systems.

The following Ruby Gems are required and are installed with the installation file, as well as in the Gemfile

- gem "colorize", "~> 0.8.1"

- gem "tty-prompt", "~> 0.23.0"

- gem "tty-font", "~> 0.5.0"

- gem "tty-spinner", "~> 0.9.3"

