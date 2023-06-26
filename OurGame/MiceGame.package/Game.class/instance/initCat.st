initialization
initCat
	|catPosition origin|
	catPosition := self cellsPerSide  atRandom @ self cellsPerSide atRandom .
	cat := CatCell new.
	origin := self innerBounds origin.
	self addMorph: cat.
	cat
		position: ((catPosition x - 1) * cat width) @ ((catPosition y - 1) * cat height ) + origin.
	cat setPosition:  catPosition.
	