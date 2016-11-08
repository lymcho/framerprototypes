# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Ling Zhou"
	twitter: ""
	description: ""


screen = new Layer
	x:0
	y:0
	width:2880
	height: 1800
	opacity: 0
	
base = new Layer
	image: "images/beforehover.png"
	x:0	
	y:0
	size: screen.size

#number 0
number = new Layer
	html: "0"
	x: 995
	y: 1218
	color: "434343"
	backgroundColor: "transparent"
	style:
		fontSize:"24px"
	width: 70
	height: 20
	opacity: 1.00
#button 


buttonbg = new Layer
	image: "images/buttonbg.png"
	x: 1165
	y: 1199
	width: 70
	height: 70
	opacity: 0.00
	

#add icon
buttonadd = new Layer
	image: "images/buttonadd.png"
	x: 22
	y: 22
	fill: "9b9b9b"
	width: 24
	height: 24
	parent: buttonbg
	opacity: 1.00

#when hover button turns blue, add become bigger
buttonbg.onMouseOver (event, layer) ->
	buttonbg.animate
		opacity: 1
		options:
			time: 0.1
			
	buttonadd.animate
		x: 22-4
		width: 24+8
		height: 24+8
		y: 22-4
		parent: buttonbg
		options:
			time: 0.25
			curve: "ease"
				
buttonbg.onClick (event, layer) ->
	buttonadd.animate
		rotation: 90
		options:
			time:0.2

	number.html = 1 
		
#when not hovering, everything returns to normal except number 
buttonbg.onMouseOut (event, layer) ->
	buttonbg.animate
		opacity: 0
		options:
			time: 0.1
	number.html = 1 		

	
		
			
	
	
	
 