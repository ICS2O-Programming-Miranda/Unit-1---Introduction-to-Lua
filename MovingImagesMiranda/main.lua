-----------------------------------------------------------------------------------------
-- Title: MovingObjects
-- Name: Miranda.B
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade in. I added a
-- second object that moves in a different direction, fades out, and grows in size.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
scrollSpeed = 3

--background image with width and height
local backgroundImage = display.newImageRect("images/background.png", 2048, 1536)

--character image with width and height
local beetleship = display.newImageRect("images/beetleship.png", 200, 200)

--set the image to be transparent
beetleship.alpha = 0

--set the initial x and y position for beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/2

--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	
	--add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	--chnage the transparency of the ship every time it moves so that it fades in
	beetleship.alpha = beetleship.alpha + 0.01
	
	------------------------------------------------------------------------
	--SOUNDS
	------------------------------------------------------------------------
	--local backgroundSound = audio.loadSound("Sounds/Background noise.mp3")
	--local backgroundSoundChannel 
	--play background sound
	--backgroundSoundChannel = audio.play(backgroundSound)
	--timer.performWithDelay(1000, background)

end 

--MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

--second character image with width and height
local star = display.newImageRect("images/star.png", 200, 200)

--set star to full colour
star.alpha = 1

--set the initial x and y position for star
star.x = 1024
star.y = display.contentHeight/3
star:scale(-1,1)

--Function: MoveStar
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveStar(event)
	--add the scroll speed to the x-value of the star
	star.x = star.x - scrollSpeed
	--Change the transparency of the star every time it moves so that it fades out
	star.alpha = star.alpha - 0.00001
	--make it grow as it moves across the screen
	star:scale(1.005, 1.005)
end

--star will be called over and over again
Runtime:addEventListener("enterFrame", MoveStar)