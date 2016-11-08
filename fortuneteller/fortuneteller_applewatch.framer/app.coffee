###
	SETUP
###

Framer.Defaults.Layer.backgroundColor = null

layerA = new Layer
	x: 20
	y: 20
	width: 240
	height: 240
	
layerB = layerA.copy()
layerB.height = 300
layerB.width=240
layerB.y = 160



###
	EXAMPLE CODE
###

Utils.insertCSS "
	.structuredHTML {
		color: #ffffff;
		font-family: Helvetica, Arial, sans-serif;
		font-size: 18px;
		line-height: 18px;
	}
	.structuredHTML p {
		font-style: oblique;
		font-weight: 300;
	}
	.structuredHTML h1 {
		padding-top:40px;
		font-size: 32px;
		font-weight: bold;
		text-align:center;
		color:rgba(237,17,83,1);
	}
	.structuredHTML h6 {
		font-size: 18px;
		font-weight: normal;
		margin: 0;
	}
"

layerA.html = "Swipe up to reveal your fortune"

layerA.style = 
	textAlign:"center"
	width:"240px"
	paddingTop:"80px"
	color: "#ffffff"
	fontSize: "24px"
	fontFamily: "Helvetica, Arial, sans-serif"
	lineHeight: "32px"  
	
layerB.html = 
	
	"<div class='structuredHTML'><h1>Get Ready</h1></div>"
	
	
#layerA will fade and go up


layerA.states.a =
	y:0
	opacity: 0.1

layerA.states.b =
	y:20
	opacity: 1.0

layerA.onSwipeUp (event, layer) ->
	layerA.animate "a"

layerA.onSwipeDown (event, layer) ->
	layerA.animate "b"	

	
	

	