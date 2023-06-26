as yet unclassified
mouseFinished
	miceFinished := miceFinished + 1.
	Transcript show: 'Mouse finished. Current finishes ', miceFinished printString.
	Transcript cr.
	self checkIfFinished.