
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()

local physics = require "physics"
physics.start()


-- create scene (setup)

function scene:createScene(event)
	
	local group = self.view
	
	local background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(122, 122, 122)
	
	Aaron = display.newImage("images/male.png")
	group:insert(Aaron)
	Aaron.x = 100
	Aaron.y = 400
	physics.addBody(Aaron, "dynamic")
	
	local platform1 = display.newRect(0, 400, 200, 20)
	platform1:setFillColor(100, 100, 100)
	physics.addBody(platform1, "static")
	
	
end

function moveRight(self, event)
	self.x = self.x + 3
end

function moveLeft(self, event)
	self.x = self.x - 3
end

function touchScreen(event)
	if event.phase == "began" then
		if event.x >= Aaron.x then
			Aaron.enterFrame = moveRight
		elseif event.x < Aaron.x then
			Aaron.enterFrame = moveLeft
		end
		Runtime:addEventListener("enterFrame", Aaron)
	end
	
	if event.phase == "ended" then
		Runtime:removeEventListener("enterFrame", Aaron)
	end
	
	if Aaron.y >= display.contentHeight then
	storyboard.gotoScene("levelSelect")
end
	
end


function scene:enterScene(event)

	Runtime:addEventListener("touch", touchScreen)
	
end


function scene:exitScene(event)
	
	Runtime:removeEventListener("touch", touchScreen)

end


function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene