all: layered-layered.png layered-no-layers.png txs.png

%.png: %.ditaa
	plantuml $<

%.png: %.uml
	plantuml $<
