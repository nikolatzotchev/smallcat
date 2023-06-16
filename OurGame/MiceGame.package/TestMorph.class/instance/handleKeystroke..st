as yet unclassified
handleKeystroke: anEvent
	|keyValue|
	
	keyValue := anEvent keyValue.
	keyValue = 30
		ifTrue:  [self position: self position - (0 @ 10)].
	keyValue = 31
		ifTrue:  [self position: self position + (0 @ 10)].
	keyValue = 29
		ifTrue:  [self position: self position + (10 @ 0)].
	keyValue = 28
		ifTrue:  [self position: self position - (10 @ 0)].