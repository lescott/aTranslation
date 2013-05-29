
-- requires

local storyboard = require "storyboard"
local scene = storyboard.newScene()

local physics = require "physics"
physics.start()
physics.setGravity(0, 0)


function scene:createScene(event)

	local group = self.view
	
	popup = false
	
	background = display.newRect(0, 0, 1024, 768)
	group:insert(background)
	background:setFillColor(122, 122, 122)
	
	wall = display.newRect(0, 0, 1024, 100)
	group:insert(wall)
	wall:setFillColor(100, 100, 100)
	physics.addBody(wall, "static")
	
	Sheri = display.newImage("images/female.png")
	group:insert(Sheri)
	Sheri.x = 150
	Sheri.y = 600
	physics.addBody(Sheri, "dynamic")
	
	fridge = display.newImage("images/fridge.png")
	group:insert(fridge)
	fridge.x = 400
	fridge.y = 140
	fridge.interact = false
	physics.addBody(fridge, "static")
	
	mom = display.newImage("images/female.png")
	group:insert(mom)
	mom.x = 700
	mom.y = 200
	mom.interact = false
	physics.addBody(mom, "static")
	
	kitchentable = display.newRect(300, 380, 250, 200)
	group:insert(kitchentable)
	kitchentable:setFillColor(100, 50, 0)
	physics.addBody(kitchentable, "static")
	
	chair = display.newImage("images/chair.png")
	group:insert(chair)
	chair.x = 240
	chair.y = 470
	physics.addBody(chair, "static")
	
	door = display.newImage("images/door.png")
	group:insert(door)
	door.x = 900
	door.y = 100
	door.interact = false
	physics.addBody(door, "static")

end

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



function onTouch(event)
	local t = event.target
	
	if event.phase == "began" then
		if t == fridgetextbox then
			popup = true
			textfield = display.newImage("images/textfield.png")
			textfield.x = 10
			textfield.y = 500
			fridgetext1 = display.newText("Hmm... what do I want to eat?", 50, 400, native.systemFont, 20)
			fridgetext1:setTextColor(0, 0, 0)
			fridgetext1:addEventListener("touch", onTouch)
			fridgetext2 = display.newText("Sandwich", 50, 450, native.systemFont, 20)
			fridgetext2:setTextColor(0, 0, 0)
			fridgetext2:addEventListener("touch", onTouch)
			fridgetext3 = display.newText("Banana", 50, 500, native.systemFont, 20)
			fridgetext3:setTextColor(0, 0, 0)
			fridgetext3:addEventListener("touch", onTouch)
		
		elseif t == fridgetext2 then
			fridgetext1.text = "Mmmm... turkey is so yummy. Happiness +1!"
			fridgetext4 = display.newText("OK", 50, 525, native.systemFont, 20);
			fridgetext4:addEventListener("touch", onTouch)
			fridgetext4:setTextColor(0, 0, 0)
			fridgetext2:removeSelf()
			fridgetext3:removeSelf()
		
		elseif t == fridgetext3 then
			fridgetext1.text = "Mmmm... fruit is so yummy. Happiness +1!"
			fridgetext4 = display.newText("OK", 50, 525, native.systemFont, 20);
			fridgetext4:addEventListener("touch", onTouch)
			fridgetext4:setTextColor(0, 0, 0)
			fridgetext2:removeSelf()
			fridgetext3:removeSelf()
		
		elseif t == fridgetext4 then
			popup = false
			fridgetext1:removeSelf()
			fridgetext4:removeSelf()
			textfield:removeSelf()
			fridgetextbox:removeSelf()
			
		elseif t == momtextbox then
			popup = true
			textfield = display.newImage("images/textfield.png")
			textfield.x = 10
			textfield.y = 500
			momtext1 = display.newText("Ready for your date tonight?", 50, 400, native.systemFont, 20)
			momtext1:setTextColor(0, 0, 0)
			momtext2 = display.newText("Aw jeez, mom...", 50, 450, native.systemFont, 20)
			momtext2:setTextColor(0, 0, 0)
			momtext2:addEventListener("touch", onTouch)
			momtext3 = display.newText("Yeah super psyched!", 50, 500, native.systemFont, 20)
			momtext3:setTextColor(0, 0, 0)
			momtext3:addEventListener("touch", onTouch)
			
		elseif t == momtext2 then
			momtext1:removeSelf()
			momtext2:removeSelf()
			momtext3:removeSelf()
			momtext4 = display.newText("Oh, sweetie. You know I just", 50, 400, native.systemFont, 20)
			momtext4:setTextColor(0, 0, 0)
			momtext5 = display.newText("want you to have fun!", 50, 450, native.systemFont, 20)
			momtext5:setTextColor(0, 0, 0)
			momtext6 = display.newText("OK", 50, 500, native.systemFont, 20)
			momtext6:setTextColor(0, 0, 0)
			momtext6:addEventListener("touch", onTouch)
		
		elseif t == momtext3 then
			momtext1:removeSelf()
			momtext2:removeSelf()
			momtext3:removeSelf()
			momtext7 = display.newText("Great! James seems nice.", 50, 400, native.systemFont, 20)
			momtext7:setTextColor(0, 0, 0)
			momtext8 = display.newText("Hope you have fun!", 50, 450, native.systemFont, 20)
			momtext8:setTextColor(0, 0, 0)
			momtext9 = display.newText("OK", 50, 500, native.systemFont, 20)
			momtext9:setTextColor(0, 0, 0)
			momtext9:addEventListener("touch", onTouch)
		
		elseif t == momtext6 then
			popup = false
			momtextbox:removeSelf()
			momtext4:removeSelf()
			momtext5:removeSelf()
			momtext6:removeSelf()
			textfield:removeSelf()
		
		elseif t == momtext9 then
			popup = false
			momtextbox:removeSelf()
			momtext7:removeSelf()
			momtext8:removeSelf()
			momtext9:removeSelf()
			textfield:removeSelf()
			
		elseif t == doortextbox then
			popup = true
			textfield = display.newImage("images/textfield.png")
			textfield.x = 10
			textfield.y = 500
			doortext1 = display.newText("Leave for school? Your date is after school.", 50, 400, native.systemFont, 20)
			doortext1:setTextColor(0, 0, 0)
			doortext2 = display.newText("Let's go!", 50, 450, native.systemFont, 20)
			doortext2:setTextColor(0, 0, 0)
			doortext2:addEventListener("touch", onTouch)
			doortext3 = display.newText("Not yet.", 50, 500, native.systemFont, 20)
			doortext3:setTextColor(0, 0, 0)
			doortext3:addEventListener("touch", onTouch)
		
		elseif t == doortext2 or t == doortext3 then
			doortext1:removeSelf()
			doortext2:removeSelf()
			doortext3:removeSelf()
			textfield:removeSelf()
			doortextbox:removeSelf()
		end
	end
end

function interact(event)
	if event.object2.interact == false then
		event.object2.interact = true
		if event.object2 == fridge then
			fridgetextbox = display.newImage("images/textBox.png")
			fridgetextbox:translate(event.object1.x+10, event.object1.y-20)
			fridgetextbox:addEventListener("touch", onTouch)
		elseif event.object2 == mom then
			momtextbox = display.newImage("images/textBox.png")
			momtextbox:translate(event.object1.x+10, event.object1.y-20)
			momtextbox:addEventListener("touch", onTouch)
		elseif event.object2 == door then
			doortextbox = display.newImage("images/textBox.png")
			doortextbox:translate(event.object2.x+10, event.object2.y-20)
			doortextbox:addEventListener("touch", onTouch)
		end
	end
end

function onCollision(event)
	if event.object1 == Sheri then
		print ("Collision")
		interact(event)
	end
end


function scene:enterScene(event)
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