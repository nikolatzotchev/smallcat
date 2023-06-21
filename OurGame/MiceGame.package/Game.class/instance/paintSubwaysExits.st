initialization
paintSubwaysExits
	"comment stating purpose of message"

	subways do: [:a | a getExits do: [:b | self paintExit: b]]