as yet unclassified
distModifier: exit cat: cat
	"comment stating purpose of message"

	| modif |
	modif := exit dist: (cat position).
	modif < 500
	ifTrue: [
		modif := 1 + (1/modif).
		Transcript show: modif; cr.
		]
	ifFalse: [
		modif := 1.].
	^modif