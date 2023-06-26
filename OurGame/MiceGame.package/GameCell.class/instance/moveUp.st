util
moveUp
	"comment stating purpose of message"
	self setPosition: self getPosition - (0@1).
	self position: self position - (0 @ self height).