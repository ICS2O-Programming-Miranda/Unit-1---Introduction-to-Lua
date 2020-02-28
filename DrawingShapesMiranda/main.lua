-----------------------------------------------------------------------------------------
--Name:Miranda.B
-- Course: ICSO2
--This program displays shapes.
-----------------------------------------------------------------------------------------

-- create my local variables 
local verticesPentagon = {7, 145, 130, 10, 120,-160, -120, -160, -130, 10}
local verticesTrapazoid = {-130,155, 130, 155, 120, -130, -120, -130}
local verticesTriangle = {120, 150, 120, -120, -140, -120}
local verticesHexagon = {120, -145, 120, 145, 140, 10, 120, -145, -120, -145, -140, 10}
local halfW = display.contentWidth/4
local halfH = display.contentHeight/4
local myPentagon
local myTrapazoid
local myTriangle
local myHexagon

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background colour
display.setDefault("background", 250/255, 128/255, 114/255)

--display my pentagon
myPentagon = display.newPolygon(10, 300, verticesPentagon)
myPentagon:scale (1, -1)

--anchor pentagon
myPentagon.anchorX = 0 
myPentagon.anchorY = 0
myPentagon.X = 600
myPentagon.Y = 600

-- set border of shapes
myPentagon.strokeWidth = 20

-- set colour of pentagram
myPentagon:setFillColor(157/255, 228/255, 233/255)

--set color of the border
myPentagon:setStrokeColor(153/255, 204/255, 255/255)

--display my trapazoid
myTrapazoid = display.newPolygon(10, 200, verticesTrapazoid)

--anchor my trapazoid
myTrapazoid.anchorX = 0
myTrapazoid.anchorY = 0
myTrapazoid.X = 600
myTrapazoid.Y = 600


