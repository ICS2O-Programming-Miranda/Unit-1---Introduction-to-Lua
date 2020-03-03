-----------------------------------------------------------------------------------------
--Name:Miranda.B
-- Course: ICSO2
--This program displays shapes.
-----------------------------------------------------------------------------------------

-- create my local variables 
local verticesPentagon = {8, 140, 130, 10, 120,-160, -120, -160, -130, 10}
local verticesTrapazoid = {-130,155, 130, 155, 120, -130, -120, -130}
local verticesTriangle = {120, 150, 120, -120, -140, -120}
local verticesHexagon = {-140, 150, 140, 150, 200, 10, 140, -150, -140, -150, -200, 10}
local halfW = display.contentWidth/4
local halfH = display.contentHeight/4
local myPentagon
local myTrapazoid
local myTriangle
local myHexagon
local triangleWidth = 40
local triangleHeight = 70
local areaOfTriangle
local areatext
local textSize = 40

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background colour
display.setDefault("background", 250/255, 128/255, 114/255)

--display my pentagon
myPentagon = display.newPolygon(10, 350, verticesPentagon)
myPentagon:scale (1, -1)

--anchor pentagon
myPentagon.anchorX = 0 
myPentagon.anchorY = 0
myPentagon.X = 600
myPentagon.Y = 600

-- set border of pentagram

myPentagon.strokeWidth = 20

-- set colour of pentagram
myPentagon:setFillColor(157/255, 228/255, 233/255)

--set color of the border
myPentagon:setStrokeColor(153/255, 204/255, 255/255)

--display my trapazoid
myTrapazoid = display.newPolygon(600, 10, verticesTrapazoid)


--anchor my trapazoid
myTrapazoid.anchorX = 0
myTrapazoid.anchorY = 0
myTrapazoid.X = 600
myTrapazoid.Y = 600

-- set border of trapazoid
myTrapazoid.strokeWidth = 20

--set colour of trapazoid
myTrapazoid:setFillColor(228/255, 72/255, 129/255)
myTrapazoid:setStrokeColor(204/255, 51/255, 153/255)

-- display my triangle
myTriangle = display.newPolygon(10, 700, verticesTriangle)
myTriangle:scale(1, -1)

--anchor my triangle
myTriangle.anchorX = 0
myTriangle.anchorY = 0
myTriangle.X = 30
myTriangle.Y = 30

--set border of triangle
myTriangle.strokeWidth = 20

--set colour of triangle
myTriangle:setFillColor(80/255, 57/255, 228/255)
myTriangle:setStrokeColor(102/255, 153/255, 255/255)

--calculate the area of the triangle 
areaOfTriangle = triangleHeight * triangleWidth/2

--display my hexagon 
myHexagon = display.newPolygon(600, 400, verticesHexagon)

-- anchor my hexagon
myHexagon.anchorX = 0
myHexagon.anchorY = 0
myHexagon.X = 40
myHexagon.Y = 40

--set border of hexagon
myHexagon.strokeWidth = 20

--set colour of hexagon
myHexagon:setFillColor(176/255, 245/255, 151/255)
myHexagon:setStrokeColor(58/255, 238/255, 58/255)
