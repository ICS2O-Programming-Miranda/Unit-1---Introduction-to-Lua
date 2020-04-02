-----------------------------------------------------------------------------------------
-- Title: MathFun
-- Name: Miranda
-- Course: ICS2O
-- This program asks the user a random addition,subtraction,multiplication, division questions. 
--all division questions are rounded to 1 decimal place. If the user gets the answer correct or 
--incorrect it tells them so.
-----------------------------------------------------------------------------------------

-- 
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set default background
display.setDefault("background", 220/255, 20/255, 60/255)

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
		correctAnswer = correctAnswer * 100
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


----------------------------------------------------------------------------------------
--OBJECT CREATION
----------------------------------------------------------------------------------------
 
 --displays a question and set the colour
 questionObject = display.newText ( "" , display.contentWidth/2, display.contentHeight/2, nil, 70)
 questionObject:setTextColor(214/255, 185/255, 15/255)

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
------------------------------------------------------------------------------------------
--FUNCTION CALLS
-----------------------------------------------------------------------------------------
-- call the function to ask the question
AskQuestion()
