
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()

local physics = require "physics"
physics.start()
physics.setGravity(0, 0)

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
	
	
	badMale = display.newImage("images/badMaleLarge.png")
	group:insert(badMale)
	badMale.x = 275
	badMale.y = 310
	
	goodMale = display.newImage("images/maleLarge.png")
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
	goodMale.mtype = "good"
	goodMale.destructCount = 0
	physics.addBody(goodMale, "static")
	return goodMale
	
end

local createBadMale = function()
	
	local badMale = display.newImage("images/badMale.png")
	badMale.x = 1200
	badMale.y = math.random(display.contentHeight)
	badMale.speed = math.random(2, 4)
	badMale.mtype = "bad"
	badMale.destructCount = 0
	physics.addBody(badMale, "static")
	return badMale
	
end

local createHiddenMale = function()
	
	local hiddenMale = display.newImage("images/male.png")
	hiddenMale.x = 1200
	hiddenMale.y = math.random(display.contentHeight)
	hiddenMale.speed = math.random(2, 4)
	hiddenMale.mtype = "hidden"
	hiddenMale.destructCount = 0
	physics.addBody(hiddenMale, "static")
	return hiddenMale
	
end

local move = function(self, event)
	if self.destructCount >= 2 then
		self.x = display.contentWidth + 100			-- Would like to destroy token here but can't figure out how
		totalFinished = totalFinished + 1
	elseif self.x < -50 then
		self.x = display.contentWidth + 30
		self.y = math.random(20, display.contentHeight)
		self.speed = math.random(2, 6)
		self.destructCount = self.destructCount + 1
	else
		self.x = self.x - self.speed
	end
end

local wave1 = function()

	wave1text = display.newText("Wave 1", 850, 50, native.systemFont, 20)
	
	goodMales = {}
	for i = 1, 4 do
		goodMales[i] = createGoodMale()
	end
	
	badMales = {}
	for i = 1, 4 do
		badMales[i] = createBadMale()
	end
	
	hiddenMales = {}
	for i = 1, 2 do
		hiddenMales[i] = createHiddenMale()
	end
	
	
	for i = 1, #goodMales do
		goodMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", goodMales[i])
	end	
		
	for i = 1, #badMales do
		badMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", badMales[i])
	end
	
	for i = 1, #hiddenMales do
		hiddenMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", hiddenMales[i])
	end
	
	print (totalFinished)
	print (#goodMales)
	
	if totalFinished >= (#goodMales + #badMales + #hiddenMales) then
		goodMales = nil
		badMales = nil
		hiddenMales = nil
		totalFinished = 0
		return 1
	end

end

local wave2 = function()

	wave2text = display.newText("Wave 2", 850, 50, native.systemFont, 20)
	
	goodMales = {}
	for i = 1, 5 do
		goodMales[i] = createGoodMale()
	end
	
	badMales = {}
	for i = 1, 5 do
		badMales[i] = createBadMale()
	end
	
	hiddenMales = {}
	for i = 1, 5 do
		hiddenMales[i] = createHiddenMale()
	end
	
	
	for i = 1, #goodMales do
		goodMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", goodMales[i])
	end	
		
	for i = 1, #badMales do
		badMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", badMales[i])
	end
	
	for i = 1, #hiddenMales do
		hiddenMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", hiddenMales[i])
	end
	
	print (totalFinished)
	
	if totalFinished >= (#goodMales + #badMales + #hiddenMales) then
		goodMales = nil
		badMales = nil
		hiddenMales = nil
		return 1
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
	physics.addBody(May, "dynamic")
	
	totalFinished = 0
	wave1()
	wave2()
	
end

function touchScreen(event)
	if event.phase == "began" then
		transition.to(May, {time=500, x=event.x, y=event.y})
	end
end

function onCollision(event)
	if event.object1 == May then
		print("collide!")
		if event.object2.mtype == "bad" then
			print("bad!")
		elseif event.object2.mtype == "good" then
			print("good!")
		elseif event.object2.mtype == "hidden" then
			print("hidden!")
		end
	end
end

Runtime:addEventListener("touch", touchScreen)

function scene:enterScene(event)

	splashText1()
	timer.performWithDelay(3000, splashText2)
	timer.performWithDelay(6000, startGame)

end


function scene:exitScene(event)

end


function scene:destroyScene(event)

end

Runtime:addEventListener("collision", onCollision)
scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene