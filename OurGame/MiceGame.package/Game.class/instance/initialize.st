initialization
initialize 
	| height overallBorderWidth sampleCell width|
	super initialize.
	sampleCell := GameCell new.
	width := sampleCell width.
	height := sampleCell height.
	overallBorderWidth := 2 * self borderWidth.

	stats := GameStats new.
	stats setNumberOfMice: self numberOfMice.
 	self position: 25 @ 25.
	self extent: (width * self cellsPerSide) @ (height * self cellsPerSide) + overallBorderWidth.
	cells := Matrix new: self cellsPerSide tabulate:[:i :j | self newCellAt: i at: j].	
	self generateSubways.
	finalSubway :=  subways size atRandom.
	self paintSubwaysExits.
	self initCat.
	self initMice.
	self startMice.
	
	
	ActiveHand newKeyboardFocus: self.
	
