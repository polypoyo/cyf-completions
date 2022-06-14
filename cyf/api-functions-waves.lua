--- You can use this object to obtain information about the arena, resize it or move it.
---
--- Don't forget that the Arena's position is reset at the end of the wave! 
Arena = {}
--- (readonly) - the width of the arena in pixels, after resizing. Since the reference for the player and bullets is the arena's center, you can get the left/right side of the arena with `-Arena.width/2` and `Arena.width/2` respectively.
---@type number
Arena.width = 20

---(readonly) - the height of the arena in pixels, after resizing. Like with width, you can get the bottom/top with `-Arena.height/2` and `Arena.height/2` respectively.
---@type number
Arena.height = 20