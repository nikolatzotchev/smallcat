as yet unclassified
addKill
	"comment stating purpose of message"
	kills := kills + 1.
	Transcript show: 'Mouse killed. Current kills ', kills printString.
	Transcript cr.
	self checkIfFinished.
	