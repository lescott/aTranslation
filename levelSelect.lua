
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()


function scene:createScene(event)

	local group = self.view
	
	local background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(200, 122, 0)
	
	scen1 = display.newImage("images/femaleButton.png", 0, 150)
	group:insert(scen1)
	
	local scen1text = display.newText("Scenario 1", 25, 450, native.systemFont, 50)
	group:insert(scen1text)
	
	scen2 = display.newImage("images/femaleButton.png", 350, 150)
	group:insert(scen2)
	
	local scen2text = display.newText("Scenario 2", 400, 450, native.systemFont, 50)
	group:insert(scen2text)
	
	scen3 = display.newImage("images/maleButton.png", 750, 150)
	group:insert(scen3)
	
	local scen3text = display.newText("Scenario 3", 750, 450, native.systemFont, 50)
	group:insert(scen3text)
	
	finalScene = display.newImage("images/threeButton.png", 250, 525)
	group:insert(finalScene)
	finalScene.isVisible = false

end

local toSplash = function(event)
	storyboard.gotoScene("splash")
end

local toScene1 = function(event)
	storyboard.gotoScene("scenario1")
end

local toScene2 = function(event)
	storyboard.gotoScene("scenario2")
end

local toScene3 = function(event)
	storyboard.gotoScene("scenario3")
end


function scene:enterScene(event)

	--storyboard.removeScene("scenario1")
	--storyboard.removeScene("scenario2")
	--storyboard.removeScene("scenario3")
	--storyboard.removeScene("intro")
	scen1:addEventListener("touch", toScene1)
	scen2:addEventListener("touch", toScene2)
	scen3:addEventListener("touch", toScene3)

end


function scene:exitScene(event)

	scen1:removeEventListener("touch", toScene1)
	scen2:removeEventListener("touch", toScene2)
	scen3:removeEventListener("touch", toScene3)

end

function scene:didExitScene( event )
storyboard.purgeScene( "levelSelect" )
end
scene:addEventListener( "didExitScene" )


function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene