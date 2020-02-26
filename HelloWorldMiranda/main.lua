-----------------------------------------------------------------------------------------
--Name:Miranda.B
--Course:ICS20
--This program display Hello,World
--terminal
-----------------------------------------------------------------------------------------

-- Your code here
--print a gretting to the console
 print ("**** Hello Miranda")

--hide the stauts bar
display.setStatusBar(display.HiddenStatusBar)

--set the colour of the background
display.setDefault ("background",167/255, 95/255, 222/255)

--create a local variable
local textObject

--displays text on the screen at position x = 500 and y = 500 with
-- a default font style and font size of 50
textObject = display.newText( "Hello, Miranda!", 500, 300, nil, 50 )

--set the colour of the text
textObject:setTextColor(175/255, 238/255, 238/255)

--create a local variable
local textObjectSignature

-- give credit
textObjectSignature = display.newText( "By:Miranda.B" , 500, 400, nil, 40 ) 

--set colour of text
textObjectSignature:setTextColor(0/255, 0/255, 0/255)