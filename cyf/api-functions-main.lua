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