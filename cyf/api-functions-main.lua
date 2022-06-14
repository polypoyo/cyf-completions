--- Write text to the debug console (toggleable with F9).
--It will appear automatically the first time you write text to it.
--You can use this to check values in your code, or make sure some pieces of code are actually running.
---@param text string
function DEBUG(text)end

--- This makes the list of strings you give to the function appear in the UI dialog box.
-- After skipping through them, you will automatically go to the monster dialogue step by default.
-- Below is a working example of how you could use it for a Vegetoid encounter. 
--[[
```lua
function HandleCustomCommand(command)
    if command == "DINNER" then
        if ate_greens then -- ate_greens is a non-default variable, of course
            currentdialogue = {"Ate\nYour\nGreens"}
        else
            currentdialogue = {"Eat\nYour\nGreens"}
        end
        BattleDialog({"You pat your stomach.\nVegetoid offers a healthy meal."})
    end
	end
```
]]
---@param list_of_strings table<string>
function BattleDialog(list_of_strings)end

--- Select a random monster from the encounter, then get a random entry from the comments table there.
--You'll want to use this to replicate default encounter behaviour. See code below (or one of the example encounters). 
--[[```lua
function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText()
end
```]]
---@return string
function RandomEncounterText()end

--[[
A powerful function that immediately skips the battle to the specified state, rather than following the default conventions.
Below is a list of valid strings you can pass to it, what state you'll be going
to and what that state entails. The states you pass to it are case-invariant,
but uppercase is recommended for readability.

Arguably the best part about `State` is that it can be used in conjunction with
the text command `[func]` to change the state from within your dialogue. An example
is below - this will have a monster say that he will not fight you, then return
to the action select screen, instead of starting a wave.
```lua
currentdialogue = {"I won't fight you.", "[func:State,ACTIONSELECT]"}
```
- `ACTIONSELECT` - While in this state, you can select FIGHT/ACT/ITEM/MERCY.
- `ENEMYDIALOGUE` - When starting this state, `currentdialogue` gets read 
	from the Encounter script for every monster and their dialogue is displayed.
	If that doesn't exist, it'll return something at random from the
	`randomdialogue` list.
- `DEFENDING` - When starting this state, `nextwaves` is read out from the
	Encounter script and all scripts in the Waves folder with matching names
	will be part of this defense step. `wavetimer` is also read from the
	Encounter script at this time. 

There are some other states available, but entering some might have nasty side effects. It's possible that they might lock up your battle if you enter them with `State`. So, use at your own risk:

- `ATTACKING` - Starting this state will put you in the screen where you
	either deal damage to an enemy by pressing "Z" at the right time, or you
	wait and miss entirely. The enemy this affects is the same as the last
	enemy selected in the states `ENEMYSELECT` or `ACTMENU`. After this state
	ends, the encounter moves on to the ` ENEMYDIALOGUE` state by default.
- `ENEMYSELECT` - This state displays a list of all active enemies in the
	encounter. This state gets entered automatically after choosing FIGHT or
	ACT. If the Player got here from choosing FIGHT, the state loaded from
	pressing "Z" is `ATTACKING`, if they got here from choosing ACT, that
	state will be `ACTMENU`, but if they got here from calling `State` and
	press "Z", nothing will happen.
- `ACTMENU` - This state displays all of the options from the enemy's
	`commands` in order. If the enemy has `cancheck` set to true, then a
	"Check" option will be displayed here - which will follow the syntax
	seen in the description for `commands` as seen in Basic Setup. Having
	more than 6 ACT commands may cause glitchiness, though, so watch out!
	(Additional note: the enemy chosen will always be the same as the last
	enemy chosen in `ENEMYSELECT`.)
- `ITEMMENU` - This state shows all of the player's available items.
	It's tied with the `HandleItem` function (see Game events for more
	information).
- `MERCYMENU` - This state lets you choose from either "Spare" or "Flee".
	If at least one active enemy has `canspare` set to true, then "Spare"
	will be yellow - and selecting it will spare that enemy. Otherwise,
	if the option is not yellow, then choosing "Spare" will activate the
	encounter function `HandleSpare`. Also, choosing "Flee" prompts	some
	silly messages :P
	If the encounter was entered from the overworld, choosing "Flee" allows the player to flee the battle and return to the overworld.
- `DIALOGRESULT` - This is the state that is entered whenever `BattleDialog` is called, when the victory message displays, when the player fails to flee, or when an item is used. When all text is done and the player presses "Z", the state `ENEMYDIALOGUE` is entered next. The soul is forcibly invisible during this state.

Finally, there are two "special" states that evoke behavior in the engine itself:

- `DONE` - Changing state to `DONE` will instantly end the current battle. Normally, this will force the player to the mod selection screen.
	If the encounter was entered from the overworld, the battle will end and the player will return to the overworld, in the same way as if the player had ended the battle normally, such as by sparing all the enemies or running away.
- `NONE` - This state does nothing. It is entered for the first frame of the encounter, but entering it manually will completely freeze your encounter. It might be useful if you want to disable all of Unitale/CYF's basic functionality.
- `RESETTING` - DEPRECATED, DO NOT USE. Only listed for completion purposes. It only exists in Unitale 0.2.1a, so trying to use it in CYF won't work. It was removed in the Github release of Unitale 0.2.1a, and seemed to be only for testing.
]]
---@param state_to_go_to StateName
function State(state_to_go_to)end
