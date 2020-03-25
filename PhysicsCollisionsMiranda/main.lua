-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Miranda.b
-- Course: ICS2O
-- This program has objects that fall and collide with the ground. I added
-- extra objects and modified the location and angle of the beam. I also 
--added added background music.
-----------------------------------------------------------------------------------------

-- display status bar
display.setStatusBar(display.HiddenStatusBar)

--------------------------------------------------------------------------------
--load physics
local physics = require("physics")

--start physics
physics.start()

--------------------------------------------------------------------------------
--SOUNDS
--------------------------------------------------------------------------------
local bkgMusic = audio.loadSound("Sounds/bkgMusic.mp3")
local bkgMusicChannel
bkgMusicChannel = audio.play(bkgMusic)

---------------------------------------------------------------------------------
--OBJECTS
---------------------------------------------------------------------------------
--display ground
local ground = display.newImage("Images/ground.png", 0, 0)
ground.x = display.contentWidth/2
ground.y = 768

--change the width to be the same as the screen
ground.width = display.contentWidth

--add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

--display beam
local beam = display.newImage("Images/beam.png", 0, 0)

--set the x and y position
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

--set beams width and height
beam.width = display.contentWidth/2
beam.height = display.contentHeight*1/10

--rotate the beam
beam:rotate(45)

--send it to the back layer
beam:toBack()

--add to physics
physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

--add a second beam
local beam2 = display.newImage("Images/beam_long.png", 0, 0)

--set beam2s x and y position
beam2.x = 1000
beam2.y = display.contentCenterY*1.65

--set beams width and height
beam2.width = display.contentWidth/2
beam2.height = display.contentHeight*1/10

--rotate the beam
beam2:rotate(145)

--add beam to back
beam2:toBack()

--add to physics
physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

--create the background
local bkg = display.newImage("Images/bkg.png", 0, 0)

--set the x and y position
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

--set the bkg width and heigth
bkg.width = display.contentWidth
bkg.heigth = display.contentHeight

--send it to the back
bkg:toBack()

-------------------------------------------------------------------------------
--FUNCTIONS
-------------------------------------------------------------------------------
--create the first ball 
local function FirstBall()
	--creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)
	--add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end


local function SecondBall()
	-- creating second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)
	--add to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})
	ball2:scale(0.5,0.5)
end

local function ThirdBall()
	-- creating second ball
	local ball3 = display.newImage("Images/super_ball.png", 1024, 0)
	--add to physics
	physics.addBody(ball3, {density=1.5, friction=0.3, bounce=0.6, radius=80})
	ball3:scale(4,4)
end

local function FourthBall()
	-- creating second ball
	local ball4 = display.newImage("Images/super_ball.png", 1024, 0)
	--add to physics
	physics.addBody(ball4, {density=0.8, friction=1, bounce=0.8, radius=40})
	ball4:scale(2.5,2.5)
end

----------------------------------------------------------------------------------
--TIMER DELAYS - call each functions after the given millisecond
----------------------------------------------------------------------------------
timer.performWithDelay(0, FirstBall)
timer.performWithDelay(500,SecondBall)
timer.performWithDelay(0,ThirdBall)
timer.performWithDelay(500,FourthBall)