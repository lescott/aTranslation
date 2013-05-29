
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()


function scene:createScene(event)

	local group = self.view
	
	local background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(0, 0, 0)
	
	text1 = display.newText("This is a game about teen dating violence.", display.contentWidth/8, display.contentHeight/2, native.systemFont, 35)
	text1.isVisible = false
	
	text2 = display.newText("You will play through three scenarios exemplifying ", display.contentWidth/18, display.contentHeight/4, native.systemFont, 35)
	text2.isVisible = false
	text3 = display.newText("three difficult topics on the subject.", display.contentWidth/6, display.contentHeight/2, native.systemFont, 35)
	text3.isVisible = false
	


end

local toLevelSelect = function(event)
	storyboard.gotoScene("levelSelect")
end

local splashText1 = function()

	text1.isVisible = true

end

local splashText2 = function()

	text1.isVisible = false
	text2.isVisible = true
	text3.isVisible = true

end


function scene:enterScene(event)

	splashText1()
	timer.performWithDelay(3000, splashText2)
	timer.performWithDelay(6000, toLevelSelect)

end


function scene:exitScene(event)
	text1:removeSelf()
	text2:removeSelf()
	text3:removeSelf()

end

function scene:didExitScene( event )
storyboard.purgeScene( "intro" )
end
scene:addEventListener( "didExitScene" )

function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene