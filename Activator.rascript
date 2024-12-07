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
function ReactorSlotAddress() => 0x007C7B

// $7D6E: [8-bit] Number Of Lives
//        Set to 0x09 when a new game starts. 0x00 when not in game (including demo mode).
function NumberOfLives() => byte(0x007D6E)

// $A6D6: [8-bit] Current Room Number
//
//        0x61 = Reactor Core (Room 97)
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


// ---------------------------
// -------- Constants --------
// ---------------------------

ROOM_REACTOR_ENTRANCE = 96
ROOM_REACTOR = 97

RACTOR_CORE_SLOTS = [0, 1, 2, 3, 4, 5, 6]

FUEL_ROD_EMPTY = 0xFF
FUEL_ROD_1 = 0x09
FUEL_ROD_2 = 0x0A
FUEL_ROD_3 = 0x0B
FUEL_ROD_4 = 0x0C
FUEL_ROD_5 = 0x0D
FUEL_ROD_6 = 0x0E
FUEL_ROD_7 = 0x0F

// ---------------------------
// ----- Logic Functions -----
// ---------------------------

function InGame() => NumberOfLives() > 0 && RemainingMinutes() < 30 && RemainingTimeInSeconds() > 0

function RemainingTimeInSeconds() => (RemainingMinutes() * 60) + RemainingSecondsInCurrentMinute()

function ReactorCoreSlot(index) => byte(ReactorSlotAddress() + index)

function PlacedFuelRodInPowerChamberOnThisFrame(fuelRod) {
    result = false
    
    for slotIndex in RACTOR_CORE_SLOTS {
        slot = ReactorCoreSlot(slotIndex)
        result = result || (prev(slot) == FUEL_ROD_EMPTY && slot == fuelRod)
    }
    
    return InGame() && result
}

function IsReactorCoreSlotFilled(slotIndex) => ReactorCoreSlot(slotIndex) >= FUEL_ROD_1 && ReactorCoreSlot(slotIndex) <= FUEL_ROD_7

function CompletedGameOnThisFrame() {
    return InGame() &&
        prev(ReactorCoreSlot(6)) == FUEL_ROD_EMPTY && IsReactorCoreSlotFilled(6) &&
        IsReactorCoreSlotFilled(5) &&
        IsReactorCoreSlotFilled(4) &&
        IsReactorCoreSlotFilled(3) &&
        IsReactorCoreSlotFilled(2) &&
        IsReactorCoreSlotFilled(1) &&
        IsReactorCoreSlotFilled(0)
}

function CompletedPerfectGameOnThisFrame() {
    return InGame() &&
        prev(ReactorCoreSlot(6)) == FUEL_ROD_EMPTY && ReactorCoreSlot(6) == FUEL_ROD_7 &&
        ReactorCoreSlot(5) == FUEL_ROD_6 &&
        ReactorCoreSlot(4) == FUEL_ROD_5 &&
        ReactorCoreSlot(3) == FUEL_ROD_4 &&
        ReactorCoreSlot(2) == FUEL_ROD_3 &&
        ReactorCoreSlot(1) == FUEL_ROD_2 &&
        ReactorCoreSlot(0) == FUEL_ROD_1
}


// ---------------------------
// ------ Achievements -------
// ---------------------------

achievement(
    id = 484403, badge = "549300",
    title = "The Beginning And The End", points = 1,
    description = "Locate the Power Chamber",
    type = "progression",
    trigger = InGame() && prev(CurrentRoomNumber()) == ROOM_REACTOR_ENTRANCE && CurrentRoomNumber() == ROOM_REACTOR
)

achievement(
    id = 484405, badge = "549301",
    title = "The Activator I", points = 5,
    description = "Place fuel rod #1 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_1)
)

achievement(
    id = 484406, badge = "549302",
    title = "The Activator II", points = 5,
    description = "Place fuel rod #2 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_2)
)

achievement(
    id = 484407, badge = "549303",
    title = "The Activator III", points = 5,
    description = "Place fuel rod #3 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_3)
)

achievement(
    id = 484408, badge = "549304",
    title = "The Activator IV", points = 5,
    description = "Place fuel rod #4 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_4)
)

achievement(
    id = 484409, badge = "549305",
    title = "The Activator V", points = 5,
    description = "Place fuel rod #5 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_5)
)

achievement(
    id = 484410, badge = "549306",
    title = "The Activator VI", points = 5,
    description = "Place fuel rod #6 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_6)
)

achievement(
    id = 484411, badge = "549307",
    title = "The Activator VII", points = 5,
    description = "Place fuel rod #7 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_7)
)

achievement(
    id = 484413, badge = "549310",
    title = "Never Trust a Programmer", points = 25,
    description = "Place all fuel rods at the Power Chamber in any order in a single game",
    type = "win_condition",
    trigger = CompletedGameOnThisFrame()
)

achievement(
    id = 484476, badge = "549376",
    title = "Hero of Antari", points = 50,
    description = "Place all fuel rods at the Power Chamber in ascending numerical order in a single game to receive a 100,000 point bonus",
    trigger = CompletedPerfectGameOnThisFrame()
)


// -------------------------
// ----- Leaderboards ------
// -------------------------



// -------------------------
// ----- Rich Presence -----
// -------------------------

function InGameRP() => InGame() && !(RemainingMinutes() == 0 && prior(RemainingSecondsInCurrentMinute()) == 0 && RemainingSecondsInCurrentMinute() == 59)

FuelRodLookup = {
    0xFF: "_",
    0x09: "1",
    0x0A: "2",
    0x0B: "3",
    0x0C: "4",
    0x0D: "5",
    0x0E: "6",
    0x0F: "7"
}

rich_presence_conditional_display(!InGameRP(), "In Menus")

rich_presence_display("Score: {0} ● Time Left: {1} ● Lives: {2} ● Room: {3} ● Fuel Rods: |{4}|{5}|{6}|{7}|{8}|{9}|{10}|",
    rich_presence_value("Score", CurrentScore()),
    rich_presence_value("Time", RemainingTimeInSeconds(), format="SECS"),
    rich_presence_value("Lives", NumberOfLives()),
    rich_presence_value("Room", CurrentRoomNumber()),
    rich_presence_lookup("Slot1", ReactorCoreSlot(0), FuelRodLookup, fallback="_"),
    rich_presence_lookup("Slot2", ReactorCoreSlot(1), FuelRodLookup, fallback="_"),
    rich_presence_lookup("Slot3", ReactorCoreSlot(2), FuelRodLookup, fallback="_"),
    rich_presence_lookup("Slot4", ReactorCoreSlot(3), FuelRodLookup, fallback="_"),
    rich_presence_lookup("Slot5", ReactorCoreSlot(4), FuelRodLookup, fallback="_"),
    rich_presence_lookup("Slot6", ReactorCoreSlot(5), FuelRodLookup, fallback="_"),
    rich_presence_lookup("Slot7", ReactorCoreSlot(6), FuelRodLookup, fallback="_")
)