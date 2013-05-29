
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()

-- create scene (setup)

function scene:createScene(event)
	
	local group = self.view
	
	local background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(4, 4, 4)
	
	touchedCount = 0
	
	
end

function nextScreen(event)

	if event.phase == "began" then
		touchedCount = touchedCount + 1
		if touchedCount >= 2 then
			storyboard.gotoScene("levelSelect", "fade", 500)
		end
	end

end

function scene:enterScene(event)

	text1 = display.newText("Meaning is stripped and happiness is relative.", 50, 768/2, native.systemFont, 30)
	Runtime:addEventListener("touch", nextScreen)

end


function scene:exitScene(event)

	text1:removeSelf()
	Runtime:removeEventListener("touch", nextScreen)

end

function scene:didExitScene( event )
storyboard.purgeScene( "endScen1" )
end
scene:addEventListener( "didExitScene" )

function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene