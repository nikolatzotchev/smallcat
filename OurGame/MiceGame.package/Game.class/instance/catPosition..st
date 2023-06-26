game logic
catPosition: pos
	catPosition := pos.
	(cells at: pos x at: pos y) color: Color red .
	