initialization
startMice
	"Starts the mice movements in threads"
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
					graph := ExitsGraphAvoid new.
			      	graph createFromBoard: subways mouse: m cat: cat.
					dijkstra run: graph.
					path := dijkstra getPath: (dijkstra getShortestDist: (subways at: finalSubway)).
					"move one step on the path"
					step := path at: 1.
					m getInSubway ~= -1
						ifTrue: [
							"mouse is in subway and gets out of the subway"
							origin := self innerBounds origin.
							m position: ((step x - 1) * m width) @ ((step y - 1) * m height ) + origin. 
							m setPosition: step.
							m setInSubway: -1.
							m show.
							]
						ifFalse: [
							"mouse is not in subway"
							|xDest xMouse yDest yMouse mousePos|
							mousePos := m getPosition.
							xDest := step x.
							xMouse := m getPosition x.
							yDest := step y.
							yMouse := m getPosition y.
							step = mousePos
							ifTrue:[
								"mouse enters subway"
								|enterSubway|
								enterSubway := (dijkstra getGraph getMappingSubways at: step).
								m setInSubway: enterSubway.
								m hide.
								enterSubway = finalSubway 
								ifTrue:[
									"mouse enters final subway"
									stats mouseFinished.
									loopVar := false.
									]
								]
							ifFalse:[
								"mouse moves on the ground (not subway)"
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
									"if either x or y axis is already correct, then just move the other axis"
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
								].
							].
					"self checkAndKillMice."
					(0.5 + (2 * (randomR next) )) second asDelay wait.
				].			
			] fork
		]