as yet unclassified
getShortestDist: subway
	|destinationSub minDist choosenSubway|
	minDist := SmallInteger maxVal.
	"comment stating purpose of message"
	destinationSub := subway getExits collect: [:i | (graph getMappingCoorToIndex) at: i].
	destinationSub do: [:i | (dist at: i) < minDist ifTrue: [minDist := dist at: i. choosenSubway := i].].
	^choosenSubway
"x inject: 0 into: [:a :c | (a > c)                
   ifTrue: [a]
   ifFalse: [c]]" "Argument expected ->"