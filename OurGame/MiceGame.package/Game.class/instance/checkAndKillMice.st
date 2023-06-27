game logic
checkAndKillMice
	"check if there are mice on the cat position, if so kill them"
	|catPosition|
	[
	 [(mice select: [:m | m getAlive]) size  > 0 ] whileTrue: [
		catPosition := cat getPosition.
		mice do: [:m|
			(m getAlive and: catPosition x = m getPosition x and: catPosition y = m getPosition y )
			ifTrue:[
				"hide and kill the mouse + add a kill to the statistics" 
				m hide.
				m kill.
				stats addKill.
				].
			].
		0.05 second asDelay wait.
		].
	] fork 

