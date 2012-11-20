
--print(a)
--[[
a = "a"
b = 10

c = "10"
d = 10 
result = c + d
print(result)



local a = 10
local b = 5
local str = "string"

local x

if a > b then
	--local x
	x = 20
end
print(x) -- 20


if a > b then
	-- true
elseif
	--
elseif
	-- 
end


for i=1, 10 do
	print(i)
end

local i = 1
while i < 10 do
	print("while" .. i)
	i = i + 1
end 

]]--


local myImage = display.newImage(
			"images/sky.jpg")

--[[
local rocket = display.newImage(
			"images/rocket.png")
rocket.x = 100
rocket.y = 280

transition.from(rocket, {time=3000,
		 x = -display.contentWidth /2, 
		 y= 400,
		  transition = easing.outExpo})



local myText = display.newText("Hello",
		0,0, native.systemFont, 36)
		
myText.x = 160
myText.y = 200

myText.text = "Hello coronaSDK"
myText:setTextColor(10,255,255)
myText.size = 38
myText.font = native.systemFontBold

--myText.x = display.contentCenterX
--myText.y = display.contentCenterY



local myRectangle = display.newRect(
0, 0, 150, 40) 
myRectangle.strokeWidth = 3 
myRectangle:setFillColor(110, 110, 10) 
myRectangle:setStrokeColor(30, 255, 180)

myRectangle.x = 200
myRectangle.y = 200

-- Circle

local circleGroup = display.newGroup()

local myCircle = display.newCircle(0,0,30)
myCircle.x = 100
myCircle.y = 100

circleGroup:insert(myCircle)

myCircle:setFillColor(255,255,0)
myCircle.strokeWidth = 5
myCircle:setStrokeColor(255,110,0)

local myCircle2 = display.newCircle(0,0,30)
myCircle2.x = 180
myCircle2.y = 100

myCircle2:setFillColor(255,255,0)
myCircle2.strokeWidth = 5
myCircle2:setStrokeColor(255,110,0)

circleGroup:insert(myCircle2)

local myCircle3 = display.newCircle(0,0,30)
myCircle3.x = 250
myCircle3.y = 100

myCircle3:setFillColor(255,255,0)
myCircle3.strokeWidth = 5
myCircle3:setStrokeColor(255,110,0)
circleGroup:insert(myCircle3)

circleGroup.y = 2

transition.from(circleGroup, {time=3000,
		 x = -display.contentWidth /2, 
		 y= 400,
		  transition = easing.outQuad})

]]--







--[[

local physics = require "physics"
physics.start()
physics.setDrawMode( "debug" ) 
physics.setDrawMode( "hybrid" ) 
physics.setDrawMode( "normal" )


physics.addBody( ball, { density = 1.0, friction = 0.3, bounce =
0.2, radius = 25 } )




--tmr = timer.performWihtDelay(1000,listener,0)



]]--


--local play = display.newImage("images/play.png")
--play.x = 165
--play.y = 100
--[[
pX = play.x
pY = play.y

local function playTouch(e)
	if e.phase == "began" then
		print("began")
	elseif e.phase == "moved" then
		print("moved")
		play.x = e.x
		play.y = e.y
	elseif e.phase == "ended" then
		print("ended")
		play.x = pX
		play.y = pY
	end
end
play:addEventListener("touch", playTouch)
]]--
--[[
local x = 0
local function playTap(e)
	x = x + 1
	print(x)
end
play:addEventListener("tap", playTap)
]]--
--[[
local point = 0
local point_txt = display.newText("point",0,0,
			 native.systemFont, 32)
point_txt:setTextColor(0,0,0)
point_txt.x = 280
point_txt.y = 450

local win_txt = display.newText("win",
		0,0,native.systemFont, 62)
win_txt:setTextColor(0,0,0)
win_txt.x = display.contentCenterX
win_txt.y = display.contentCenterY
win_txt.alpha = 0

local pop = audio.loadSound("sounds/pop.WAV")

local function listener( event )
	local ball = display.newCircle(0,0,25)
	ball:setFillColor(100,10,120)
	ball.x = math.random(50,200)
	ball.y = math.random(50,400)
	
	local function removeBall(e)
		point = point + 1
		point_txt.text = point
		
		audio.play(pop)
		
		ball:removeSelf()
		
		if point >= 10 then
			win_txt.alpha = 1
		end
		--ball.alpha = 0
		
		return true
	end
	
	ball:addEventListener("tap", 
						removeBall)
	 
end
tr = timer.performWithDelay(500, listener,10 )


]]--

local pop = audio.loadSound("sounds/pop.WAV")

local physics = require "physics"
physics.start()
--physics.setDrawMode( "debug" ) -- shows collision engine outlines only
--physics.setDrawMode( "hybrid" ) 
local function randomBall(e)
	local ball = display.newCircle(0,0, 25)
	ball:setFillColor(252,151,241)
	ball.x = math.random(200)
	ball.y = math.random(20)
	
	physics.addBody(ball, { density = 1.0, 
	friction = 0.3, bounce = 0.5})
	
	local function removeBall(e)
		audio.play(pop)
		ball:removeSelf()
		return true
	end
	ball:addEventListener("tap", 
						removeBall)
	
end
tr = timer.performWithDelay(1000, 
					randomBall,50 )

local wall = display.newRect(0,0,
display.contentWidth,8)
wall:setFillColor(0,0,0)
wall.y = 450
wall.alpha = 0

physics.addBody(wall, "static",{ density = 1.0,
 friction = 0.3, bounce = 1.0})
--wall.rotation = 25

local left_wall = display.newRect(0,0,
4,display.contentHeight)
left_wall:setFillColor(167,96,20)

physics.addBody( left_wall, "static", { density = 1.0, friction =
0.3, bounce = 0.5} )

local right_wall = display.newRect(0,0,
4,display.contentHeight)
right_wall:setFillColor(167,96,20)
right_wall.x = display.contentWidth
physics.addBody( right_wall, "static",
 { density = 1.0, friction = 0.3,
  bounce = 0.5} )













