initialization
generateSubways
	"generates the subways with random 2 to 3 exits"
	subways := (1 to: self numberOfSubways) collect: [ :i |
	    | exits subway |
	    exits := self exitsPerSubway  collect: [:j |
		|point|
		point := self randomPos.
		point 
		].
	    subway := Subway new.
	    subway createWithExits: exits.
	    subway
	].
	