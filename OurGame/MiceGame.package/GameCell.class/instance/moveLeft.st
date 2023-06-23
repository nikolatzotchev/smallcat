util
moveLeft
	"comment stating purpose of message"
	self setPosition: self getPosition - (1@0).
	self position: self position - (self width @ 0).