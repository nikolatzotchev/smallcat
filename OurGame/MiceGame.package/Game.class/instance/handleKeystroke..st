game logic
handleKeystroke: anEvent
	|keyValue catPosition|
	keyValue := anEvent keyValue.
	catPosition := cat getPosition.
	

	 "Nothing more expected ->"(keyValue = 30 and: catPosition y > 1)
		ifTrue: [
			cat position: cat position - (0 @  cat height ).
			cat setPosition: catPosition - (0@1).
			].
	(keyValue = 31 and: catPosition y < self cellsPerSide)
		ifTrue: [
			cat position: cat position + (0 @  cat height ).
			cat setPosition: catPosition + (0@1).
			].
	(keyValue = 29 and: catPosition x < self cellsPerSide)
		ifTrue: [
			cat position: cat position + (cat width @ 0).
			cat setPosition: catPosition + (1@0).
			].
	(keyValue = 28 and: catPosition x > 1)
		ifTrue: [
			cat position: cat position - (cat width @ 0).
			cat setPosition: catPosition - (1@0).
			].
		
	"Transcript show: 'Position Cat: ', catPosition x printString, ' ', catPosition y printString."
	"Transcript cr."
	mice do: [:m|
		(m getAlive and: catPosition x = m getPosition x and: catPosition y = m getPosition y )
		ifTrue:[
			stats addKill.
			m kill.
			m hide.
			].
		].

	
