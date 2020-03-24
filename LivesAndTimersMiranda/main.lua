-------------------------------------------------------------------------------------
-- Title: Lives and Timers
-- Name: Miranda
-- Course: ICS2O
-- This program...
-----------------------------------------------------------------------------------------

-- 
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set default background
display.setDefault("background", 175/255, 238/255, 238/255)

------------------------------------------------------------------------------------------
--LOCAL VARIABLES
------------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local NumericTextFields
local randomNumber1
local randomNumber2
local randomOperator
local userAnswer
local correctAnswer
local incorrectanswer
local totalSeconds = 10
local secondsLeft = 10
local clockText 
local countDownTimer
local lives = 4
local heart1
local heart2
local heart3
local heart4
local poiontsObject
local points = 0
local gameOver

--------------------------------------------------------------------------------------------
--SOUNDS
--------------------------------------------------------------------------------------------
--create the background music 
local bkgMusic = audio.loadSound("Sounds/bkgMusic.mp3")
local bkgMusicChannel
bkgMusicChannel = audio.play(bkgMusic)

--create the correct sound
local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel

-- create the incorrect sound
local incorrectSound = audio.loadSound("Sounds/wrongSound.mp3")
local incorrectSoundChannel

------------------------------------------------------------------------------------------
--LOCAL FUNCATIONS
------------------------------------------------------------------------------------------

local function AskQuestion()
	--generate a random number between 1 and 4 
	randomOperator = math.random(1,4)

	-- generate 2 random numbers between a max. and a min. numbers
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	-- if the random operator is 1 , then do addition
	if (randomOperator == 1) then
		--calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object 
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	--otherwise, if the random operator is 2, then do subtraction
	elseif(randomOperator == 2) then
		--calculate the correct answer 
		correctAnswer = randomNumber1 - randomNumber2

		--create the question
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	--otherwise, if the random operator is 3, then do multiplication
	elseif (randomOperator == 3) then
		--calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create question in text object 
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

	--otherwise, if the random operator is 3, then do multiplication
	elseif (randomOperator == 4) then
		--calculate the correct answer
		correctAnswer = randomNumber1/randomNumber2

		--round the answer
		math.round(correctAnswer)

		-- create question in text object 
		questionObject.text = randomNumber1 .. "/" .. randomNumber2 .. " = "
	end

end

local function HideCorrect ()
	correctObject.isVisible = false
	AskQuestion()
end 

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldlistener( event )
	-- user begins editing "numerisField"
	if (event.phase == "began" ) then

		--clear text field
		event.target.text = ""

	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		--if the user answers and the correct answer are then same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(3000, HideCorrect)
			correctSoundChannel = audio.play(correctSound)
			
		else 
			incorrectObject.isVisible = true 
			timer.performWithDelay(3000, HideIncorrect)
			incorrectSoundChannel = audio.play(incorrectSound)
		end

		--clear text field
		event.target.text = ""
	end
end

local function UpdateTime()
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then 
		--reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		if (lives == 3) then 
			heart4.isVisible = false
		elseif (lives == 2) then 
			heart3.isVisible = false
		elseif (lives == 1) then
			heart2.isVisible = false
		elseif (lives == 0) then
			heart1.isVisible = false
		end

		AskQuestion()
	end

end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

----------------------------------------------------------------------------------------
--OBJECT CREATION
----------------------------------------------------------------------------------------
 
 --displays a question and set the colour
 questionObject = display.newText ( "" , display.contentWidth/2, display.contentHeight/2, nil, 70)
 questionObject:setTextColor(185/255, 149/255, 201/255)

-- create the correct text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth/2, display.contentHeight*1/3, nil, 50)
correctObject:setTextColor(139/255, 225/255, 176/255)
correctObject.isVisible = false

--create the incorrect text object and make it invisible
incorrectObject = display.newText("Incorrect" , display.contentWidth/2, display.contentHeight*1/3, nil, 50)
incorrectObject:setTextColor(255/255, 0/255, 0/255)
incorrectObject.isVisible = false

--create numeric field
numericField = native.newTextField (display.contentWidth/2, display.contentHeight*2/3 , 200, 100)
numericField.inputType = "number"

--add the event listener for th numeric field
numericField:addEventListener( "userInput" , NumericFieldlistener)

--display the amount of time on the screen
clockText = display.newText("Time Left: " .. secondsLeft, display.contentWidth*2/8, display.contentHeight*1/7, nil, 50)
clockText:setTextColor(185/255, 149/255, 201/255)

--create the lives to display on the screen
heart1 = display.newImageRect("Images/cactus.png", 120, 120)
heart1.x = display.contentWidth*7/8
heart1.y = display.contentHeight*1/7

heart2 = display.newImageRect("Images/cactus.png", 120, 120)
heart2.x = display.contentWidth*6/8
heart2.y = display.contentHeight*1/7

heart3 = display.newImageRect("Images/cactus.png", 120, 120)
heart3.x = display.contentWidth*5/8
heart3.y = display.contentHeight*1/7

heart4 = display.newImageRect("Images/cactus.png", 120, 120)
heart4.x = display.contentWidth*4/8
heart4.y = display.contentHeight*1/7

------------------------------------------------------------------------------------------
--FUNCTION CALLS
-----------------------------------------------------------------------------------------
-- call the function to ask the question
AskQuestion()
UpdateTime()