---@class Player
---@field x number
---@field y number
---@field absx number
---@field absy number
---@field isMoving boolean
---@field sprite Sprite
---@field hp number
---@field maxhp number
---@field maxhpshift number
Player = {}
--- aaa
Player.isMoving = false
--- (READONLY) gets the X position of the player's center relative to the arena's center
Player.x = 0