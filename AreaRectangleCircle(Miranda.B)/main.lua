-----------------------------------------------------------------------------------------
-- Title: AreaOfRectangleAndCircle
-- Name: Miranda.B
-- Course: ICS2O
-- This program displays a rectangle and shows its area 
-----------------------------------------------------------------------------------------

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle 
local areaOfCircle 
local PI = 3.14
local radius = 150
local myCircle
local areaTextCircle

--set the background of my screen.Remember that colours are between 0 and 1.
display.setDefault("background", 239/255, 202/255, 219/255) 

--to remove status bar
display.setStatusBar(display.HiddenStatusBar)

--draw the rectangle that is half the width and hieght of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) poistion
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.X = 20
myRectangle.Y = 20 

--set the width of the border
myRectangle.strokeWidth = 20

--set the colour of the rectangle
myRectangle:setFillColor( 103/255, 181/255, 209/255 )

--set the colur of the border
myRectangle:setStrokeColor( 103/255, 121/255, 209/255)

--calculate the area
areaOfRectangle =  widthOfRectangle * heightOfRectangle

--write the area on the screen.
areaText = display.newText("The area of this rectangle with a width of \n "
 .. widthOfRectangle .. " and the height of " .. heightOfRectangle .. " is " ..
  areaOfRectangle .. " pixels²." , 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(138/255, 43/255, 226/255)

-- add new circle 
myCircle = display.newCircle(0, 0, radius)

--anchor my circle
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 30
myCircle.y  = 100

--set wight of border of the circle
myCircle.strokeWidth = 20

-- set colour of the circle
myCircle:setFillColor(123/255, 104/255, 238/255)

--set the border colour
myCircle:setStrokeColor(114/255, 46/255, 203/255)

--calculate the area 
areaOfCircle = radius * radius * PI

--write the area on the screen
areaTextCircle = display.newText("The area of this circle with the radius of  \n "
.. radius .. " is " .. areaOfCircle .. " pixels²." ,0 ,0 , Arial, textSize )

-- anchor the text
areaTextCircle.anchorX = 0
areaTextCircle.anchorY = 0
areaTextCircle.x = 20
areaTextCircle.y = 500

-- set the colour of the text
areaTextCircle:setTextColor(138/255, 43/255, 226/255)