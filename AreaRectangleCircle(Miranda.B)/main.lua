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
local pi = 3.14

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

--calculate thye area
areaOfRectangle =  widthOfRectangle * heightOfRectangle

--write thye area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n"
 .. widthOfRectangle .. "and the height of" .. heightOfRectangle .. "is" ..
  areaOfRectangle .. "pixels²" , 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(138/255, 43/255, 226/255)

-- add circle
