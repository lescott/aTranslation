
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()


function scene:createScene(event)


	local screenGroup = self.view
	
	local background = display.newRect(0, 0, 1024, 768)
	screenGroup:insert(background)

	local group = self.view
	
	local background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(200, 122, 0)
	
	local scene1 = display.newImage("images/femaleButton.png", 0, 100)
	group:insert(scene1)
	
	local scen1text = display.newText("Scenario 1", 25, 400, native.systemFont, 50)
	group:insert(scen1text)
	
	local scen2 = display.newImage("images/femaleButton.png", 350, 100)
	group:insert(scen2)
	
	local scen2text = display.newText("Scenario 2", 400, 400, native.systemFont, 50)
	group:insert(scen2text)
	
	local scen3 = display.newImage("images/maleButton.png", 750, 100)
	group:insert(scen3)
	
	local scen3text = display.newText("Scenario 3", 750, 400, native.systemFont, 50)
	group:insert(scen3text)
	
	local finalScene = display.newImage("images/threeButton.png", 250, 520)
	group:insert(finalScene)
	-- finalScene.isVisible = false

end


function scene:enterScene(event)

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