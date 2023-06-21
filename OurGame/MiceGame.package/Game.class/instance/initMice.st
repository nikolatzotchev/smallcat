initialization
initMice
	mice := (1 to: self numberOfMice) collect: [:i | 
		|mouse initSubway|
		initSubway := self numberOfSubways atRandom.
		mouse := MouseCell new.
		[initSubway = finalSubway]
		whileTrue: [
			initSubway := self numberOfSubways atRandom.
			].
		mouse setInSubway: initSubway.
		mouse 
		].