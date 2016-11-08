# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: "Spring Curve Canvas"
	author: "Benjamin den Boer"
	twitter: "benjaminnathan"
	description: "Next week we’re unveiling a brand new way to design animations! As part of our design process, we prototyped this feature entirely in Framer. Here’s a sneak peek of what’s in store for you next Thursday, October 13th."


# Default cursor
document.body.style.cursor = "auto"

# Canvas Set-up
bg1 = new Layer
	backgroundColor: "#000"
	width: Screen.width / 2
	height: Screen.height
	
bg2 = new Layer
	backgroundColor: "#00AAFF"
	width: Screen.width / 2
	height: Screen.height
	x: Screen.width / 2

canvasSize = 200
	
box = new Layer
	backgroundColor: "#111"
	size: canvasSize
	height: 125
	clip: false
	parent: bg1
	borderRadius: 2
	
box.style.boxShadow = "0 0 0 1px rgba(255,255,255,0.15)"

xLine = new Layer
	backgroundColor: "rgba(255,255,255,0.05)"
	height: 1
	width: box.width
	parent: box 
	y: Align.center

yLine = new Layer
	backgroundColor: "rgba(255,255,255,0.05)"
	width: 1
	height: box.height
	parent: box 
	x: Align.center
	
box.center()
box.pixelAlign()

canvas = document.createElement("canvas")
canvas.width = canvasSize * 2
canvas.height = canvasSize * 2 

# For 2x
canvas.style.width = "#{canvasSize}px" 
canvas.style.height = "#{canvasSize}px" 

box._element.appendChild(canvas)
ctx = canvas.getContext("2d")
ctx.scale(2,2)

lineWidth = 1
curveColor = "#fff"

tension = 400
friction = 10
velocity = 0
values = 0	

# Sliders
tSlider = new SliderComponent
	width: 120
	height: 2
	knobSize: 10
	midX: box.midX
	y: Align.center(100)
	min: 100
	max: 600
	value: tension
	backgroundColor: "rgba(255,255,255,0.2)"

fSlider = new SliderComponent
	width: 120
	height: 2
	knobSize: 10
	midX: box.midX
	y: Align.center(130)
	min: 5
	max: 50
	value: friction
	backgroundColor: "rgba(255,255,255,0.2)"
	
vSlider = new SliderComponent
	width: 120
	height: 2
	knobSize: 10
	midX: box.midX
	y: Align.center(160)
	min: 0
	max: 25
	value: velocity
	backgroundColor: "rgba(255,255,255,0.2)"
	
# Styling of all sliders
for slider in [tSlider, fSlider, vSlider]
	slider.fill.backgroundColor = "#fff"
	slider.knob.draggable.momentum = false
	slider.knob.draggable.overdrag = false
	slider.knob.draggable.bounce = false
	slider.knob.style.boxShadow = "0 0 0 1px black"
	slider.pixelAlign()

labelStyle = 
	font: "500 13px/1 SF UI Text, Helvetica Neue"
	color: "#666"
	lineHeight: "20px"
	
tLabel = new Layer
	width: 20
	height: 20
	x: tSlider.x - 40
	y: tSlider.y - 8
	html: "T"
	style: labelStyle
	backgroundColor: "transparent"
	
fLabel = new Layer
	width: 20
	height: 20
	x: fSlider.x - 40
	y: fSlider.y - 8
	html: "F"
	style: labelStyle
	backgroundColor: "transparent"	
	
vLabel = new Layer
	width: 20
	height: 20
	x: vSlider.x - 40
	y: vSlider.y - 8
	html: "V"
	style: labelStyle
	backgroundColor: "transparent"	
	
tNum = new Layer
	width: 20
	height: 20
	x: tSlider.maxX + 20
	y: tSlider.y - 8
	html: tSlider.value
	style: labelStyle
	backgroundColor: "transparent"	
	
fNum = new Layer
	width: 20
	height: 20
	x: fSlider.maxX + 20
	y: fSlider.y - 8
	html: fSlider.value
	style: labelStyle
	backgroundColor: "transparent"		
	
vNum = new Layer
	width: 20
	height: 20
	x: vSlider.maxX + 20
	y: vSlider.y - 8
	html: vSlider.value
	style: labelStyle
	backgroundColor: "transparent"			
	
	
	
	
	

# Curve rendering		
ctx.strokeStyle = curveColor
ctx.lineWidth = lineWidth

getValues = (tension, friction, velocity) ->
	rk4 = new Framer.SpringRK4Animator
		tension: tension
		friction: friction
		velocity: velocity
		tolerance: 1/10000
	
	values = rk4.values(1/120, 1000)	
	
draw = ->
	ctx.clearRect(0, 0, canvas.width, canvas.height)
	ctx.beginPath()
	
	adjustedValues = []
	
	for index, value of values
		previous = values[index - 1] * (box.height / 2)
		current = values[index] * (box.height / 2)
		delta = previous - current
		
		if Math.abs(delta) > 0.01
			adjustedValues.push(value)
		
	for index, value of adjustedValues
		l = adjustedValues.length 
		i = index
		x = parseInt(i) * (box.width / (l)) 
		y = value * (box.height / 2)
		
		ctx.lineTo(x, box.height - y)
		
	ctx.stroke()

getValues(tension, friction, velocity)	
draw()

# Slider value mapping
tSlider.onValueChange ->
	tNum.html = Utils.round(@value)
	getValues(Utils.round(@value), friction, velocity)
	draw()

	unless @knob.draggable.isMoving
		tenstion = Utils.round(@value)
		friction = Utils.round(fSlider.value)
		velocity = Utils.round(vSlider.value)
		animTest("spring(#{tension}, #{friction}, #{velocity})")
		
fSlider.onValueChange ->
	fNum.html = Utils.round(@value)
	getValues(tension, Utils.round(@value), velocity)
	draw()
	
	unless @knob.draggable.isMoving
		tenstion = Utils.round(tSlider.value)
		friction = Utils.round(@value)
		velocity = Utils.round(vSlider.value)
		animTest("spring(#{tension}, #{friction}, #{velocity})")
	
vSlider.onValueChange ->
	vNum.html = Utils.round(@value)
	getValues(tension, friction, Utils.round(@value))
	draw()
	
	unless @knob.draggable.isMoving
		tenstion = Utils.round(tSlider.value)
		friction = Utils.round(fSlider.value)
		velocity = Utils.round(@value)
		animTest("spring(#{tension}, #{friction}, #{velocity})")
		
fSlider.knob.onDragEnd ->
	tenstion = Utils.round(tSlider.value)
	friction = Utils.round(fSlider.value)
	animTest("spring(#{tension}, #{friction}, 0)")

tSlider.knob.onDragEnd ->
	tension = Utils.round(tSlider.value)
	friction = Utils.round(fSlider.value)
	animTest("spring(#{tension}, #{friction}, 0)")
		
# Preview Animation
testLayerSize = 60		
padding = 30
yOffset = 15

rotateLayer = new Layer
	size: testLayerSize
	x: Align.center(-testLayerSize / 2 - padding)
	y: Align.center(-testLayerSize / 2)
	borderRadius: 2
	backgroundColor: "#fff"
	parent: bg2

scaleBG = new Layer
	size: testLayerSize
	x: Align.center(testLayerSize / 2 + padding)
	y: Align.center(-testLayerSize/2)
	borderRadius: 2
	backgroundColor: "rgba(255,255,255,0.2)"
	parent: bg2
		
scaleLayer = new Layer
	size: testLayerSize
	x: Align.center(testLayerSize / 2 + padding)
	y: Align.center(-testLayerSize/2)
	borderRadius: 2
	backgroundColor: "#fff"
	parent: bg2
	
radiusLayer = new Layer
	size: testLayerSize
	x: Align.center(-testLayerSize / 2 - padding)
	y: Align.center(testLayerSize/2 + padding * 2)
	borderRadius: 2
	backgroundColor: "#fff"
	parent: bg2	

widthBG = new Layer
	size: testLayerSize
	x: Align.center(testLayerSize / 2 + padding)
	y: Align.center(testLayerSize/2 + padding * 2)
	borderRadius: 2
	backgroundColor: "rgba(255,255,255,0.2)"
	parent: bg2
	
widthLayer = new Layer
	size: testLayerSize
	x: Align.center(testLayerSize / 2 + padding)
	y: Align.center(testLayerSize/2 + padding * 2)
	borderRadius: 2
	backgroundColor: "#fff"
	parent: bg2	
		
# Values
rotationValue = new Layer
	clip: false
	html: "Rotation: 0"
	backgroundColor: "transparent"
	width: testLayerSize + 40
	height: 20
	x: rotateLayer.x
	y: rotateLayer.maxY + yOffset
	parent: bg2

valueStyle =
	font: "500 12px/1.5 SF UI Text, Helvetica Neue"
	color: "rgba(255,255,255,1)"
	textAlign: "left"
	
rotationValue.style = valueStyle

scaleValue = new Layer
	clip: false
	html: "Scale: 0"
	backgroundColor: "transparent"
	width: testLayerSize + 40
	height: 20
	x: scaleLayer.x
	y: scaleLayer.maxY + yOffset
	parent: bg2

scaleValue.style = valueStyle

radiusValue = new Layer
	clip: false
	html: "Radius: 2"
	backgroundColor: "transparent"
	width: testLayerSize + 40
	height: 20
	x: radiusLayer.x
	y: radiusLayer.maxY + yOffset
	parent: bg2

radiusValue.style = valueStyle

widthValue = new Layer
	clip: false
	html: "Width: #{testLayerSize}"
	backgroundColor: "transparent"
	width: testLayerSize + 40
	height: 20
	x: widthLayer.x
	y: widthLayer.maxY + yOffset
	parent: bg2

widthValue.style = valueStyle
	
animTest = (curve) ->
	# Scale
	if scaleLayer.scale is 1
		scaleLayer.animate
			properties:
				scale: 0.5
			curve: curve
	else 
		scaleLayer.animate
			properties:
				scale: 1
			curve: curve
			
	# Rotate
	if rotateLayer.rotation is 0
		rotateLayer.animate
			properties:
				rotation: 90
			curve: curve
	else
		rotateLayer.animate
			properties:
				rotation: 0
			curve: curve	
			
	# Radius
	if radiusLayer.borderRadius is 2
		radiusLayer.animate 
			properties:
				borderRadius: 50
			curve: curve
	else
		radiusLayer.animate
			properties:
				borderRadius: 2
			curve: curve	
	
	# Width
	if widthLayer.width is testLayerSize
		widthLayer.animate 
			properties:
				width: testLayerSize / 2
			curve: curve
	else
		widthLayer.animate
			properties:
				width: testLayerSize 
			curve: curve	
					
	scaleLayer.on "change:scale", ->
		scaleValue.html = "Scale: #{Utils.round(@scale, 3)}"
		
	rotateLayer.on "change:rotation", ->
		rotationValue.html = "Rotation: #{Utils.round(@rotation)}"
		
	radiusLayer.on "change:borderRadius", ->
		radiusValue.html = "Radius: #{Utils.round(@borderRadius)}"
		
	widthLayer.on "change:width", ->
		widthValue.html = "Width: #{Utils.round(@width)}"
		

