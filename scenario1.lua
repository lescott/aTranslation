
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()

-- create scene (setup)

function scene:createScene(event)
	
	local group = self.view
	
	background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(0, 0, 0)
	
	Sheri = display.newImage("images/female.png")
	group:insert(Sheri)
	Sheri.isVisible = false
	
end

local bedroom = function()
	Sheri.isVisible = true
	before:removeSelf()
	background:setFillColor(122, 122, 122)
end

local displayOpeningText = function()
	before = display.newText("Before", 1024/2, 768/2, native.systemFont, 60)
	timer.performWithDelay(4000, bedroom)
end

function scene:enterScene(event)

	displayOpeningText()
	

end


function scene:exitScene(event)

end


function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene