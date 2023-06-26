initialization
paintSubwaysExits
	"comment stating purpose of message"

	subways do: [:a | a getExits do: [:b | self paintExit: b color: Color black]].
	"remove this for final game, right now only for testing"
	(subways at: finalSubway) getExits do: [:f | self paintExit: f color: Color green]