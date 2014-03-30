-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local json = require("json")
local pex = require("pex")


local function printTable( t, label, level )
	if label then print( label ) end
	level = level or 1

	if t then
		for k,v in pairs( t ) do
			local prefix = ""
			for i=1,level do
				prefix = prefix .. "\t"
			end

			print( prefix .. "[" .. tostring(k) .. "] = " .. tostring(v) )
			if type( v ) == "table" then
				print( prefix .. "{" )
				printTable( v, nil, level + 1 )
				print( prefix .. "}" )
			end
		end
	end
end

	-- Helper function to load JSON/TMX files
	
	local function getFile( filename, base )
		if not base then base = system.ResourceDirectory; end
		local path = system.pathForFile( filename, base )
		local contents
		local file = io.open( path, "r" )
		if file then
		   contents = file:read( "*a" )
		   io.close( file )	-- close the file after using it
		else
			assert(filename .. " not found")
		end
		return contents
	end

--particle = json.decode( getFile( "Snow.json" ) )
particle = pex.load("particle.pex","fire.png")

printTable(particle)
print(particle[particleLifespan])

emitter = display.newEmitter(particle)
emitter.x = display.contentCenterX
emitter.y = display.contentCenterY


