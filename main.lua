-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Example of .pex loading

local pex = require "com.ponywolf.pex"

local particle = pex.load("particle.pex","texture.png")

local emitter = display.newEmitter(particle)
emitter.x = display.contentCenterX
emitter.y = display.contentCenterY


