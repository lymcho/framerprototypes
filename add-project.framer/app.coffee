# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: "Add Project"
	author: "Benjamin den Boer"
	twitter: "benjaminnathan"
	description: ""


# Background
Canvas.backgroundColor = "#3E50B4"

# Layer set-up
screen = new Layer
	width: 1080
	height: 1920
	image: "images/screen.png"

fade = new Layer
	size: Screen.size 
	backgroundColor: "rgba(0,0,0,0.3)"
	opacity: 0
	
sheet = new Layer
	width: 1080
	height: 1920
	backgroundColor: "#fff"
	y: 1500

header = new Layer
	backgroundColor: "#F5F5F5"
	width: Screen.width
	height: 816
	clip: true
	parent: sheet
	shadowY: 4
	shadowBlur: 16
	shadowColor: "rgba(0,0,0,0.0)"

fab = new Layer
	width: 184
	height: 192
	image: "images/fab.png"
	y: 1542
	x: 846
	
ripple = new Layer
	size: 168 * 2.5
	scale: 1 / 2.5
	borderRadius: 500
	backgroundColor: "#F50057"
	parent: header
	x: 727
	shadowY: 8
	shadowBlur: 24
	shadowColor: "rgba(0,0,0,0.5)"
	y: -77
	opacity: 0
		
fields = new Layer
	width: 1080
	height: 816
	image: "images/fields.png"
	parent: header
	opacity: 0
	
meta = new Layer
	width: 1080
	height: 1104
	image: "images/meta.png"
	parent: sheet
	y: 816
	opacity: 0
	
keyboard = new Layer
	width: 1080
	height: 672
	image: "images/keyboard.png"
	y: 1920
	shadowBlur: 12
	shadowColor: "rgba(0,0,0,0.3)"
	 
# Animations	 
fab.onClick ->
	
	fade.animate
		opacity: 1
		options:
			time: 0.5
			
	fab.opacity = 0
	ripple.opacity = 1
	
	ripple.animate
		scale: 6
		backgroundColor: "#3E50B4"
		options:
			time: 0.4
			curve: "ease"
			
	fields.animate
		opacity: 1
		options: 
			delay: 0.3
			
	meta.animate
		opacity: 1
		options: 
			delay: 0.4
		
	sheet.animate
		y: 0
		x: 0
		options:
			curve: "spring(200, 30, 0)"
			delay: 0.1
		
	header.animate 
		backgroundColor: "#3E50B4"
		shadowColor: "rgba(0,0,0,0.4)"
		
	keyboard.animate
		x: 0
		y: 1104
		options:
			time: 0.6
			delay: 0.3

	# Return to default state
	header.onAnimationEnd ->
		header.onClick ->
			
			fab.opacity = 1
			fab.placeBehind(sheet)
			
			fade.animate
				opacity: 0
				options:
					time: 0.5
					
			sheet.animate
				y: 1776
				options:
					time: 0.5
					
			keyboard.animate
				y: 1920
				x: 0
				options:
					time: 0.5
					
			# Reset layer states
			sheet.once Events.AnimationEnd, ->
				sheet.y = 1500
				fab.placeBefore(sheet)
				
				fields.opacity = 0
				meta.opacity = 0
				
				ripple.opacity = 0
				ripple.scale = 1 / 2.5
				ripple.backgroundColor = "#F50057"
				
				header.backgroundColor = "#F5F5F5"
				header.shadowColor = "rgba(0,0,0,0)"

# System UI
navBar = new Layer
	width: 1080
	height: 144
	image: "images/navBar.png"
	y: 1776

statusBar = new Layer
	width: 1080
	height: 72
	image: "images/statusBar.png"
