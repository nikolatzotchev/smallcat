initialization
initialize 
	| height overallBorderWidth sampleCell width|
	super initialize.
	sampleCell := GameCell new.
	width := sampleCell width.
	height := sampleCell height.
	overallBorderWidth := 2 * self borderWidth.
	finalSubway := self numberOfSubways atRandom.
	self position: 25 @ 25.
	self extent: (width * self cellsPerSide) @ (height * self cellsPerSide) + overallBorderWidth.
	cells := Matrix new: self cellsPerSide tabulate:[:i :j | self newCellAt: i at: j].	
	self initCat.
	self initMice.
	self generateSubways.
	self paintSubwaysExits.
	"self moveCatAt: catPosition."
	ActiveHand newKeyboardFocus: self.