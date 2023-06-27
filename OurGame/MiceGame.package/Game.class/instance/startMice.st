initialization
startMice
	"comment stating purpose of message"
	|dijkstra origin randomR|
	
	dijkstra := Dijkstra new.
	randomR := Random new.
	mice do: [:m | 		
		"start -> calc graph + dijskstra -> move -> if not final repeat"
			[ 	
				|graph path loopVar|
				loopVar := true.
				[loopVar and: m getAlive]
				whileTrue: [
					|step|
					graph := ExitsGraph new.
			      	graph createFromBoard: subways mouse: m.
					dijkstra run: graph.
					path := dijkstra getPath: (dijkstra getShortestDist: (subways at: finalSubway)).
					"move one step on the path"
					step := path at: 1.
					m getInSubway ~= -1
						ifTrue: [
							origin := self innerBounds origin.
							m position: ((step x - 1) * m width) @ ((step y - 1) * m height ) + origin. 
							m setPosition: step.
							m setInSubway: -1.
							m show.
							]
						ifFalse: [
							|xDest xMouse yDest yMouse mousePos|
							mousePos := m getPosition.
							xDest := step x.
							xMouse := m getPosition x.
							yDest := step y.
							yMouse := m getPosition y.
							step = mousePos
							ifTrue:[
								|enterSubway|
								enterSubway := (dijkstra getGraph getMappingSubways at: step).
								m setInSubway: enterSubway.
								m hide.
								enterSubway = finalSubway 
								ifTrue:[
									stats mouseFinished.
									loopVar := false.
									]
								]
							ifFalse:[
								xDest ~= xMouse
								ifTrue: [
									xDest > xMouse
									ifTrue: [
										m moveRight.
										]
									ifFalse:[
										m moveLeft.
										].
									]
								ifFalse:[
									yDest > yMouse
									ifTrue: [
										m moveDown.
										]
									ifFalse:[
										m moveUp.
										].  	
									].
								]
							].
					(0.5 + (2 * (randomR next) )) second asDelay wait.
				].
			
			] fork
		]