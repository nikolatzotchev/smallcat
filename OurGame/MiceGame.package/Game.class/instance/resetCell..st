game logic
resetCell: pos
	"comment stating purpose of message"
	(cells at: pos x at: pos y)  color: self defaultCellColor.