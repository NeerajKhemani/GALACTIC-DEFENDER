INCLUDE Irvine32.inc
includelib winmm.lib  

.data
  
title1 byte "  /$$$$$  /$$$$  /$     /$$$$   /$$$$  /$$$$$$$ /$$$$$  /$$$$   /$$$$  /$$$$$ /$$$$$ /$$$$$ /$   /$ /$$$$  /$$$$$ /$$$$ ",0
title2 byte " /$__  $ /$__  $| $    /$_  $ /$__  $|__  $__/|_  $_/ /$__  $  | $_  $| $___/| $___/| $___/| $$ | $| $_  $| $___/| $_  $",0
title3 byte "| $  \_/| $  \ $| $   | $ \ $| $  \_/   | $     | $  | $  \_/  | $ \ $| $    | $    | $    | $$$| $| $ \ $| $    | $ \ $",0
title4 byte "| $ /$$$| $$$$$$| $   | $$$$$| $        | $     | $  | $       | $ | $| $$$  | $$$  | $$$  | $ $$ $| $ | $| $$$  | $$$$/",0
title5 byte "| $|_  $| $__  $| $   | $_  $| $        | $     | $  | $       | $ | $| $_/  | $_/  | $_/  | $  $$$| $ | $| $_/  | $_  $",0
title6 byte "| $  \ $| $  | $| $   | $ | $| $    $   | $     | $  | $    $  | $ | $| $    | $    | $    | $\  $$| $ | $| $    | $ \ $",0
title7 byte "|  $$$$/| $  | $| $$$$| $ | $|  $$$$/   | $    /$$$$$|  $$$$/  | $$$$/| $$$$$| $    | $$$$$| $ \  $| $$$$/| $$$$$| $ | $",0
title8 byte " \____/ |_/  |_/|____/|_/ |_/ \____/    |_/   |____/  \____/   |____/ |_____/|_/    |_____/|_/  \_/|____/ |_____/|_/ |_/",0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
title9 byte  "A CONSOLE BASED SPACE BATTLE GAME",0
title10 byte "DEVELOPED BY : NEERAJ KHEMANI & MUHAMMAD ALI NAQVI          ",0
title11 byte "COURSE       : COMPUTER ORGANIZATION & ASSEMBLY LANGUAGE LAB",0
title12 byte "INSTRUCTOR   : MR. GHULAM QADIR BHURGARI                    ",0
title13 byte "SEMESTER     : FALL 2025                                    ",0
title14 byte "Press any key to continue...",0


menu1 byte "  __  __   _   ___ _  _   __  __ ___ _  _ _   _ ",0
menu2 byte " |  \/  | /_\ |_ _| \| | |  \/  | __| \| | | | |",0
menu3 byte " | |\/| |/ _ \ | || .` | | |\/| | _|| .` | |_| |",0
menu4 byte " |_|  |_/_/ \_\___|_|\_| |_|  |_|___|_|\_|\___/ ",0

menu5 byte  "> 1. Launch Mission               ",0
menu6 byte  "> 2. Pilot Training (Instructions)",0  
menu7 byte  "> 3. Abort Mission (Exit)         ",0
menu8 byte  "Awaiting your command: ",0


instruction1 byte " ___ _   _ ____ _____ ____  _   _  ____ _____ ___ ___  _   _ ____   ",0
instruction2 byte " |_ _| \ | / ___|_   _|  _ \| | | |/ ___|_   _|_ _/ _ \| \ | / ___| ",0
instruction3 byte "  | ||  \| \___ \ | | | |_) | | | | |     | |  | | | | |  \| \___ \ ",0
instruction4 byte "  | || |\  |___) || | |  _ <| |_| | |___  | |  | | |_| | |\  |___) |",0
instruction5 byte " |___|_| \_|____/ |_| |_| \_\\___/ \____| |_| |___\___/|_| \_|____/ ",0
                                                                    


instruction6 byte  "Welcome, Pilot! Your mission is to defend the galaxy   ",0        
instruction7 byte  "from the incoming enemy fleet.                         ",0
instruction8 byte  "                                                       ",0
instruction9 byte  "Controls:                                              ",0
instruction10 byte "   Left Arrow    Move Left                             ",0
instruction11 byte "   Right Arrow   Move Right                            ",0
instruction12 byte "   SPACEBAR      Fire Laser                            ",0
instruction13 byte "   P             Pause / Resume                        ",0
instruction14 byte "   ESC           Exit Game Anytime (Instant Quit)      ",0
instruction15 byte "                                                       ",0
instruction16 byte "Game Rules:                                            ",0
instruction17 byte "* There are 3 levels.                                  ",0
instruction18 byte "* The game starts at level 1.                          ",0
instruction19 byte "* After clearing all enemies, you advance automatically",0
instruction20 byte "  to the next level.                                   ",0
instruction21 byte "* You lose a life if an enemy bullet hits you.         ",0
instruction22 byte "* Game ends when all lives are lost.                   ",0
instruction23 byte "                                                       ",0
instruction24 byte "Scoring:                                               ",0
instruction25 byte "  For level 1: +5 points per enemy destroyed           ",0
instruction26 byte "  For level 2: +10 points per enemy destroyed          ",0
instruction27 byte "  For level 3: +15 points per enemy destroyed          ",0
instruction28 byte "                                                       ",0
instruction29 byte "Press any key to return to MAIN MENU                   ",0

username byte 256 dup(?)
nameinput BYTE "ENTER YOUR NAME: ",0
strEnemies byte "Current Enemies: ",0
strYourName db "YOUR NAME: ",0
strYourScore db "YOUR SCORE: ",0

 
youWin1 byte " __   _____  _   _  __      _____ _  _ ",0
youWin2 byte " \ \ / / _ \| | | | \ \    / /_ _| \| |",0
youWin3 byte "  \ V / (_) | |_| |  \ \/\/ / | || .` |",0
youWin4 byte "   |_| \___/ \___/    \_/\_/ |___|_|\_|",0
                                       
    

VerticalBorder BYTE "|",0
HorizontalBorder1 BYTE "------------------------------------------------------------------------------------------------------------------------",0
HorizontalBorder2 BYTE "________________________________________________________________________________________________________________________",0

    ; Bullet data structure
    MAX_BULLETS = 10
    Bullet STRUCT
        xPos byte ?
        yPos byte ?
        active byte ?
    Bullet ENDS
    bullets Bullet MAX_BULLETS dup(<0,0,0>)

    ; Enemy bullet data structure
    MAX_ENEMY_BULLETS = 100
    EnemyBullet STRUCT
        xPos byte ?
        yPos byte ?
        active byte ?
    EnemyBullet ENDS
    enemyBullets EnemyBullet MAX_ENEMY_BULLETS dup(<0,0,0>)
    enemyFireCounter byte 0
    enemyFireDelay word 1000
    

    MAX_ENEMIES = 15
    Enemy STRUCT
        xPos byte ?
        yPos byte ?
        active byte ?
        direction byte ?
        fireCounter byte ?
    Enemy ENDS
    enemies Enemy MAX_ENEMIES dup(<0,0,0,0,0>)
    currentEnemies byte 5
    enemySpeedCounter byte 0
    enemySpeedDelay byte 15
    enemyHorizontalCounter byte 0
    enemyHorizontalDelay byte 3
    enemyVerticalCounter byte 0
    enemyVerticalDelay byte 60
    

    ; Level 3 specific data
    level3RandomCounter byte 0
    level3RandomDelay byte 3
    

    ; Game state
    strResult db 16 dup (0)
    iteration byte 1
    count word 0
    lives word 3
    level byte 1
    gamespeed byte 100
    strScore BYTE "SCORE : ",0
    strLives BYTE "LIVES : ",0
    strPause BYTE "PAUSE",0
    strLevel BYTE "LEVEL : ",0
    score word 1
    

    ; Player position
    xPos BYTE 60
    yPos BYTE 28
    
    inputChar BYTE ?
    collision byte 0
    

gameover1 byte "   ___   _   __  __ ___    _____   _____ ___ ",0
gameover2 byte "  / __| /_\ |  \/  | __|  / _ \ \ / / __| _ \",0
gameover3 byte " | (_ |/ _ \| |\/| | _|  | (_) \ V /| _||   /",0
gameover4 byte "  \___/_/ \_\_|  |_|___|  \___/ \_/ |___|_|_\",0
                                             
strPlayerStats byte "PLAYER STATISTICS",0
strPlayerNameLabel byte "PLAYER NAME: ",0
strFinalScoreLabel byte "FINAL SCORE: ",0
strLevelReached byte "LEVEL REACHED: ",0
playagain byte "Do you want to play again? (Y|N): ",0


thankYou1 byte " _____ _  _   _   _  _ _  ____   _____  _   _ ",0
thankYou2 byte "|_   _| || | /_\ | \| | |/ /\ \ / / _ \| | | |",0
thankYou3 byte "  | | | __ |/ _ \| .` | ' <  \ V / (_) | |_| |",0
thankYou4 byte "  |_| |_||_/_/ \_\_|\_|_|\_\  |_| \___/ \___/ ",0

thankYou5 byte "            FOR PLAYING GALACTIC DEFENDER!           ",0
thankYou6 byte "We hope you enjoyed this Assembly language adventure!",0
thankYou7 byte "Challenge yourself to beat your high score next time!",0

thankYou8 byte "Press any key to exit the game...",0

strCongratulations byte "CONGRATULATIONS! YOU'VE COMPLETED ALL LEVELS!",0
strWinnerStats byte "WINNER STATISTICS",0


BLACK       EQU 0
BLUE        EQU 1
GREEN       EQU 2
CYAN        EQU 3
RED         EQU 4
MAGENTA     EQU 5
BROWN       EQU 6
LIGHTGRAY   EQU 7
DARKGRAY    EQU 8
LIGHTBLUE   EQU 9
LIGHTGREEN  EQU 10
LIGHTCYAN   EQU 11
LIGHTRED    EQU 12
LIGHTMAGENTA EQU 13
YELLOW      EQU 14
WHITE       EQU 15

BG_BLACK      EQU (0 SHL 4)
BG_BLUE      EQU (1 SHL 4)
BG_GREEN     EQU (2 SHL 4)
BG_RED       EQU (4 SHL 4)
BG_WHITE     EQU (15 SHL 4)

PlaySoundA PROTO, pszSound:PTR BYTE, hmod:DWORD, fdwSound:DWORD

BOOM byte "main-player-sound.wav",0
DISHOOM byte "goDISHOOM.wav",0
ThankyouSound byte "goTHANKYOU.wav",0
MenuSound byte "goMENU.wav",0
TitleSound byte "goWELCOME.wav",0

.code
main PROC
    call TitleDisplay       
    call MainMenuDisplay              
    call GameMain
    exit
main ENDP

TitleDisplay PROC
    INVOKE PlaySoundA, OFFSET TitleSound, NULL, 20001H      
    call clrscr
    
    mov eax, RED + BG_BLACK
    call SetTextColor

    mov ecx, 8
    mov ah, 4
    mov esi, OFFSET title1

    DisplayLoop1:

    mov dl, 0
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF title1
    inc ah

    loop DisplayLoop1

    mov eax, LIGHTGREEN + BG_BLACK
    call SetTextColor

    mov dl, 40
    mov dh, 15
    call Gotoxy
    mov edx, offset title9
    call WriteString
    

    mov eax, LIGHTBLUE + BG_BLACK
    call SetTextColor

    mov ecx, 4
    mov ah, 19
    mov esi, OFFSET title10

    DisplayLoop2:

    mov dl, 30
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF title10
    inc ah

    loop DisplayLoop2

    mov eax, WHITE + BG_BLACK
    call SetTextColor

    mov dl, 45
    mov dh, 27
    call Gotoxy
    mov edx, offset title14
    call WriteString
    
    call ReadChar
    call clrscr

    ret
TitleDisplay ENDP

MainMenuDisplay PROC
    INVOKE PlaySoundA, OFFSET MenuSound, NULL, 20001H     
    call clrscr
    
L1:

    mov eax, RED + BG_BLACK
    call SetTextColor

    mov ecx, 8
    mov ah, 4
    mov esi, OFFSET title1

    DisplayLoop3:

    mov dl, 0
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF title1
    inc ah

    loop DisplayLoop3

    mov eax, WHITE + BG_BLACK
    call SetTextColor
    
    mov ecx, 4
    mov ah, 14
    mov esi, OFFSET menu1

    DisplayLoop4:

    mov dl, 30
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF menu1
    inc ah

    loop DisplayLoop4
    
    mov eax, lightGreen + BG_BLACK
    call SetTextColor

    mov ecx, 3
    mov ah, 20
    mov esi, OFFSET menu5

    DisplayLoop5:

    mov dl, 35
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF menu5
    inc ah

    loop DisplayLoop5

    mov eax, WHITE + BG_BLACK
    call SetTextColor
    mov dl, 40
    mov dh, 28
    call Gotoxy
    mov edx, OFFSET menu8
    call WriteString

    call ReadChar
    
    cmp al, '1'
    je LaunchMission
    cmp al, '2'
    je Instructions
    cmp al, '3'
    je EXIT_PROGRAM
    
    jmp L1

LaunchMission:
    call clrscr
    ret
    
Instructions:
    call DisplayInstructions
    ret
    
EXIT_PROGRAM:
    call clrscr
    exit    
MainMenuDisplay ENDP


DisplayInstructions PROC
    call clrscr
    
    mov eax, WHITE + BG_BLACK
    call SetTextColor
    
    mov ecx, 5
    mov ah, 0
    mov esi, OFFSET instruction1

    DisplayLoop6:

    mov dl, 30
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF instruction1
    inc ah

    loop DisplayLoop6

    mov eax, lightGreen + BG_BLACK
    call SetTextColor

    mov ecx, 23
    mov ah, 6
    mov esi, OFFSET instruction6

    DisplayLoop7:

    mov dl, 20
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF instruction6
    inc ah

    loop DisplayLoop7

    mov eax, WHITE + BG_BLACK
    call SetTextColor
    mov dl, 40
    mov dh, 30
    call Gotoxy
    mov edx, OFFSET instruction29
    call WriteString

    call ReadChar
    call MainMenuDisplay

    ret
DisplayInstructions ENDP

GameMain PROC             
    call GameStart
    call GameMainLoop
    call EndGame
    exit
GameMain ENDP

GameStart PROC
    call ReadName
    call DrawBorder
    call Level1
    ret
GameStart ENDP

ReadName PROC

    mov eax, RED + BG_BLACK
    call SetTextColor

    mov ecx, 8
    mov ah, 4
    mov esi, OFFSET title1

    DisplayLoop12:

    mov dl, 0
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF title1
    inc ah

    loop DisplayLoop12

    mov eax, CYAN + BG_BLACK
    call SetTextColor

    mov dl, 30
    mov dh, 15
    call Gotoxy
    mov edx, OFFSET nameinput
    call Writestring

    mov eax, WHITE + BG_BLACK
    call SetTextColor
    mov edx, OFFSET username
    mov ecx, LENGTHOF username
    call Readstring
    call clrscr
ret
ReadName ENDP

DrawBorder PROC
    mov eax, CYAN + BG_BLACK
    call SetTextColor
    
    mov dl, 0
    mov dh, 2
    call Gotoxy
    mov edx, OFFSET HorizontalBorder1
    call WriteString
    
    mov dl, 0
    mov dh, 29
    call Gotoxy
    mov edx, OFFSET HorizontalBorder2
    call WriteString
    
    mov dl, 0
    mov dh, 2
    mov ecx, 28
LeftBorder:
    call Gotoxy
    mov al, VerticalBorder
    call WriteChar
    inc dh
    loop LeftBorder
    
    mov dl, 119
    mov dh, 2
    mov ecx, 28
RightBorder:
    call Gotoxy
    mov al, VerticalBorder
    call WriteChar
    inc dh
    loop RightBorder

    ret
DrawBorder ENDP

DrawPlayer PROC
    mov eax, WHITE + BG_BLACK
    call SetTextColor
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    mov al, 'X'
    call WriteChar
    ret
DrawPlayer ENDP

UpdatePlayer PROC
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    mov al, " "
    call WriteChar
    ret
UpdatePlayer ENDP

DrawEnemy PROC
    push esi
    mov dl, (Enemy PTR [esi]).xPos
    mov dh, (Enemy PTR [esi]).yPos
    call Gotoxy
    mov eax, RED + BG_BLACK
    call SetTextColor
    mov al, 'V'
    call WriteChar
    pop esi
    ret
DrawEnemy ENDP

EraseEnemy PROC
    push esi
    mov dl, (Enemy PTR [esi]).xPos
    mov dh, (Enemy PTR [esi]).yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    pop esi
    ret
EraseEnemy ENDP

Level1 PROC
    mov currentEnemies, 5
    mov level, 1
    mov gamespeed, 100
    mov lives, 3
    mov enemyHorizontalDelay, 3
    mov enemyVerticalDelay, 60

    call PlaceEnemies1
    call DrawPlayer
    ret
Level1 ENDP

PlaceEnemies1 PROC
    mov ecx, 5
    mov esi, OFFSET enemies
    mov bl, 20
    
EnemyLoop1:
    mov (Enemy PTR [esi]).xPos, bl
    mov (Enemy PTR [esi]).yPos, 3
    mov (Enemy PTR [esi]).active, 1
    mov (Enemy PTR [esi]).direction, 1
    mov (Enemy PTR [esi]).fireCounter, 0
    
    call DrawEnemy
    add bl, 20
    add esi, TYPE Enemy
    loop EnemyLoop1
    ret
PlaceEnemies1 ENDP

Level2 PROC
    mov currentEnemies, 10
    mov level, 2
    mov gamespeed, 75
    mov lives, 10
    mov enemyHorizontalCounter, 0
    mov enemyVerticalCounter, 0
    mov enemyHorizontalDelay, 1     
    mov enemyVerticalDelay, 50     
    
    call PlaceEnemies2
    call ClearAllBullets
    call DrawPlayer
    ret
Level2 ENDP

PlaceEnemies2 PROC
    mov ecx, 10
    mov esi, OFFSET enemies
    mov bl, 12
    
EnemyLoop2:
    mov (Enemy PTR [esi]).xPos, bl
    mov (Enemy PTR [esi]).yPos, 3
    mov (Enemy PTR [esi]).active, 1
    ; Random direction (0 or 1)
    push esi
    mov eax, 2
    call RandomRange
    pop esi
    mov (Enemy PTR [esi]).direction, al
    call GetRandomFireDelayLevel2
    mov (Enemy PTR [esi]).fireCounter, al
    
    call DrawEnemy
    add ebx, 10
    add esi, TYPE Enemy
    loop EnemyLoop2
    ret
PlaceEnemies2 ENDP

GetRandomFireDelayLevel2 PROC
    push edx
    push ecx
    mov eax, 25         
    call RandomRange
    add eax, 15
    pop ecx
    pop edx
    ret
GetRandomFireDelayLevel2 ENDP

Level3 PROC
    mov currentEnemies, 15
    mov level, 3
    mov gamespeed, 50
    mov lives, 15
    mov enemyHorizontalCounter, 0
    mov enemyVerticalCounter, 0
    mov level3RandomCounter, 0
    mov level3RandomDelay, 1         
    
    call PlaceEnemies3     
    call ClearAllBullets
    call DrawPlayer
    ret
Level3 ENDP

PlaceEnemies3 PROC
    mov ecx, 15
    mov esi, OFFSET enemies
    
EnemyLoop3:
    push ecx
    push esi
    
    ; Random X position b/w 2 and 117 (inside grid boundaries)
    mov eax, 116          
    call RandomRange
    add eax, 2           
    pop esi
    mov (Enemy PTR [esi]).xPos, al
    
    ; Random Y position b/w 3 and 8 (inside grid boundaries)
    push esi
    mov eax, 6            
    call RandomRange
    add eax, 3           
    pop esi
    mov (Enemy PTR [esi]).yPos, al
    
    mov (Enemy PTR [esi]).active, 1
    
    ; Random direction (0 or 1)
    push esi
    mov eax, 2
    call RandomRange
    pop esi
    mov (Enemy PTR [esi]).direction, al
    
    call GetRandomFireDelayLevel3
    mov (Enemy PTR [esi]).fireCounter, al
    
    call DrawEnemy
    
    pop ecx
    add esi, TYPE Enemy
    loop EnemyLoop3
    ret
PlaceEnemies3 ENDP

GetRandomFireDelayLevel3 PROC
    push edx
    push ecx
    mov eax, 35         
    call RandomRange
    add eax, 20
    pop ecx
    pop edx
    ret
GetRandomFireDelayLevel3 ENDP

; BULLET PROCEDURES

CreateBullet PROC
    mov ecx, MAX_BULLETS
    mov esi, OFFSET bullets
    
Find:
    cmp (Bullet PTR [esi]).active, 0
    je Create
    add esi, TYPE Bullet
    loop Find
    ret
    
Create:
    mov al, xPos
    mov (Bullet PTR [esi]).xPos, al
    mov al, yPos
    dec al
    mov (Bullet PTR [esi]).yPos, al
    mov (Bullet PTR [esi]).active, 1
    
    mov dl, (Bullet PTR [esi]).xPos
    mov dh, (Bullet PTR [esi]).yPos
    call Gotoxy
    mov eax, YELLOW + BG_BLACK
    call SetTextColor
    mov al, '|'
    call WriteChar

    ret
CreateBullet ENDP

EraseBullet PROC
    push edi
    mov dl, (Bullet PTR [edi]).xPos
    mov dh, (Bullet PTR [edi]).yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    pop edi
    ret
EraseBullet ENDP

GameMainLoop PROC
MainLoop:
    call CheckLives
    call HandleInput
    call UpdateGame
    call DisplayInfo
    call GameDelay
    jmp MainLoop
    
EndLoop:
    ret
GameMainLoop ENDP

CheckLives PROC
    cmp lives, 0
    je GameOver
    ret
    
GameOver:
    call EndGame
    exit
CheckLives ENDP

HandleInput PROC
    call ReadKey
    jz HI_End
    
    cmp al, 0
    jne HI
    call HandleMovement
    jmp HI_End
    
HI:
    mov inputChar, al
    cmp inputChar, 1Bh
    je HI_Exit
    cmp inputChar, "P"
    je HI_Pause
    cmp inputChar, "p"    
    je HI_Pause
    cmp inputChar, ' '
    je HI_Fire
    jmp HI_End
    
HI_Fire:
    INVOKE PlaySoundA, OFFSET BOOM, NULL, 20001H   
    call CreateBullet
    jmp HI_End
    
HI_Pause:
    call PauseGame
    jmp HI_End
    
HI_Exit:
    call EndGame
    exit
    
HI_End:
    ret
HandleInput ENDP

HandleMovement PROC
    cmp ah, 48h
    je UP
    cmp ah, 50h
    je DOWN
    cmp ah, 4Bh
    je LEFT
    cmp ah, 4Dh
    je RIGHT
    ret
    
UP:
    call MoveUp
    ret
    
DOWN:
    call MoveDown
    ret
    
LEFT:
    call MoveLeft
    ret
    
RIGHT:
    call MoveRight
    ret
HandleMovement ENDP

MoveUp PROC
    cmp yPos, 4
    je MU_End
    call UpdatePlayer
    dec yPos
    call DrawPlayer
MU_End:
    ret
MoveUp ENDP

MoveDown PROC
    cmp yPos, 28
    je MD_End
    call UpdatePlayer
    inc yPos
    call DrawPlayer
MD_End:
    ret
MoveDown ENDP

MoveLeft PROC
    cmp xPos, 1
    je ML_End
    call UpdatePlayer
    dec xPos
    call DrawPlayer
ML_End:
    ret
MoveLeft ENDP

MoveRight PROC
    cmp xPos, 118
    je MR_End
    call UpdatePlayer
    inc xPos
    call DrawPlayer
MR_End:
    ret
MoveRight ENDP

UpdateGame PROC
    call UpdateBullets
    call CheckEnemyUpdate
    call UpdateEnemyBullets
    call CheckCollisions
    call CheckLevelComplete
 
    ret
UpdateGame ENDP

UpdateBullets PROC
    mov ecx, MAX_BULLETS
    mov esi, OFFSET bullets
    
Update:
    cmp (Bullet PTR [esi]).active, 1
    jne Next
    
    mov dl, (Bullet PTR [esi]).xPos
    mov dh, (Bullet PTR [esi]).yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    
    dec (Bullet PTR [esi]).yPos
    
    cmp (Bullet PTR [esi]).yPos, 2
    jle Deact
    
    mov dl, (Bullet PTR [esi]).xPos
    mov dh, (Bullet PTR [esi]).yPos
    call Gotoxy
    mov eax, YELLOW + BG_BLACK
    call SetTextColor
    mov al, '|'
    call WriteChar
    jmp Next
    
Deact:
    mov (Bullet PTR [esi]).active, 0
    
NEXT:
    add esi, TYPE Bullet
    loop Update 
    ret
UpdateBullets ENDP

CheckEnemyUpdate PROC
    inc enemySpeedCounter
    mov al, enemySpeedCounter
    cmp al, enemySpeedDelay
    jb CEU_Movement
    
    mov enemySpeedCounter, 0
    cmp level, 1
    je CEU_L1
    cmp level, 2
    je CEU_L2
    cmp level, 3
    je CEU_L3
    jmp CEU_Movement
    
CEU_L1:
    call UpdateLevel1Enemies
    jmp CEU_Movement
    
CEU_L2:
    call UpdateLevel2Enemies
    jmp CEU_Movement
    
CEU_L3:
    call UpdateLevel3Enemies 
    
CEU_Movement:
    cmp level, 3
    je CEU_3
    cmp level, 2
    je CEU_2
    jmp CEU_End

CEU_2:
   call UpdateEnemyFiringLevel2
    jmp CEU_End
    
CEU_3:
   call UpdateEnemyFiringLevel3
    
CEU_End:
    ret
CheckEnemyUpdate ENDP

UpdateLevel1Enemies PROC
    mov ecx, 5
    mov esi, OFFSET enemies
    
UL1_Loop:
    cmp (Enemy PTR [esi]).active, 1
    jne UL1_Next

    cmp (Enemy PTR [esi]).yPos, 24
    je UL1_Next
    call EraseEnemy
    inc (Enemy PTR [esi]).yPos

    cmp (Enemy PTR [esi]).yPos, 24
    jle UL1_Draw
    jmp UL1_Next
    
UL1_Draw:
    call DrawEnemy
    
UL1_Next:
    add esi, TYPE Enemy
    loop UL1_Loop

    ret
UpdateLevel1Enemies ENDP

UpdateLevel2Enemies PROC
    inc enemyHorizontalCounter
    mov al, enemyHorizontalCounter
    cmp al, enemyHorizontalDelay    
    jb UL2EM_Vertical
    
    mov enemyHorizontalCounter, 0
    call MoveEnemiesHorizontalFast   
    
UL2EM_Vertical:
    inc enemyVerticalCounter
    mov al, enemyVerticalCounter
    cmp al, enemyVerticalDelay      
    jb UL2EM_End
    
    mov enemyVerticalCounter, 0
    call MoveEnemiesVerticalFast    
    
UL2EM_End:
    ret
UpdateLevel2Enemies ENDP

MoveEnemiesHorizontalFast PROC
    mov ecx, 10
    mov esi, OFFSET enemies
    
MEHF_Loop:
    cmp (Enemy PTR [esi]).active, 1
    jne MEHF_Next
    
    call EraseEnemy
    
    cmp (Enemy PTR [esi]).direction, 1
    je MEHF_Right
    
    ; Move left (3 pixels)
    mov al, (Enemy PTR [esi]).xPos
    sub al, 3
    cmp al, 1
    jg MEHF_SetLeft
    mov (Enemy PTR [esi]).direction, 1
    mov (Enemy PTR [esi]).xPos, 1
    jmp MEHF_Draw
MEHF_SetLeft:
    mov (Enemy PTR [esi]).xPos, al
    jmp MEHF_Draw
    
MEHF_Right:
    ; Move right (3 pixels)
    mov al, (Enemy PTR [esi]).xPos
    add al, 3
    cmp al, 118
    jl MEHF_SetRight
    mov (Enemy PTR [esi]).direction, 0
    mov (Enemy PTR [esi]).xPos, 118
    jmp MEHF_Draw
MEHF_SetRight:
    mov (Enemy PTR [esi]).xPos, al
    
MEHF_Draw:
    call DrawEnemy
    
MEHF_Next:
    add esi, TYPE Enemy
    loop MEHF_Loop
    ret
MoveEnemiesHorizontalFast ENDP

MoveEnemiesVerticalFast PROC
    mov ecx, 10
    mov esi, OFFSET enemies
    
MEVF_Loop:
    cmp (Enemy PTR [esi]).active, 1
    jne MEVF_Next
    
    call EraseEnemy
    add (Enemy PTR [esi]).yPos, 2    ; Move down 2 pixels at once
    
    cmp (Enemy PTR [esi]).yPos, 28
    jle MEVF_Draw
    mov (Enemy PTR [esi]).yPos, 28
    
MEVF_Draw:
    call DrawEnemy
    
MEVF_Next:
    add esi, TYPE Enemy
    loop MEVF_Loop
    ret
MoveEnemiesVerticalFast ENDP

UpdateLevel3Enemies PROC
    inc level3RandomCounter
    mov al, level3RandomCounter
    cmp al, level3RandomDelay       
    jb UL3_End
    
    mov level3RandomCounter, 0
    call MoveLevel3EnemiesRandomPattern
    
UL3_End:
    ret
UpdateLevel3Enemies ENDP

MoveLevel3EnemiesRandomPattern PROC
    mov ecx, 15
    mov esi, OFFSET enemies
    
ML3RP_Loop:
    cmp (Enemy PTR [esi]).active, 1
    jne ML3RP_Next
    
    call EraseEnemy
    
    ; Enhanced random movement (0=left, 1=right, 2-4=down, 5=up)
    push ecx
    push esi
    mov eax, 6
    call RandomRange
    pop esi
    pop ecx
    
    cmp eax, 0
    je ML3RP_Left
    cmp eax, 1
    je ML3RP_Right
    cmp eax, 5
    je ML3RP_Up
    ; Cases 2,3,4 all go down
    jmp ML3RP_Down
    
ML3RP_Left:
    mov al, (Enemy PTR [esi]).xPos
    cmp al, 2
    jle ML3RP_Draw
    sub (Enemy PTR [esi]).xPos, 1
    jmp ML3RP_Draw
    
ML3RP_Right:
    mov al, (Enemy PTR [esi]).xPos
    cmp al, 117
    jge ML3RP_Draw
    inc (Enemy PTR [esi]).xPos
    jmp ML3RP_Draw
    
ML3RP_Down:
    mov al, (Enemy PTR [esi]).yPos
    cmp al, 27
    jge ML3RP_Draw
    inc (Enemy PTR [esi]).yPos
    jmp ML3RP_Draw
    
ML3RP_Up:
    mov al, (Enemy PTR [esi]).yPos
    cmp al, 4
    jle ML3RP_Draw
    dec (Enemy PTR [esi]).yPos
    
ML3RP_Draw:
    call DrawEnemy
    
ML3RP_Next:
    add esi, TYPE Enemy
    loop ML3RP_Loop
    ret
MoveLevel3EnemiesRandomPattern ENDP

UpdateEnemyFiringLevel3 PROC
    mov ecx, 15
    mov esi, OFFSET enemies
    
UL3EF_Loop:
    cmp (Enemy PTR [esi]).active, 1
    jne UL3EF_Next
    
    inc (Enemy PTR [esi]).fireCounter
    
    push ecx
    push esi
    call GetRandomFireDelayLevel3
    pop esi
    mov bl, al
    pop ecx
    
    mov al, (Enemy PTR [esi]).fireCounter
    cmp al, bl
    jb UL3EF_Next
    
    mov (Enemy PTR [esi]).fireCounter, 0
    call CreateEnemyBulletFromEnemy
    
UL3EF_Next:
    add esi, TYPE Enemy
    loop UL3EF_Loop
    ret
UpdateEnemyFiringLevel3 ENDP

UpdateEnemyFiringLevel2 PROC
    mov ecx, 10
    mov esi, OFFSET enemies
    
UEFL2_Loop:
    cmp (Enemy PTR [esi]).active, 1
    jne UEFL2_Next
    
    inc (Enemy PTR [esi]).fireCounter
    
    mov bl, 30 
    
    mov al, (Enemy PTR [esi]).fireCounter
    cmp al, bl
    jb UEFL2_Next
    
    mov (Enemy PTR [esi]).fireCounter, 0
    call CreateEnemyBulletFromEnemy
    
UEFL2_Next:
    add esi, TYPE Enemy
    loop UEFL2_Loop
    ret
UpdateEnemyFiringLevel2 ENDP

DisplayInfo PROC
    mov eax, YELLOW + BG_BLACK
    call SetTextColor
    mov dl, 0
    mov dh, 0
    call Gotoxy
    mov edx, OFFSET strScore
    call WriteString
    
    mov dl, 8
    mov dh, 0
    call Gotoxy
    mov al, ' '
    call WriteChar    
    call WriteChar    
    call WriteChar    
    
    ; Position cursor back and write score
    mov dl, 8
    mov dh, 0
    call Gotoxy
    movzx eax, score
    call writedec
    
    mov eax, YELLOW + BG_BLACK
    call SetTextColor
    mov dl, 100
    mov dh, 0
    call Gotoxy
    mov edx, offset strLevel
    call WriteString
    
    mov dl, 108
    mov dh, 0
    call Gotoxy
    mov al, ' '
    call WriteChar    
    
    mov dl, 108
    mov dh, 0
    call Gotoxy
    movzx eax, level
    call writedec
    
    mov eax, YELLOW + BG_BLACK
    call SetTextColor
    mov dl, 0
    mov dh, 1
    call Gotoxy
    mov edx, OFFSET strLives
    call WriteString
        
    mov dl, 8
    mov dh, 1
    call Gotoxy
    mov al, ' '
    call WriteChar    
    call WriteChar    
   
    mov dl, 8
    mov dh, 1
    call Gotoxy
    movzx eax, lives
    call writedec
    
    mov eax, YELLOW + BG_BLACK
    call SetTextColor
    mov dl, 100
    mov dh, 1
    call Gotoxy
    mov edx, offset strEnemies
    call WriteString
    

    mov dl, 117
    mov dh, 1
    call Gotoxy
    mov al, ' '
    call WriteChar    
    call WriteChar    
    
    mov dl, 117
    mov dh, 1  
    call Gotoxy
    movzx eax, currentEnemies
    call writedec
    
    mov eax, WHITE + BG_BLACK
    call SetTextColor
    
    ret
DisplayInfo ENDP

; ========== COLLISION PROCEDURES ==========
CheckCollisions PROC
    call CheckBulletEnemyHit
    call CheckPlayerEnemyHit
    call CheckEnemyBulletPlayerHit
    ret
CheckCollisions ENDP

CheckBulletEnemyHit PROC
    mov edi, OFFSET bullets
    mov ecx, MAX_BULLETS
    
    ; Determine enemy count based on level
    mov ebx, 5
    cmp level, 2
    jne CBEH_CheckLevel3
    mov ebx, 10
    jmp CBEH_Start
    
CBEH_CheckLevel3:
    cmp level, 3
    jne CBEH_Start
    mov ebx, 15
    
CBEH_Start:
CBEH_BLoop:
    cmp (Bullet PTR [edi]).active, 1
    jne CBEH_BNext
    
    mov esi, OFFSET enemies
    push ecx
    mov ecx, ebx
    
CBEH_ELoop:
    cmp (Enemy PTR [esi]).active, 1
    jne CBEH_ENext
    
    mov al, (Bullet PTR [edi]).xPos
    cmp al, (Enemy PTR [esi]).xPos
    jne CBEH_ENext
    
    mov al, (Bullet PTR [edi]).yPos
    cmp al, (Enemy PTR [esi]).yPos
    jne CBEH_ENext
    
    call EraseBullet
    call EraseEnemy
    mov (Bullet PTR [edi]).active, 0
    mov (Enemy PTR [esi]).active, 0
    add score, 5
    dec currentEnemies
    pop ecx
    jmp CBEH_BNext
    
CBEH_ENext:
    add esi, TYPE Enemy
    loop CBEH_ELoop
    
    pop ecx
CBEH_BNext:
    add edi, TYPE Bullet
    loop CBEH_BLoop
    ret
CheckBulletEnemyHit ENDP

CheckPlayerEnemyHit PROC
    ; Determine enemy count based on level
    mov ecx, 5
    cmp level, 2
    jne CPEH_CheckLevel3
    mov ecx, 10
    jmp CPEH_Start
    
CPEH_CheckLevel3:
    cmp level, 3
    jne CPEH_Start
    mov ecx, 15
    
CPEH_Start:
    mov esi, OFFSET enemies
    
CPEH_Loop:
    cmp (Enemy PTR [esi]).active, 1
    jne CPEH_Next
    
    mov al, (Enemy PTR [esi]).xPos
    cmp al, xPos
    jne CPEH_Next
    
    mov al, (Enemy PTR [esi]).yPos
    cmp al, yPos
    jne CPEH_Next
    
    dec lives
    mov (Enemy PTR [esi]).active, 0
    dec currentEnemies
    call EraseEnemy
    
CPEH_Next:
    add esi, TYPE Enemy
    loop CPEH_Loop
    ret
CheckPlayerEnemyHit ENDP

CheckEnemyBulletPlayerHit PROC
    mov ecx, MAX_ENEMY_BULLETS
    mov esi, OFFSET enemyBullets
    
CEBPH_Loop:
    cmp (EnemyBullet PTR [esi]).active, 1
    jne CEBPH_Next
    
    mov al, (EnemyBullet PTR [esi]).xPos
    cmp al, xPos
    jne CEBPH_Next
    
    mov al, (EnemyBullet PTR [esi]).yPos
    cmp al, yPos
    jne CEBPH_Next
    
    call EraseEnemyBullet
    mov (EnemyBullet PTR [esi]).active, 0
    dec lives
    
    push esi
    call FlashPlayer
    pop esi
    
CEBPH_Next:
    add esi, TYPE EnemyBullet
    loop CEBPH_Loop
    ret
CheckEnemyBulletPlayerHit ENDP

FlashPlayer PROC
    mov eax, RED + BG_BLACK
    call SetTextColor
    call DrawPlayer
    
    mov eax, 50
    call Delay
    
    mov eax, YELLOW + BG_BLACK
    call SetTextColor
    call DrawPlayer
    ret
FlashPlayer ENDP

; ========== ENEMY BULLET PROCEDURES ==========
CreateEnemyBulletFromEnemy PROC
    push ecx
    push esi
    
    mov ecx, MAX_ENEMY_BULLETS
    mov edi, OFFSET enemyBullets
    
CEBFE_Slot:
    cmp (EnemyBullet PTR [edi]).active, 0
    je CEBFE_Create
    add edi, TYPE EnemyBullet
    loop CEBFE_Slot
    
    pop esi
    pop ecx
    ret
    
CEBFE_Create:
    mov al, (Enemy PTR [esi]).xPos
    mov (EnemyBullet PTR [edi]).xPos, al
    
    mov al, (Enemy PTR [esi]).yPos
    inc al
    cmp al, 28
    jge CEBFE_Skip
    mov (EnemyBullet PTR [edi]).yPos, al
    mov (EnemyBullet PTR [edi]).active, 1
    
    push esi
    mov esi, edi
    call DrawEnemyBullet
    pop esi
    
CEBFE_Skip:
    pop esi
    pop ecx
    ret
CreateEnemyBulletFromEnemy ENDP

UpdateEnemyBullets PROC
    mov ecx, MAX_ENEMY_BULLETS
    mov esi, OFFSET enemyBullets
    
UEB_Loop:
    cmp (EnemyBullet PTR [esi]).active, 1
    jne UEB_Next
    
    call EraseEnemyBullet
    inc (EnemyBullet PTR [esi]).yPos
    
    cmp (EnemyBullet PTR [esi]).yPos, 28
    jg UEB_Deact
    
    call DrawEnemyBullet
    jmp UEB_Next
    
UEB_Deact:
    mov (EnemyBullet PTR [esi]).active, 0
    
UEB_Next:
    add esi, TYPE EnemyBullet
    loop UEB_Loop
    ret
UpdateEnemyBullets ENDP

DrawEnemyBullet PROC
    push esi
    mov dl, (EnemyBullet PTR [esi]).xPos
    mov dh, (EnemyBullet PTR [esi]).yPos
    
    cmp dl, 1
    jle DEB_Skip
    cmp dl, 118
    jge DEB_Skip
    cmp dh, 3
    jle DEB_Skip
    cmp dh, 27
    jg DEB_Skip
    
    call Gotoxy
    
    ; Check level and set appropriate color
    cmp level, 2
    je DEB_Level2
    cmp level, 3
    je DEB_Level3
 
    mov eax, BROWN + BG_BLACK
    jmp DEB_Draw
    
DEB_Level2:
    mov eax, BROWN + BG_BLACK  
    jmp DEB_Draw
    
DEB_Level3:
    mov eax, BROWN + BG_BLACK
    
DEB_Draw:
    call SetTextColor
    mov al, '*'   
    call WriteChar
    
DEB_Skip:
    pop esi
    ret 
DrawEnemyBullet ENDP


EraseEnemyBullet PROC
    push esi
    mov dl, (EnemyBullet PTR [esi]).xPos
    mov dh, (EnemyBullet PTR [esi]).yPos
    
    cmp dl, 1
    jle EEB_Skip
    cmp dl, 118
    jge EEB_Skip
    cmp dh, 3
    jle EEB_Skip
    cmp dh, 27
    jg EEB_Skip
    
    call Gotoxy
    mov al, ' '
    call WriteChar
    
EEB_Skip:
    pop esi
    ret
EraseEnemyBullet ENDP



; ========== UTILITY PROCEDURES ==========
ClearAllBullets PROC
    mov ecx, MAX_BULLETS
    mov esi, OFFSET bullets
CAB_Loop:
    cmp (Bullet PTR [esi]).active, 1
    jne CAB_Skip
    call EraseBullet
CAB_Skip:
    mov (Bullet PTR [esi]).active, 0
    add esi, TYPE Bullet
    loop CAB_Loop
    
    mov ecx, MAX_ENEMY_BULLETS
    mov esi, OFFSET enemyBullets
CAB_Loop2:
    cmp (EnemyBullet PTR [esi]).active, 1
    jne CAB_Skip2
    call EraseEnemyBullet
CAB_Skip2:
    mov (EnemyBullet PTR [esi]).active, 0
    add esi, TYPE EnemyBullet
    loop CAB_Loop2
    ret
ClearAllBullets ENDP


GameDelay PROC
    movzx eax, gamespeed
    call Delay
    ret
GameDelay ENDP

PauseGame PROC
    mov dh, 0
    mov dl, 50
    call gotoxy
    mov edx, offset strPause
    call WriteString
    call ReadChar
    
    mov al, " "
    mov ecx, 5
    mov dl, 50
    mov dh, 0
PG_Clear:
    call gotoxy
    call writechar
    inc dl
    loop PG_Clear
    ret
PauseGame ENDP

CheckLevelComplete PROC
    cmp currentEnemies, 0
    jne CLC_End
    
    cmp level, 1
    je CLC_L2
    cmp level, 2
    je CLC_L3
    cmp level, 3
    je CLC_Win
    jmp CLC_End
    
CLC_L2:
    call clrscr
    call DrawBorder
    call Level2
    jmp CLC_End
    
CLC_L3:
    call clrscr
    call DrawBorder
    call Level3
    jmp CLC_End
    
CLC_Win:
    call WinGame
    exit
    
CLC_End:
    ret
CheckLevelComplete ENDP

WinGame PROC
    call clrScr
    
    mov eax, RED + BG_BLACK
    call SetTextColor

    mov ecx, 8
    mov ah, 4
    mov esi, OFFSET title1

    DisplayLoop8:

    mov dl, 0
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF title1
    inc ah

    loop DisplayLoop8

     mov eax, WHITE + BG_BLACK
    call SetTextColor
    
    mov ecx, 4
    mov ah, 14
    mov esi, OFFSET youwin1

    DisplayLoop11:

    mov dl, 30
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF youwin1
    inc ah

    loop DisplayLoop11

    mov eax, YELLOW + BG_BLACK
    call SetTextColor
    mov dl, 20
    mov dh, 19
    call Gotoxy
    mov edx, offset strCongratulations
    call WriteString
    
    ; Display winner information
    mov eax, LIGHTGREEN + BG_BLACK
    call SetTextColor
    mov dl, 20
    mov dh, 21
    call Gotoxy
    mov edx, offset strWinnerStats
    call WriteString
    
    ; Display winner name
    mov eax, LIGHTCYAN + BG_BLACK
    call SetTextColor
    mov dl, 30
    mov dh, 23
    call Gotoxy
    mov edx, offset strYourName
    call WriteString
    
    mov eax, WHITE + BG_BLACK
    call SetTextColor
    mov edx, offset username
    call WriteString
    
    ; Display final score
    mov eax, LIGHTCYAN + BG_BLACK
    call SetTextColor
    mov dl, 30
    mov dh, 25
    call Gotoxy
    mov edx, offset strYourScore
    call WriteString
    
    mov eax, WHITE + BG_BLACK
    call SetTextColor
    movzx eax, score
    call writedec
    
    ; Display instruction to continue
    mov eax, WHITE + BG_BLACK
    call SetTextColor
    mov dl, 20
    mov dh, 29
    call Gotoxy
    mov edx, offset playagain
    call WriteString
    
Readloop1:  
    call ReadChar

    cmp al, 'Y'
    je AGAIN1
    cmp al, 'y'
    je AGAIN1
    cmp al, 'N'
    je DONE1
    cmp al, 'n'
    je DONE1
    jmp Readloop1

AGAIN1:
call clrscr
call GameMain
jmp LRET1

DONE1:
call DisplayThankYouScreen

LRET1:
call clrscr    
    ret
WinGame ENDP

DisplayThankYouScreen PROC
    call clrscr
    INVOKE PlaySoundA, OFFSET ThankyouSound, NULL, 20001H     
    
    mov eax, RED + BG_BLACK
    call SetTextColor

    mov ecx, 8
    mov ah, 4
    mov esi, OFFSET title1

    DisplayLoop9:

    mov dl, 0
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF title1
    inc ah

    loop DisplayLoop9

    mov eax, WHITE + BG_BLACK
    call SetTextColor
    
    mov ecx, 4
    mov ah, 14
    mov esi, OFFSET thankYou1

    DisplayLoop10:

    mov dl, 30
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF thankYou1
    inc ah

    loop DisplayLoop10
    
     mov eax, lightGreen + BG_BLACK
    call SetTextColor

    mov ecx, 3
    mov ah, 20
    mov esi, OFFSET thankYou5

    DisplayLoop7:

    mov dl, 25
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF thankYou5
    inc ah

    loop DisplayLoop7

    mov eax, WHITE + BG_BLACK
    call SetTextColor
    mov dl, 20
    mov dh, 25
    call Gotoxy
    mov edx, OFFSET thankYou8
    call WriteString

    call ReadChar
    call clrscr

    ret
DisplayThankYouScreen ENDP

EndGame PROC
    call clrScr
    
     mov eax, RED + BG_BLACK
    call SetTextColor

    mov ecx, 8
    mov ah, 4
    mov esi, OFFSET title1

    DisplayLoop13:

    mov dl, 0
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF title1
    inc ah

    loop DisplayLoop13

    mov eax, WHITE + BG_BLACK
    call SetTextColor
    
    mov ecx, 4
    mov ah, 14
    mov esi, OFFSET gameover1

    DisplayLoop14:

    mov dl, 30
    mov dh, ah
    call Gotoxy
    mov edx, esi
    call WriteString
    add esi, LENGTHOF gameover1
    inc ah

    loop DisplayLoop14

    mov eax, LIGHTCYAN + BG_BLACK
    call SetTextColor
    mov dl, 30
    mov dh, 19
    call Gotoxy
    mov edx, offset strPlayerStats
    call WriteString
    
    ; Display player name with decoration
    mov eax, LIGHTGREEN + BG_BLACK
    call SetTextColor
    mov dl, 20
    mov dh, 22
    call Gotoxy
    mov edx, offset strPlayerNameLabel
    call WriteString
    
    mov eax, WHITE + BG_BLACK
    call SetTextColor
    mov edx, offset username
    call WriteString
    
    ; Display final score with decoration
    mov eax, LIGHTGREEN + BG_BLACK
    call SetTextColor
    mov dl, 20
    mov dh, 24
    call Gotoxy
    mov edx, offset strFinalScoreLabel
    call WriteString
    
    mov eax, WHITE + BG_BLACK  
    call SetTextColor
    movzx eax, score
    call writeDEC
    
    ; Display level reached
    mov eax, LIGHTGREEN + BG_BLACK
    call SetTextColor
    mov dl, 20
    mov dh, 26
    call Gotoxy
    mov edx, offset strLevelReached
    call WriteString
    
    mov eax, WHITE + BG_BLACK 
    call SetTextColor
    movzx eax, level
    call writedec
    
    ; Display instruction to continue
    mov eax, WHITE + BG_BLACK
    call SetTextColor
    mov dl, 25
    mov dh, 29
    call Gotoxy
    mov edx, offset playagain
    call WriteString
  
Readloop2:  
    call ReadChar

    cmp al, 'Y'
    je AGAIN2
    cmp al, 'y'
    je AGAIN2
    cmp al, 'N'
    je DONE2
    cmp al, 'n'
    je DONE2

    jmp Readloop2

AGAIN2:
call clrscr
call GameMain
jmp LRET2

DONE2:
call DisplayThankYouScreen

LRET2:    
    call clrScr
    ret
EndGame ENDP

END main
