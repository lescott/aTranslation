
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()

local physics = require "physics"
physics.start()
physics.setGravity(0, 0)

-- create scene (setup)

function scene:createScene(event)

	group = self.view
	
	numOfHearts = display.newText("Hearts:       / 14", 200, 10, native.systemFont, 15)
	numOfHearts.val = 0
	numOfHearts.isVisible = false
	numOfBlackHearts = display.newText("Black hearts: ", 400, 10, native.systemFont, 15)
	numOfBlackHearts.val = 0
	numOfBlackHearts.isVisible = false
	
	background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(0, 0, 0)
	
--	May = display.newImage("images/female.png")
--	group:insert(May)
--	May.x = 100
--	May.y = 400
	
--	hiddenMale = display.newImage("images/male.png")
--	group:insert(hiddenMale)
--	hiddenMale.x = 600

end

local splashText1 = function()

	female = display.newImage("images/femaleLarge.png")
	text1 = display.newText("This is you.", 100, 100, native.systemFont, 20)

end

local splashText2 = function()

	text2 = display.newText("Move by tapping the screen.", 100, 500, native.systemFont, 20)

end

local splashText3 = function()

	female:removeSelf()
	text1:removeSelf()
	text2:removeSelf()
	badMale = display.newImage("images/badMaleLarge.png")
	group:insert(badMale)
	badMale.x = 275
	badMale.y = 310
	
	goodMale = display.newImage("images/maleLarge.png")
	group:insert(goodMale)
	goodMale.x = 650
	goodMale.y = 300
	
	text3 = display.newText("Try to avoid bad guys/strangers.", 125, 500, native.systemFont, 20)

end

local splashText4 = function()

	text4 = display.newText("Stay close to your friends.", 575, 500, native.systemFont, 20)

end 

local createGoodMale = function()
	
	local goodMale = display.newImage("images/male.png")
	goodMale.x = 1200
	goodMale.y = math.random(display.contentHeight)
	goodMale.speed = math.random(2, 4)
	goodMale.mtype = "good"
	goodMale.destructCount = 0
	goodMale.touched = false
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
	badMale.touched = false
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
	hiddenMale.touched = false
	physics.addBody(hiddenMale, "static")
	return hiddenMale
	
end

local move = function(self, event)
	if self.touched == false then
		if self.destructCount >= 2 then
			self.x = display.contentWidth + 100			-- Would like to destroy token here but can't figure out how
			totalFinished = totalFinished + 1
		elseif self.x < -50 then
			self.x = display.contentWidth + 30
			self.y = math.random(20, display.contentHeight)
			self.speed = math.random(4, 6)
			self.destructCount = self.destructCount + 1
		else
			self.x = self.x - self.speed
		end
	end
end

local wave1 = function()

	numOfHearts.isVisible = true
	numberH = display.newText(tostring(numOfHearts.val), 250, 10, native.systemFont, 15)
	--numOfBlackHearts.isVisible = true
	numberB = display.newText(tostring(numOfBlackHearts.val), 450, 10, native.systemFont, 15)
	numberB.isVisible = false
	
	wave1text = display.newText("Wave 1", 850, 50, native.systemFont, 20)
	
	goodMales = {}
	for i = 1, 4 do
		goodMales[i] = createGoodMale()
	end
	
	badMales = {}
	for i = 1, 4 do
		badMales[i] = createBadMale()
	end
	
--	hiddenMales = {}
--	for i = 1, 2 do
--		hiddenMales[i] = createHiddenMale()
--	end
	
	
	for i = 1, #goodMales do
		goodMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", goodMales[i])
	end	
		
	for i = 1, #badMales do
		badMales[i].enterFrame = move
		Runtime:addEventListener("enterFrame", badMales[i])
	end
	
--	for i = 1, #hiddenMales do
--		hiddenMales[i].enterFrame = move
--		Runtime:addEventListener("enterFrame", hiddenMales[i])
--	end
	
	print (totalFinished)
	print (#goodMales)
	
	if totalFinished >= (#goodMales + #badMales) then
		goodMales = nil
		badMales = nil
--		hiddenMales = nil
		totalFinished = 0
		wave1text:removeSelf()
		return 1
	end

end

local wave2 = function()

	wave1text:removeSelf()
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
	
	if totalFinished >= (#goodMales + #badMales + #hiddenMales) then
		goodMales = nil
		badMales = nil
		hiddenMales = nil
		return 1
	end

end

local wave3 = function()

	wave2text:removeSelf()
	wave3text = display.newText("Wave 3", 850, 50, native.systemFont, 20)
	
	goodMales = {}
	for i = 1, 5 do
		goodMales[i] = createGoodMale()
	end
	
	badMales = {}
	for i = 1, 6 do
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

local finalWave = function()

	wave3text:removeSelf()
	wave4text = display.newText("Final Wave", 850, 50, native.systemFont, 20)

	boyfriend = display.newImage("images/male.png")
	boyfriend.x = 1200
	boyfriend.y = math.random(display.contentHeight)
	boyfriend.speed = math.random(2, 4)
	boyfriend.mtype = "boyfriend"
	boyfriend.destructCount = 0
	boyfriend.touched = false
	physics.addBody(boyfriend, "static")
	
	boyfriend.enterFrame = move
	Runtime:addEventListener("enterFrame", boyfriend)

end


local startGame = function()
	
	text3:removeSelf()
	text4:removeSelf()
	badMale:removeSelf()
	goodMale:removeSelf()
	
	background:setFillColor(122, 122, 122)
	May = display.newImage("images/femaleOutline.png")
	group:insert(May)
	May.x = 100
	May.y = 400
	May.R = 254
	May.G = 0
	May.B = 255
	May:setFillColor(May.R, May.G, May.B)
	physics.addBody(May, "dynamic")
	
	totalFinished = 0
	wave1()
	timer.performWithDelay(30000, wave2)
	timer.performWithDelay(50000, wave3)
	timer.performWithDelay(75000, finalWave)
	
end

function touchScreen(event)
	if event.phase == "began" then
		transition.to(May, {time=500, x=event.x, y=event.y})
	end
end

function displayHeart(event)
	if event.object2.touched == false then
		heart = display.newImage("images/heart.png")
		heart:translate(event.object2.x, event.object2.y)
		transition.to( heart, { time=1500, alpha=0, x=(event.object2.x-50), y=(event.object2.y-50) } )
		transition.to(event.object2, {time=1500, alpha=0})
		transition.to(event.object2, {time=1, delay=2000, x=display.contentWidth+500, y=display.contentHeight-100})
		event.object2.touched = true
	end
end

function badDisappear(event)
	if event.object2.touched == false then
		heart = display.newImage("images/heart.png")
		heart:setFillColor(0, 0, 0)
		heart:translate(event.object2.x, event.object2.y)
		transition.to( heart, { time=1500, alpha=0, x=(event.object2.x-50), y=(event.object2.y-50) } )
		transition.to(event.object2, {time=1500, alpha=0})
		transition.to(event.object2, {time=1, delay=2000, x=display.contentWidth+500, y=display.contentHeight-200})
		event.object2.touched = true
	end
end

function onCollision(event)
	if event.object1 == May then
		if event.object2.touched == false then
			print("collide!")
			if event.object2.mtype == "bad" or event.object2.mtype == "hidden" then
				print("bad!")
				numOfBlackHearts.val = numOfBlackHearts.val + 1
				numberB.text = tostring(numOfBlackHearts.val)
				if May.R > 100 then
					May.R = May.R - 30
					print ("May.R = ")
					print (May.R)
				end
				if May.G < 100 then
					May.G = May.G + 10
					print ("May.G = ")
					print (May.G)
				end
				if May.B > 100 then
					May.B = May.B - 30
					print ("May.B = ")
					print (May.B)
				end
				badDisappear(event)
				May:setFillColor(May.R, May.G, May.B)
			elseif event.object2.mtype == "good" then
				numOfHearts.val = numOfHearts.val + 1
				numberH.text = tostring(numOfHearts.val)
				print("good!")
				displayHeart(event)
			elseif event.object2.mtype == "boyfriend" then
				wave4text:removeSelf()
				storyboard.gotoScene("endScen2", "fade", 500)
			end
		end
	end
end

Runtime:addEventListener("touch", touchScreen)

function scene:enterScene(event)

	splashText1()
	timer.performWithDelay(3000, splashText2)
	timer.performWithDelay(6000, splashText3)
	timer.performWithDelay(9000, splashText4)
	timer.performWithDelay(12000, startGame)

end


function scene:exitScene(event)

	Runtime:removeEventListener("touch", touchScreen)
	Runtime:removeEventListener("enterFrame", boyfriend)
	Runtime:removeEventListener("collision", onCollision)

end

function scene:didExitScene( event )
storyboard.purgeScene( "scenario2" )
end
scene:addEventListener( "didExitScene" )


function scene:destroyScene(event)

end

Runtime:addEventListener("collision", onCollision)
scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene