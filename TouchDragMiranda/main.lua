-----------------------------------------------------------------------------------------
-- Title: TouchAndDrag
-- Name: Miranda
-- Course: ICS2O
-- This program...
-----------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables. 
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local girl2 = display.newImageRect("Images/girl2.png", 150, 150)
local girl2Width = girl2.width
local girl2Height = girl2.height 

local girl4 = display.newImageRect("Images/girl4.png", 150, 150)
local girl4Width = girl4.width
local girl4Height = girl4.height

local star = display.newImageRect("Images/star.png", 200, 200)
local starWidth = star.width
local starHeight = star.heigt

-- my boolean variabloes 
local alreadyTouchedGirl2 = false
local alreadyTouchedGirl4 = false
local alreadyTouchedStar = false

-- set the initial x and y position of image
girl2.x = 500
girl2.y = 400

girl4.x = 700
girl4.y = 400

star.x = 300
star.y = 400

--Funtion:Girl2Listener
--Input: touch listener
--Output: none
--Description: when girl2 is touched, move her
local function Girl2Listener(touch)
	if (touch.phase == "began") then
		if(alreadyTouchedGirl4 == false) then 
			alreadyTouchedGirl2 = true
		end
	end 

	if ( (touch.phase == "moved") and (alreadyTouchedGirl2 == true) ) then
		girl2.x = touch.x
		girl2.y = touch.y
	end 

	if (touch.phase == "ended") then
		alreadyTouchedGirl2 = false
		alreadyTouchedGirl4 = false
	end 
end 

-- add the respective listener to each object
girl2:addEventListener("touch", Girl2Listener)
		
--Funtion:Girl4Listener
--Input: touch listener
--Output: none
--Description: wen girl4 is touched, move her
local function Girl4Listener(touch)
	if (touch.phase == "began") then
		if(alreadyTouchedGirl2 == false) then 
			alreadyTouchedGirl4 = true
		end
	end 

	if ( (touch.phase == "moved") and (alreadyTouchedGirl4 == true) ) then
		girl4.x = touch.x
		girl4.y = touch.y
	end 

	if (touch.phase == "ended") then
		alreadyTouchedGirl4 = false
		alreadyTouchedGirl2 = false
	end 
end 

-- add the respective listener to each object
girl4:addEventListener("touch", Girl4Listener)
		
--Funtion:StarListener
--Input: touch listener
--Output: none
--Description: when the star is touched, move it
local function StarListener(touch)
	if (touch.phase == "began") then
		if(alreadyTouchedGirl2 == false) then 
			alreadyTouchedStar = true
		end
	end 

	if ( (touch.phase == "moved") and (alreadyTouchedStar == true) ) then
		star.x = touch.x
		star.y = touch.y
	end 

	if (touch.phase == "ended") then
		alreadyTouchedStar = false
		alreadyTouchedGirl2 = false
	end 
end 

-- add the respective listener to each object
star:addEventListener("touch", StarListener)











