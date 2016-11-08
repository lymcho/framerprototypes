# Import file "chat"
sketch = Framer.Importer.load("imported/chat@1x")

scroll = ScrollComponent.wrap(sketch.scroll)

scroll.scrollHorizontal = false

scroll.contentInset = {
	bottom: 32
}
