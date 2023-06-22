initialization
initMice
	mice := (1 to: self numberOfMice) collect: [:i | 
		|mouse initSubway|
		initSubway := subways size atRandom.
		mouse := MouseCell new.
		self addMorph: mouse.
		mouse hide.
		mouse setPosition: -1@ -1.
		[initSubway = finalSubway]
		whileTrue: [
			initSubway := subways size atRandom.
			].
		mouse setInSubway: initSubway.
		mouse 
		].