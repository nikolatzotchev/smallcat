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
								(xDest ~= xMouse and: yDest > yMouse)
								ifTrue: [
									|random|
									"move randomly in x or y axis"
									random := (0 to: 1) atRandom
									random = 1
									ifTrue: [
										"move x axis"
										xDest > xMouse
										ifTrue: [
											m moveRight.
											]
										ifFalse:[
											m moveLeft.
											].
										]
									ifFalse: [
										"move y axis"
										yDest > yMouse
										ifTrue: [
											m moveDown.
											]
										ifFalse:[
											m moveUp.
											].  	
										].
									]
								ifFalse: [
									"if  either x or y axis is already correct, then just move the other axis"
									 xDest ~= xMouse
									ifTrue: [
										"Move x axis"
										xDest > xMouse
										ifTrue: [
											m moveRight.
											]
										ifFalse:[
											m moveLeft.
											].
										]
									ifFalse:[
										"Move y axis"
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
							].
					(0.5 + (2 * (randomR next) )) second asDelay wait.
				].
			
			] fork
		]