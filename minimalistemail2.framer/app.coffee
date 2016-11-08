# Import file "minimalistic email" (sizes and positions are scaled 1:2)
sketch = Framer.Importer.load("imported/minimalistic email@2x")


scroll = ScrollComponent.wrap sketch.group
scroll.scrollHorizontal = false
scroll.contentInset = 
	bottom:48