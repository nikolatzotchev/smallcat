initialization
startMice
	"comment stating purpose of message"
	|dijkstra|
	dijkstra := Dijkstra new.
	mice do: [:m | 
		"start -> calc graph + dijskstra -> move -> if not final repeat"
			[ 	
				|graph path loopVar|
				loopVar := true.
				[loopVar]
				whileTrue: [
					graph := ExitsGraph new.
			      	graph createFromBoard: subways mouse: m.
					dijkstra run: graph.
					path := dijkstra getPath: (dijkstra getShortestDist: (subways at: finalSubway)).
					"move one step on the path"
				
    					"Transcript show: (dijkstra getShortestDist: (subways at: finalSubway)); cr."
    					Transcript show: (path ); cr.
					loopVar:= false.
				].
			
			] fork
		]
