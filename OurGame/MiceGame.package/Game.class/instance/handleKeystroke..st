as yet unclassified
handleKeystroke: anEvent
	|keyValue catx caty|
	catx := catPosition x.
	caty := catPosition y.
	keyValue := anEvent keyValue.
	"Transcript show: keyValue."
	(keyValue = 30 and: caty > 1)
		ifTrue: [self catPosition: catPosition - (0 @ 1).].
	(keyValue = 31 and: caty < self cellsPerSide)
		ifTrue: [self catPosition: catPosition + (0 @ 1)].
	(keyValue = 29 and: catx < self cellsPerSide)
		ifTrue: [self catPosition: catPosition +  (1 @ 0)].
	(keyValue = 28 and: catx > 1)
		ifTrue: [self catPosition: catPosition -  (1 @ 0)].
	self toggleAt: catPosition.
	self toggleAt: catx@caty.
