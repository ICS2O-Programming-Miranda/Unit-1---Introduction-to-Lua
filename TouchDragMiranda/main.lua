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

-- my boolean variabloes 
local alreadyTouchedGirl2 = false
local alreadyTouchedGirl4 = false

-- set the initial x and y position of image
girl2.x = 400
girl2.y = 400

girl4.x = 600
girl4.y = 400

--Funtion:Girl2Listener
--Input: touch listener
--Output: none
--Description: wen girl2 is touched, move her
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
		













