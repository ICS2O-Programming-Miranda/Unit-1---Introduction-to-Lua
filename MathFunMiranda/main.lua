-----------------------------------------------------------------------------------------
-- Title: MathFun
-- Name: Miranda
-- Course: ICS2O
-- This program...
-----------------------------------------------------------------------------------------

-- 
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set default background
display.setDefault("background", 106/255, 121/255, 196/255)

------------------------------------------------------------------------------------------
--LOCAL VARIABLES
------------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local NumericTextFields
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectanswer

------------------------------------------------------------------------------------------
--LOCAL FUNCATIONS
------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. numbers
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end

local function HideCorrect ()
	correctObject.isVisible = false
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
		else 
			incorrectObject.isVisible = true 
			timer.performWithDelay(3000, HideIncorrect)
		end
	end

end
----------------------------------------------------------------------------------------
--OBJECT CREATION
----------------------------------------------------------------------------------------
 
 --displays a question and set the colour
 questionObject = display.newText ( "" , display.contentWidth/2, display.contentHeight/2, nil, 70)
 questionObject:setTextColor(214/255, 185/255, 15/255)

 --create the correct text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(224/255, 255/255, 255/255)
correctObject.isVisible = false

--create the incorrect text object and make it invisible
incorrectObject = display.newText("Incorrect" , display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(255/255, 0/255, 0/255)
incorrectObject.isVisible = true

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