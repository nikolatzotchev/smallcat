as yet unclassified
run: exitGraph
	|n visited|
	graph := exitGraph.
	n := exitGraph getAdj size.
	dist := Array new: n.
	dist atAllPut: (SmallInteger  maxVal).
	parent := Array new: n.
	parent atAllPut: -1.
	visited := Array new: n.
	visited atAllPut: false.
	
	dist at:1 put: 0.
	1 to: n do: [:i |
		|v|
		v := -1.
		1 to: n do: [:j |
			|distV distJ|
			(visited at: j) not 
				 ifTrue: [
					v = -1
						ifTrue: [
							v := j.
						]
						ifFalse: [
							distV := (dist at: v).
							distJ := (dist at: j).
							distV > distJ
								ifTrue: [v := j]
							]
					
				].
			].
		(dist at: v) = SmallInteger  maxVal
			ifTrue: [^'fff'].
		visited at: v put: true.
		(exitGraph getAdj at: v) do: [:edge |
			|to len|
			to := edge key.
			len := edge value.
			(dist at: v) + len < (dist at: to)
				ifTrue: [
					dist at: to put: ((dist at: v) + len).
					parent at: to put: v.
					] 
			 ]
	]