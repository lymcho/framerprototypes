# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Ling Zhou"
	twitter: ""
	description: ""

# Background
Canvas.backgroundColor = "#fafafa"
#base	
pic = new Layer
	html: "<img src = 'images/favorite.png' height = 'auto' width = '1246px'>"
#overlay	
overlay = new Layer
	width: 1242
	height: 2252
	backgroundColor: "#434343"
	opacity: 0.0

#modal
modal = new Layer
	html: "<img src = 'images/modal.png' height = 'auto' width = '1126px'>"
	y:0
	x:60
	opacity: 0.0
	





#before click
overlay.states.a =
	opacity: 0.0
modal.states.a =
	opacity: 0.0
	y:0	
#after click	
overlay.states.b = 
	opacity: 0.7
modal.states.b = 
	opacity: 1.0
	y:300	

#when click date
pic.onClick (event, layer) ->
	overlay.animate "b" 
	
pic.onClick (event, layer) ->
	modal.animate "b" 
	
	
		

		


	

	
	