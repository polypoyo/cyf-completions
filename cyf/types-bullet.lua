---@class Bullet
local Bullet = {}

--- Move this bullet `x` pixels to the right and `y` pixels up. 
---
--- A negative `x` will move it to the left, and a negative `y` will move it downwards. 
---@param x any
---@param y any
function Bullet.Move(x,y)end

--- Gets a variable that you previously set using `Bullet.SetVar`. 
---@param key string
function Bullet.GetVar(key)end

---Sets a variable on this bullet that you can retrieve with `Bullet.GetVar`. 
---@param value any
---@param key any
function Bullet.SetVar(key, value)end