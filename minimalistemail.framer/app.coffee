# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Ling Zhou"
	twitter: ""
	description: ""

{TextLayer} = require 'TextLayer'

navigation = new Layer
	backgroundColor: "rgba(255,255,255,1)"
	width: 750
	height: 168
	
recent = new TextLayer
    text: "ALL"
    color: "#4a4a4a"
    textAlign: "left"
    paddingRight: 20
    paddingLeft: 268
    paddingTop:56
    fontSize: 40
    fontWeight:900
    fontFamily: "helvetica neue"
    letterSpacing: 1
    
recent.states.a =
	opacity: 1.00
	x:0
	
recent.states.b =
	opacity: 0.20
	x:-30
	
starred = new TextLayer
    text: "SAVED"
    color: "#4a4a4a"
    textAlign: "center"
    paddingRight: 20
    paddingLeft: 400
    paddingTop:56
    fontSize: 40
    fontWeight:900
    fontFamily: "helvetica neue"
    letterSpacing: 1
    opacity:0.20
    
    
starred.states.a =
	opacity: 0.2
	x:0
	
starred.states.b =
	opacity: 1.00
	x:-30
	
	 
navigation.onSwipeLeft (event, layer) ->
	starred.animate "b"	
	recent.animate "b"
	dot.animate "b"
navigation.onSwipeRight (event, layer) ->
	starred.animate "a"	
	recent.animate "a"
	dot.animate "a" 
	
profile = new Layer
	y: 167
	width: 750
	height: 160*8
	backgroundColor: "#f3f3f3"
	
dot = new Layer
	borderRadius: 100
	x: 296
	y: 120
	width: 16
	height: 16
	backgroundColor: "rgba(237,17,83,1)"
dot.states.b =
	x:424
dot.states.a =
	x:296











layerA = new Layer
	width: 750
	height: 159
	backgroundColor: "rgba(244,47,102,1)"
	opacity: 1.00
	y: 1175

layerA.states.a =
	backgroundColor: "rgba(244,47,102,1)"
	opacity: 0.20
	y: 500
	borderRadius: 0
	height: 834
	

layerA.states.c =
	width: 750
	height: 159
	backgroundColor: "rgba(244,47,102,1)"
	opacity: 1.00
	y: 1175


layerA.onSwipeUp (event, layer) ->
	layerA.animate "a"	
	
layerA.onSwipeDown (event, layer) ->
	layerA.animate "c"
	



	




	
