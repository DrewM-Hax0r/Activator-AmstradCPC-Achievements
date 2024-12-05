// Activator
// #ID = 29166

// $7C7B: [8-bit] Reactor Slot #1
//        Stores which fuel rod is placed in slot 1 in the reactor room (room 97).
//
//        Once all reactor slots are filled, the game is won.
//        If all 7 rods are placed in order (Rod 1 in Slot 1, Rod 2 in Slot 2 etc, a point bonus of 100k will be awarded at the end of the game.
//
//        0xFF = No rod
//        0x09 = Rod 1
//        0x0A = Rod 2
//        0x0B = Rod 3
//        0x0C = Rod 4
//        0x0D = Rod 5
//        0x0E = Rod 6
//        0x0F = Rod 7
function ReactorSlot1() => byte(0x007C7B)

// $7D6E: [8-bit] Number Of Lives
//        Set to 0x09 when a new game starts. 0x00 when not in game (including demo mode).
function NumberOfLives() => byte(0x007D6E)

// $A6D6: [8-bit] Current Room Number
function CurrentRoomNumber() => byte(0x00A6D6)

// $A6DA: [32-bit] Current Score
function CurrentScore() => dword(0x00A6DA)

// $A6E0: [8-bit] Remaining Minutes
//        Number of minutes remaining before the game ends in a time out.
//        
//        You begin the game with 30 minutes, this value will be initialized to 30 (0x1E) at the title screen, and then drop to 29 (0x1D) when a game starts. The remaining seconds in the current minute is held at address 0x00A6E2.
function RemainingMinutes() => byte(0x00A6E0)

// $A6E2: [8-bit] Remaining Seconds In Current Minute
//        Tracks the number of in game seconds remaining in the current minute of the game timer.
//        
//        This value decreases by 1 every second the game is active. When this value would otherwise decrease but it's current value is 0, it is instead reset back to 59 (0x3B) and the remaining minutes value at address 0x00A6E0 is decreased by 1.
function RemainingSecondsInCurrentMinute() => byte(0x00A6E2)
