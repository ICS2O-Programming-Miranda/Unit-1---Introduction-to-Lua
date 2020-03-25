-----------------------------------------------------------------------------------------
-- Title: WhackAMole(Duck)
-- Name: Miranda.b
-- Course: ICS2O/3C
-- This program..
-----------------------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

----------------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------------
local background
local duck
local score = 0
local scoreText
----------------------------------------------------------------------------
--OBJECT CREATIONS
----------------------------------------------------------------------------
--create background
--background = display.newRect(0, 0, display.contentWidth, display.contentHeight)
display.setDefault("background", 250/255, 196/255, 188/255)

--setting position
--background.anchorX = 0
--background.anchorY = 0
--background.x = 0
--background.y = 0

--creating duck
duck = display.newImage("Images/Duck.png" , 0, 0)

--setting position
duck.x = display.contentCenterX
duck.y = display.contentCenterY

--change the size 
duck:scale(0.25, 0.25)

--make duck invisible
duck.isVisible = false

--create the score text 
scoreText = display.newText("Score: ".. score, display.contentWidth*1/5, display.contentHeight*1/6, nil,50)
scoreText:setTextColor(187/255, 245/255, 249/255)

------------------------------------------------------------------------------
--FUNCTIONS
------------------------------------------------------------------------------

--this function makes the duck appear in a random (x,y) position on the 
--screen calling the Hide function
function PopUp()
	-- choosing Random position on the screen between 0 and the size of the screen
	duck.x = math.random(0, display.contentWidth)
	duck.y = math.random(0, display.contentHeight)
	duck.isVisible = true
	timer.performWithDelay(1000, Hide)
end

--This function calls the PopUp functio after 3 seconds
function PopUpDelay( )
	timer.performWithDelay(3000, PopUp)
end

--This function makes the mole invisible and then calls the PopUpDelay function
function Hide( )
	-- changing visibility
	duck.isVisible = false

	PopUpDelay()
end

--This function starts the game
function GameStart( )
	PopUpDelay()
end

--This function increments the score only if the mole is clicked.It then displays the new score
function Whacked( event )
	--If touch phase just started 
	if(event.phase =="began") then
		score = score + 1

		--update the score text
		scoreText.text = "Score = "..score
	end


end

------------------------------------------------------------------------------------------------
--EVENT LISTENERS
------------------------------------------------------------------------------------------------
--I added the evtn listener to the duck so that if the duck is touched,
--the Whacked function is called
duck:addEventListener("touch", Whacked)

------------------------------------------------------------------------------------------------
--START THE GAME
------------------------------------------------------------------------------------------------
GameStart()