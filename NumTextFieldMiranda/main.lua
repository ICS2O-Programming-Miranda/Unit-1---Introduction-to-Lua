-----------------------------------------------------------------------------------------
-- Title: NumericTextFields
-- Name: Miranda.B
-- Course: ICS2O
-- This program asks the user an addition question. The user enters their in a numeric text 
--field. If they answer the question correctly, "Correct!" is displayed. Otherwise, "Incorrect"
--is displayed
-----------------------------------------------------------------------------------------

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
local points = 0
local pointsText
local wrongAnswers
local wrongAnswersText
local youWin
local gameOver

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
			-- give a point if user gets the correct answer
			points = points + 1 

			-- update it in the display object
			pointsText.text = "Points = " .. points
		else 
			incorrectObject.isVisible = true 
			timer.performWithDelay(3000, HideIncorrect)
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

--display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth*1/4, display.contentHeight*1/4, nil, 50)

--display the "You Win" text object and make it invisible 




------------------------------------------------------------------------------------------
--FUNCTION CALLS
-----------------------------------------------------------------------------------------
-- call the function to ask the question
AskQuestion()