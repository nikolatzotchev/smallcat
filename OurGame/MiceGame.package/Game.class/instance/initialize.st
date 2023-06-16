initialization
initialize 
	| height overallBorderWidth sampleCell width|
	super initialize.
	sampleCell := GameCell new.
	width := sampleCell width.
	height := sampleCell height.
	overallBorderWidth := 2 * self borderWidth.
	self position: 25 @ 25.
	self extent: (width * self cellsPerSide) @ (height * self cellsPerSide) + overallBorderWidth.
	cells := Matrix new: self cellsPerSide tabulate:[:i :j | self newCellAt: i at: j].
	catPosition := self cellsPerSide  atRandom @ self cellsPerSide atRandom .
	self toggleAt: catPosition.
	ActiveHand newKeyboardFocus: self.