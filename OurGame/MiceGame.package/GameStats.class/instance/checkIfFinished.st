as yet unclassified
checkIfFinished

	((kills + miceFinished) = numberOfMice "Nothing more expected ->")
	ifTrue: [
		Transcript show: 'Finished and terminating'.
		Transcript cr.
		Transcript show: 'Mice catched: ', kills printString, ' Mice finished: ', miceFinished printString.
		Transcript cr.
		"thisContext terminate."
		].
