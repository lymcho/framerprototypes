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





profile = new Layer
	y: 168
	width: 750
	height: 160*8
	backgroundColor: "#f3f3f3"




profileitem = new Layer
	y: 168
	width: 750
	height: 180
	backgroundColor: "#ededed"

avartar = new Layer
	x: 20
	y: 176
	width:160
	height: 160
	borderRadius: 100
	backgroundColor: "#ffffff"


saved = new TextLayer
    text: "SAVE"
    color: "#rgba(237,17,83,1)"
    textAlign: "right"
    x: 560-48
    y: 232
    fontSize: 32
    fontWeight:900
    fontFamily: "helvetica neue"
    letterSpacing: 1.5
    opacity:1	









send = new Layer
	width: 750
	height: 160
	backgroundColor: "rgba(244,47,102,1)"
	opacity: 1.00
	y: 1175
	
newemail = new TextLayer
    text: "SEND NEW EMAIL"
    color: "#ffffff"
    textAlign: "center"
    width:800
    paddingTop:1232
    fontSize: 40
    fontWeight:900
    fontFamily: "helvetica neue"
    letterSpacing: 1

send.states.b =
	backgroundColor: "rgba(244,47,102,1)"
	opacity: 1.00
	y: 168
	height: 1175
	
send.states.a =
	opacity: 1.00
	backgroundColor: "rgba(244,47,102,1)"
	height:160
	y: 1175



send.onSwipeUp (event, layer) ->
	send.animate "b"	
	
send.onSwipeDown (event, layer) ->
	send.animate "a"






	
	



	




	
