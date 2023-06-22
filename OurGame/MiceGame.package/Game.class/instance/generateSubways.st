initialization
generateSubways
	"comment stating purpose of message"
	subways := (1 to: self numberOfSubways) collect: [ :i |
	    | exits subway |
	    "exits := (1 to: (2 to: 5) atRandom) collect: [:j |"
	    exits := (1 to: 2) collect: [:j |
		|point|
		point := self randomPos.
		point 
		].
	    subway := Subway new.
	    subway createWithExits: exits.
	    subway
	].
	