as yet unclassified
createFromBoard: subways mouse: mouse
	|counter mappingToInd mappingToCoor mappingCoorToSubway|	
	counter := 2.
	mappingToInd := Dictionary new.
	mappingToCoor := Dictionary new.
	mappingCoorToSubway := Dictionary new.
 	1 to: subways size do: [:i |  (subways at: i) getExits do: 
		[:f | 
			mappingToInd at: f ifAbsentPut: counter.
			mappingToCoor at: counter ifAbsentPut: f.
			mappingCoorToSubway at: f ifAbsentPut: i.
		 	counter := counter + 1.
			]
		].
	
	counter := counter -1.
	adj := Array new: counter.
	1 to: adj size do: [:i| adj at: i put: OrderedCollection new.]. 
	
	mouse getInSubway ~= -1
	ifTrue: [(subways at: (mouse getInSubway)) getExits do: [:exit | (adj at: 1) add: ((mappingToInd at: exit) -> 0)].]
	ifFalse: [
		subways do: [
			:sub | sub getExits do: [
					:exit | (adj at: 1) add: ((mappingToInd at: exit) -> (exit dist: (mouse getPosition))).
				]
			]
		].
	subways do: [
			:sub | sub getExits do: [
					:exit1 |  sub getExits do: [:exit2 | 
							(adj at: (mappingToInd at: exit1)) add:  ((mappingToInd at: exit2) -> 0).
							(adj at: (mappingToInd at: exit2)) add:  ((mappingToInd at: exit1) -> 0)
						].
				]
		].
 	1 to: subways size do: 
		[:sub1 |  (subways at: sub1) getExits do: 
			[:exit1 |  1 to: subways size do: [ :sub2  |
				sub1 ~= sub2
					ifTrue: [
					(subways at: sub2) getExits do: [:exit2 | 
						(adj at: (mappingToInd at: exit1)) add:  ((mappingToInd at: exit2) -> (exit2 dist: exit1)).
						(adj at: (mappingToInd at: exit2)) add:  ((mappingToInd at: exit1) -> (exit2 dist: exit1))
					].		
				]
			]
		]].
	mappingCoorToIndex := mappingToInd.
	mappingIndexToCoor := mappingToCoor.
	mappingSubways := mappingCoorToSubway.
	^self
