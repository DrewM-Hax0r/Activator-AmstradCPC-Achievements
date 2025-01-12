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

// $7D6B: [8-bit] Health
//        Max value of 0x16
//        Min value of 0x10
//        If the player takes damange when this value is 0x10, they will lose a life and respawn with a health value of 0x16
function Health() => byte(0x007D6B)

// $7D6E: [8-bit] Number Of Lives
//        Set to 0x09 when a new game starts. 0x00 when not in game (including demo mode).
function NumberOfLives() => byte(0x007D6E)

// $9E59: [8-bit] Time Extend Item Pickup Flag
//        0x00 = Not Picked up
//        0x01 = Picked Up
function TimeExtendItemPickupFlag() => byte(0x009E59)

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

ENTITY_FLAGS_ADDRESSES = [
    0x009f50, 0x009f54, 0x009f59, 0x009f5d, 0x009f61, 0x009f65, 0x009f69, 0x009f6d,
    0x009f71, 0x009f75, 0x009f79, 0x009f7d, 0x009f82, 0x009f86, 0x009f8a, 0x009f8e,
    0x009f92, 0x009f96, 0x009f9b, 0x009f9f, 0x009fa3, 0x009fa7, 0x009fab, 0x009fb0,
    0x009fb4, 0x009fb8, 0x009fbc, 0x009fc1, 0x009fc5, 0x009fca, 0x009fce, 0x009fd2,
    0x009fd6, 0x009fda, 0x009fde, 0x009fe2, 0x009fe6, 0x009fea, 0x009fee, 0x009ff2,
    0x009ff6, 0x009ffa, 0x009ffe, 0x00a002, 0x00a006, 0x00a00b, 0x00a00f, 0x00a013,
    0x00a018, 0x00a01c, 0x00a020, 0x00a024, 0x00a02c, 0x00a031, 0x00a035, 0x00a039,
    0x00a03d, 0x00a041, 0x00a045, 0x00a049, 0x00a04d, 0x00a051, 0x00a055, 0x00a059,
    0x00a05d, 0x00a061, 0x00a066, 0x00a06a, 0x00a06e, 0x00a073, 0x00a077, 0x00a07b,
    0x00a07f, 0x00a083, 0x00a087, 0x00a08b, 0x00a08f, 0x00a093, 0x00a097, 0x00a09b,
    0x00a0a0, 0x00a0a4, 0x00a0a8, 0x00a0ac, 0x00a0b0, 0x00a0b4, 0x00a0b8, 0x00a0bd,
    0x00a0c1, 0x00a0c5, 0x00a0c9, 0x00a0cd, 0x00a0d1, 0x00a0d5, 0x00a0d9, 0x00a0dd,
    0x00a0e1, 0x00a0e5, 0x00a0e9, 0x00a0ed, 0x00a0f1, 0x00a0f5, 0x00a0f9, 0x00a0fd,
    0x00a102, 0x00a106, 0x00a10a, 0x00a10e, 0x00a112, 0x00a116, 0x00a11a, 0x00a11e,
    0x00a122, 0x00a126, 0x00a12b, 0x00a12f, 0x00a133, 0x00a137, 0x00a13c, 0x00a140,
    0x00a144, 0x00a148, 0x00a14c, 0x00a150, 0x00a155, 0x00a159, 0x00a15d, 0x00a161,
    0x00a165, 0x00a16a, 0x00a16e, 0x00a172, 0x00a176, 0x00a17a, 0x00a17e, 0x00a182,
    0x00a186, 0x00a18b, 0x00a18f, 0x00a193, 0x00a197, 0x00a19b, 0x00a19f, 0x00a1a3,
    0x00a1a7, 0x00a1ab, 0x00a1b0, 0x00a1b4, 0x00a1b8, 0x00a1bd, 0x00a1c1, 0x00a1c5,
    0x00a1c9, 0x00a1cd, 0x00a1d1, 0x00a1d5, 0x00a1d9, 0x00a1dd, 0x00a1e1, 0x00a1e5,
    0x00a1e9, 0x00a1ed, 0x00a1f1, 0x00a1f5, 0x00a1f9, 0x00a1fd, 0x00a201, 0x00a205,
    0x00a209, 0x00a20d, 0x00a211, 0x00a215, 0x00a219, 0x00a21d, 0x00a221, 0x00a226,
    0x00a22a, 0x00a22e, 0x00a232, 0x00a236, 0x00a23a, 0x00a23e, 0x00a242, 0x00a246,
    0x00a24a, 0x00a24e, 0x00a252, 0x00a256, 0x00a25a, 0x00a25e, 0x00a262, 0x00a266,
    0x00a26a, 0x00a26e, 0x00a272, 0x00a277, 0x00a27b, 0x00a27f, 0x00a283, 0x00a287,
    0x00a28b, 0x00a28f, 0x00a293, 0x00a297, 0x00a29b, 0x00a29f, 0x00a2a3, 0x00a2a7,
    0x00a2ab, 0x00a2af, 0x00a2b3, 0x00a2b7, 0x00a2bb, 0x00a2bf, 0x00a2c3, 0x00a2c7,
    0x00a2cb, 0x00a2cf, 0x00a2d3, 0x00a2d7, 0x00a2db, 0x00a2df, 0x00a2e4, 0x00a2e8,
    0x00a2ec, 0x00a2f0, 0x00a2f4, 0x00a2f8, 0x00a2fc, 0x00a300, 0x00a304, 0x00a308,
    0x00a30c, 0x00a310, 0x00a314, 0x00a318
]

ROOM_192_LIGHTNING_FLAGS = [0x00a159, 0x00a15d, 0x00a161, 0x00a165]

// ---------------------------
// ----- Logic Functions -----
// ---------------------------

function InGame() => NumberOfLives() > 0 && RemainingMinutes() < 30 && RemainingTimeInSeconds() > 0

function InRoom(room) => CurrentRoomNumber() == room

function NotInRooms(rooms) {
    result = true
    for room in rooms {
        result = result && CurrentRoomNumber() != room
    }
    return result    
}

function RoomTransition(prevRoom, currentRoom) => prev(CurrentRoomNumber()) == prevRoom && CurrentRoomNumber() == currentRoom

function LostHealth() => prev(NumberOfLives()) > NumberOfLives() || prev(Health()) > Health()

function EntityNotDestroyed(address) => bit7(address) == 0

function DestroyEntityOnThisFrame(address) {
    flag = bit7(address)
    return prev(flag) == 0 && flag == 1
}

function EntitiesDestroyedOnThisFrame() {
    result = []
    for address in ENTITY_FLAGS_ADDRESSES {
        array_push(result, DestroyEntityOnThisFrame(address))
    }
    return result
}

function AllEntitiesNotDestroyed(addresses) {
    result = true
    for address in addresses {
        result = result && EntityNotDestroyed(address)
    }
    return result    
}

function DestroyedEnemiesInCurrentGame(numberOfEnemies) {
    return never(!InGame()) && measured(tally(numberOfEnemies, EntitiesDestroyedOnThisFrame()))
}

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
    title = "The Activator I", points = 1,
    description = "Place fuel rod #1 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_1)
)

achievement(
    id = 484406, badge = "549302",
    title = "The Activator II", points = 2,
    description = "Place fuel rod #2 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_2)
)

achievement(
    id = 484407, badge = "549303",
    title = "The Activator III", points = 2,
    description = "Place fuel rod #3 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_3)
)

achievement(
    id = 484408, badge = "549304",
    title = "The Activator IV", points = 3,
    description = "Place fuel rod #4 in any slot at the Power Chamber",
    type = "progression",
    trigger = PlacedFuelRodInPowerChamberOnThisFrame(FUEL_ROD_4)
)

achievement(
    id = 484409, badge = "549305",
    title = "The Activator V", points = 3,
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

achievement(
    id = 491831, badge = "557327",
    title = "Say Hello to My Little Friend", points = 1,
    description = "Destroy an enemy or hazard using the bullet item",
    trigger = InGame() && tally(1, EntitiesDestroyedOnThisFrame())
)

achievement(
    id = 491832, badge = "557328",
    title = "Self Defense", points = 10,
    description = "Destroy 100 enemies/hazards in a single game",
    trigger = DestroyedEnemiesInCurrentGame(100)
)

achievement(
    id = 491833, badge = "557329",
    title = "Mass Destruction", points = 25,
    description = "Destroy 200 enemies/hazards in a single game",
    trigger = DestroyedEnemiesInCurrentGame(200)
)

achievement(
    id = 491825, badge = "557321",
    title = "Speed Activation", points = 10,
    description = "Complete a game without having picked up the Time Extension item",
    trigger = CompletedGameOnThisFrame() && TimeExtendItemPickupFlag() == 0x00
)

achievement(
    id = 491836, badge = "557332",
    title = "Ninja Activation", points = 10,
    description = "Complete a game with 5 or more lives remaining",
    trigger = CompletedGameOnThisFrame() && NumberOfLives() >= 5
)

achievement(
    id = 491826, badge = "557325",
    title = "Underhanded Tactics", points = 5,
    description = "Enter room 193 without losing any health after entering Room 192 from Room 191 and without having destroyed any of the lightning hazards in Room 192",
    trigger = once(RoomTransition(191, 192)) && never(RoomTransition(192, 191)) && never(CurrentRoomNumber() == 0x00) && never(LostHealth()) &&
              AllEntitiesNotDestroyed(ROOM_192_LIGHTNING_FLAGS) &&
              trigger_when(RoomTransition(192, 193))
)


// -------------------------
// ----- Leaderboards ------
// -------------------------

function GameTimeInSeconds() => RemainingSecondsInCurrentMinute() + (RemainingMinutes() * 60)

function FinalScoreHasTallied() =>
    IsReactorCoreSlotFilled(0) &&
    IsReactorCoreSlotFilled(1) &&
    IsReactorCoreSlotFilled(2) &&
    IsReactorCoreSlotFilled(3) &&
    IsReactorCoreSlotFilled(4) &&
    IsReactorCoreSlotFilled(5) &&
    IsReactorCoreSlotFilled(6) &&
    prev(NumberOfLives()) == 1 && NumberOfLives() == 0

leaderboard(
    id=124449,
    title="Game Clear Time Attack",
    description="Complete the game with the highest amount of time remaining on the clock",
    start=CompletedGameOnThisFrame(),
    cancel=CurrentRoomNumber() != ROOM_REACTOR,
    submit=CompletedGameOnThisFrame(),
    value=GameTimeInSeconds(),
    format="SECS",
    lower_is_better=false
)

leaderboard(
    id=124450,
    title="Perfect Game Clear Time Attack",
    description="Complete the game having placed all fuel rods at the Power Chamber in ascending numerical order with the highest amount of time remaining on the clock",
    start=CompletedPerfectGameOnThisFrame(),
    cancel=CurrentRoomNumber() != ROOM_REACTOR,
    submit=CompletedPerfectGameOnThisFrame(),
    value=GameTimeInSeconds(),
    format="SECS",
    lower_is_better=false
)

leaderboard(
    id=124451,
    title="Score Attack",
    description="Complete the game with the highest score possible",
    start=FinalScoreHasTallied(),
    cancel=CurrentRoomNumber() != ROOM_REACTOR,
    submit=FinalScoreHasTallied(),
    value=CurrentScore(),
    format="VALUE",
    lower_is_better=false
)


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