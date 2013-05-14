
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()

-- create scene (setup)

function scene:createScene(event)
	
	local group = self.view
	
	local background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(122, 122, 122)
	
	local title = display.newText("A translation", 1024/2, 768/2, native.systemFont, 60)
	group:insert(title)
	
end

function nextScreen(event)

	if event.phase == "began" then
		storyboard.gotoScene("levelSelect", "fade", 500)
	end

end

function scene:enterScene(event)

	Runtime:addEventListener("touch", nextScreen)

end


function scene:exitScene(event)

	Runtime:removeEventListener("touch", nextScreen)

end


function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene