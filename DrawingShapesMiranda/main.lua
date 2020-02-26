-----------------------------------------------------------------------------------------
--Name:Miranda.B
-- Course: ICSO2
--This program displays shapes.
-----------------------------------------------------------------------------------------

-- create my local variables 
local verticesPentagon = {0, 45, 30, 0, 20,-60, -20, -60, -30, 0}
local verticesTrapazoid = {-30,55, 30, 55, 20, -30, -20, -30}
local verticesTriangle = {20, 50, 20, -20, -40, -20}
local verticesHexagon = {20, -45, 20, 45, 40, 0, 20, -45, -20, -45, -40, 0}
local halfW = display.contentWidth/4
local halfH = display.contentHeight/4

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background colour
display.setDefault("background", 250/255, 128/255, 114/255)

