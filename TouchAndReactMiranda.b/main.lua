-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: Miranda
-- Course: ICS2O
-- This program...
-----------------------------------------------------------------------------------------

-- set background colour
display.setDefault("background", 151/255, 229/255, 216/255)

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--create the blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true 

-- create the red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198,96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--create text object, set its position and make it invisible
local textObject = display.newText("Clicked!" , 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor(229/255, 151/255, 221/255)
textObject.isVisible = false

--create the check mark, set its position and make it invisible
local checkMark = display.newImageRect("Images/checkmark.png", 150, 80)
checkMark.x = display.contentWidth/2
checkMark.y = display.contentHeight/4
checkMark.isVisible = false

--Function:BlueButtonListener
--Input:touch listener
--Output: none
--Description: when blue button is clicked, it will make the text appear with the red button,
--and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkMark,isVisible= true
		correctSoundChannel = audio.play(correctSound)
	end 

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end
 
--add the respective listenerto each object
blueButton:addEventListener("touch", BlueButtonListener)


--Function:RedButtonListener
--Input:touch listener
--Output: none
--Description: when blue button is clicked, it will make the text disappear with the red button,
--and make the blue button appear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		redButton.isVisible = false
		textObject.isVisible = false
		blueButton.isVisible = true
	end 

	if (touch.phase == "ended") then
		redButton.isVisible = true
		textObject.isVisible = true
		blueButton.isVisible = false
	end
end
 
--add the respective listenerto each object
redButton:addEventListener("touch", RedButtonListener)

----------------------------------------------------------------------------------
--SOUNDS
----------------------------------------------------------------------------------

--correct sound
local correctSound = audio.loadSound("Sounds/CorrectAnswerSoundEffect.mp3")
local correctSoundChannel


