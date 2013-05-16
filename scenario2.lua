
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()

-- create scene (setup)

function scene:createScene(event)

	group = self.view
	
	background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(122, 122, 122)
	
--	May = display.newImage("images/female.png")
--	group:insert(May)
--	May.x = 100
--	May.y = 400
	
	
	badMale = display.newImage("images/badMale.png")
	group:insert(badMale)
	badMale.x = 275
	badMale.y = 310
	
	goodMale = display.newImage("images/male.png")
	group:insert(goodMale)
	goodMale.x = 650
	goodMale.y = 300
	
--	hiddenMale = display.newImage("images/male.png")
--	group:insert(hiddenMale)
--	hiddenMale.x = 600

end

local splashText1 = function()

	text1 = display.newText("Try to avoid the bad guys/strangers!", 125, 500, native.systemFont, 20)

end

local splashText2 = function()

	text2 = display.newText("Stay close to your friends!", 575, 500, native.systemFont, 20)

end

local createGoodMale = function()
	
	local goodMale = display.newImage("images/male.png")
	goodMale.x = 1200
	goodMale.y = math.random(display.contentHeight)
	goodMale.speed = math.random(2, 4)
	return goodMale
	
end

local createBadMale = function()
	
	local badMale = display.newImage("images/badMale.png")
	badMale.x = 1200
	badMale.y = math.random(display.contentHeight)
	badMale.speed = math.random(2, 4)
	return badMale
	
end

local createHiddenMale = function()
	
	local hiddenMale = display.newImage("images/male.png")
	hiddenMale.x = 1200
	hiddenMale.y = math.random(display.contentHeight)
	hiddenMale.speed = math.random(2, 4)
	return hiddenMale
	
end

local move = function(self, event)
	if self.x < -50 then
		self.x = display.contentWidth
		self.y = math.random(90, display.contentHeight)
		self.speed = math.random(2, 6)
	else
		self.x = self.x - self.speed
	end
end

local startGame = function()
	
	text1:removeSelf()
	text2:removeSelf()
	badMale:removeSelf()
	goodMale:removeSelf()
	
	May = display.newImage("images/female.png")
	group:insert(May)
	May.x = 100
	May.y = 400
	
	goodMales = {}
	for i = 1, 10 do
		goodMales[i] = createGoodMale()
	end
	
	badMales = {}
	for i = 1, 10 do
		badMales[i] = createBadMale()
	end
	
	hiddenMales = {}
	for i = 1, 5 do
		hiddenMales[i] = createHiddenMale()
	end
	
	
	for i = 1, 10 do
		goodMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", goodMales[i])
		badMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", badMales[i])
	end
	
	for i = 1, 5 do
		hiddenMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", hiddenMales[i])
	end
	
end

function scene:enterScene(event)

	splashText1()
	timer.performWithDelay(3000, splashText2)
	timer.performWithDelay(6000, startGame)

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