initialization
newCellAt: i at: j
	|cell origin|
	cell := GameCell new.
	origin := self innerBounds origin.
	self addMorph: cell.
	cell
		position: ((i - 1) * cell width) @ ((j - 1) * cell height ) + origin.
	^ cell
	"mouseAction: [self toggleNeighboursOfCellAt: i at: j]." 