
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()

local physics = require "physics"
physics.start()
physics.setGravity(0, 0)

-- create scene (setup)

function scene:createScene(event)
	
	local group = self.view
	
	popup = false
	
	background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(0, 0, 0)
	
	wall = display.newRect(0, 0, 1024, 100)
	group:insert(wall)
	wall:setFillColor(100, 100, 100)
	wall.isVisible = false
	physics.addBody(wall, "static")
	
	gamebox = display.newImage("images/gamebox.png")
	group:insert(gamebox)
	gamebox.x = 700
	gamebox.y = 200
	gamebox.isVisible = false
	gamebox.interact = false
	physics.addBody(gamebox, "static")
	
	tv = display.newImage("images/tv.png")
	group:insert(tv)
	tv.x = 700
	tv.y = 70
	tv.isVisible = false
	physics.addBody(tv, "static")
	
	desk = display.newRect(30, 500, 80, 160)
	group:insert(desk)
	desk:setFillColor(100, 50, 0)
	desk.isVisible = false
	physics.addBody(desk, "static")
	
	papers1 = display.newRect(30, 530, 40, 20)
	group:insert(papers1)
	papers1:setFillColor(255, 255, 255)
	papers1.isVisible = false
	
	papers2 = display.newRect(30, 525, 40, 20)
	group:insert(papers2)
	papers2:setFillColor(200, 0, 0)
	papers2.isVisible = false
	
	door = display.newImage("images/door.png")
	group:insert(door)
	door.x = 900
	door.y = 650
	door.isVisible = false
	door.interact = false
	physics.addBody(door, "static")
	
	bed = display.newImage("images/bed.png")
	group:insert(bed)
	bed.x = 100
	bed.y = 200
	bed.isVisible = false
	bed.interact = false
	physics.addBody(bed, "static")
	
	happiness = display.newText("Happiness: ", 100, 10, native.systemFont, 15)
	group:insert(happiness)
	happiness:setTextColor(0, 0, 0)
	
	happinessVal = display.newText("", 130, 10, native.systemFont, 15)
	group:insert(happinessVal)
	happinessVal.value = 0
	happinessVal.text = happinessVal.value
	
	Sheri = display.newImage("images/female.png")
	group:insert(Sheri)
	Sheri.x = 150
	Sheri.y = 250
	Sheri.isVisible = false
	physics.addBody(Sheri, "dynamic")
	
	
function moveRight(self, event)
	self.x = self.x + 3
end

function moveLeft(self, event)
	self.x = self.x - 3
end

function moveUp(self, event)
	self.y = self.y + 3
end

function moveDown(self, event)
	self.y = self.y - 3
end

function touchScreen(event)
	if event.phase == "began" then
	if popup == false then
		if event.x >= Sheri.x and event.x > Sheri.x + 10 then
			Sheri.enterFrame = moveRight
		elseif event.x < Sheri.x and event.x < Sheri.x - 10 then
			Sheri.enterFrame = moveLeft
		elseif event.y >= Sheri.y then
			Sheri.enterFrame = moveUp
		elseif event.y < Sheri.y then
			Sheri.enterFrame = moveDown
		end
		Runtime:addEventListener("enterFrame", Sheri)
	end
	end
	
	if event.phase == "ended" then
		Runtime:removeEventListener("enterFrame", Sheri)
	end
	
	if Sheri.y >= display.contentHeight then
		storyboard.gotoScene("levelSelect")
	end
	
end


function removeIntro()
	text1:removeSelf()
	text1_5:removeSelf()
	text2:removeSelf()
	text3:removeSelf()
	text4:removeSelf()
	female:removeSelf()
end	
	
local function makeVisible()
	text2.isVisible = true
	text3.isVisible = true
	text4.isVisible = true
	
	timer.performWithDelay(6000, removeIntro)
end

function splashText()
	text1 = display.newText("This is you.", 400, 100, native.systemFont, 30)
	text1_5 = display.newText("You have stats.", 400, 120, native.systemFont, 30)
	
	text2 = display.newText("Move by touching and holding your finger", 250, 500, native.systemFont, 30)
	text2.isVisible = false
	text3 = display.newText("on the screen.", 385, 550, native.systemFont, 30)
	text3.isVisible = false
	
	text4 = display.newText("Interact with objects by touching their interact bubbles.", 250, 600, native.systemFont, 30)
	text4.isVisible = false
	
	female = display.newImage("images/femaleLarge.png")
	group:insert(female)
	female.x = 490
	female.y = 340
	
	timer.performWithDelay(3000, makeVisible)
	
	
end	
	
	
end

local bedroom = function()
	tv.isVisible = true
	gamebox.isVisible = true
	wall.isVisible = true
	door.isVisible = true
	bed.isVisible = true
	desk.isVisible = true
	Sheri.isVisible = true
	papers1.isVisible = true
	papers2.isVisible = true
	before:removeSelf()
	background:setFillColor(122, 122, 122)
end

function onTouch(event)
	local t = event.target
	
	if event.phase == "began" then
		if t == gbtextbox then
			popup = true
			textfield = display.newImage("images/textfield.png")
			textfield.x = 10
			textfield.y = 500
			gbtext1 = display.newText("Want to play some video games?", 50, 400, native.systemFont, 20)
			gbtext1:setTextColor(0, 0, 0)
			gbtext1:addEventListener("touch", onTouch)
			gbtext2 = display.newText("Yes", 50, 450, native.systemFont, 20)
			gbtext2:setTextColor(0, 0, 0)
			gbtext2:addEventListener("touch", onTouch)
			gbtext3 = display.newText("No", 50, 500, native.systemFont, 20)
			gbtext3:setTextColor(0, 0, 0)
			gbtext3:addEventListener("touch", onTouch)
		
		elseif t == gbtext2 then
			gbtext1.text = "You had lots of fun. Yay! Happiness +1!"
			gbtext4 = display.newText("OK", 50, 525, native.systemFont, 20);
			gbtext4:addEventListener("touch", onTouch)
			gbtext4:setTextColor(0, 0, 0)
			gbtext2:removeSelf()
			--gbtext3:removeSelf()
		
		elseif t == gbtext4 then
			popup = false
			--textfield:removeSelf()
			--gbtext1:removeSelf()
			--gbtext4:removeSelf()
			
			
		elseif t == bedtextbox then
			popup = true
			textfield = display.newImage("images/textfield.png")
			textfield.x = 10
			textfield.y = 500
			bedtext1 = display.newText("You just woke up! Time to sieze the day!", 50, 400, native.systemFont, 20)
			bedtext1:setTextColor(0, 0, 0)
			bedtext2 = display.newText("OK", 50, 525, native.systemFont, 20)
			bedtext2:setTextColor(0, 0, 0)
			bedtext2:addEventListener("touch", onTouch)
		
		elseif t == bedtext2 then
			popup = false
			bedtextbox:removeSelf()
			bedtext1:removeSelf()
			bedtext2:removeSelf()
			textfield:removeSelf()
		
		elseif t == doortextbox then
			popup = true
			textfield = display.newImage("images/textfield.png")
			textfield.x = 10
			textfield.y = 500
			doortext1 = display.newText("Exit your room?", 50, 400, native.systemFont, 20)
			doortext1:setTextColor(0, 0, 0)
			doortext2 = display.newText("Yes", 50, 525, native.systemFont, 20)
			doortext2:setTextColor(0, 0, 0)
			doortext2:addEventListener("touch", onTouch)
			doortext3 = display.newText("No", 50, 550, native.systemFont, 20)
			doortext3:setTextColor(0, 0, 0)
			doortext3:addEventListener("touch", onTouch)
		
		elseif t == doortext2 then
			textfield:removeSelf()
			doortext1:removeSelf()
			doortext2:removeSelf()
			doortext3:removeSelf()
			storyboard.gotoScene("kitchenBefore", "fade", 500)
		
		elseif t == doortext3 then
			popup = false
			doortextbox:removeSelf()
			textfield:removeSelf()
			doortext1:removeSelf()
			doortext2:removeSelf()
			doortext3:removeSelf()
			door.interact = false
		end
	end
end

function interact(event)
	if event.object1.interact == false then
		event.object1.interact = true
		if event.object1 == gamebox then
			gbtextbox = display.newImage("images/textBox.png")
			--group:insert(gbtextbox)
			gbtextbox:translate(event.object2.x+10, event.object2.y-20)
			gbtextbox:addEventListener("touch", onTouch)
		elseif event.object1 == bed then
			print ("Bed collision")
			bedtextbox = display.newImage("images/textBox.png")
			--group:insert(bedtextbox)
			bedtextbox:translate(event.object2.x-10, event.object2.y-20)
			bedtextbox:addEventListener("touch", onTouch)
		elseif event.object1 == door then
			doortextbox = display.newImage("images/textBox.png")
			--group:insert(doortextbox)
			doortextbox:translate(event.object2.x-10, event.object2.y-20)
			doortextbox:addEventListener("touch", onTouch)
		end
	end
end

local displayOpeningText = function()
	before = display.newText("Before", 1024/2, 768/2, native.systemFont, 60)
	timer.performWithDelay(3000, bedroom)
end

function onCollision(event)
	if event.object2 == Sheri then
		print ("Collision")
			interact(event)
	end
end

function scene:enterScene(event)

	splashText()
	timer.performWithDelay(9000, displayOpeningText)
	
	Runtime:addEventListener("touch", touchScreen)
	Runtime:addEventListener("collision", onCollision)
	

end


function scene:exitScene(event)
	Runtime:removeEventListener("touch", touchScreen)
	Runtime:removeEventListener("collision", onCollision)
end


function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene