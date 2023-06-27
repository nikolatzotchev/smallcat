as yet unclassified
createFromBoard: subways mouse: mouse cat: cat
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
	"if mouse is in subways only create the distances to the exits in this subway"
	mouse getInSubway ~= -1
	ifTrue: [(subways at: (mouse getInSubway)) getExits do: [:exit | (adj at: 1) add: ((mappingToInd at: exit) -> 0)].]
	"add the distances to every exit of every subway"
	ifFalse: [
		subways do: [
			:sub | sub getExits do: [
					:exit | (adj at: 1) add: ((mappingToInd at: exit) -> ((self distModifier: exit cat: cat) * (exit dist: (mouse position)))).
				]
			]
		].
	
	"exits in every subway have dista 0 to each other"
	subways do: [
			:sub | sub getExits do: [
					:exit1 |  sub getExits do: [:exit2 | 
							(adj at: (mappingToInd at: exit1)) add:  ((mappingToInd at: exit2) -> 0).
							(adj at: (mappingToInd at: exit2)) add:  ((mappingToInd at: exit1) -> 0)
						].
				]
		].
	"dist between every other two exits of different subs"
 	1 to: subways size do: 
		[:sub1 |  (subways at: sub1) getExits do: 
			[:exit1 |  1 to: subways size do: [ :sub2  |
				sub1 ~= sub2
					ifTrue: [
					(subways at: sub2) getExits do: [:exit2 | 
						|dist|
						dist := (self distModifier: exit1 cat: cat) * (exit2 dist: exit1).
						(adj at: (mappingToInd at: exit1)) add:  ((mappingToInd at: exit2) ->  dist).
						(adj at: (mappingToInd at: exit2)) add:  ((mappingToInd at: exit1) ->  dist)
					].		
				]
			]
		]].
	mappingCoorToIndex := mappingToInd.
	mappingIndexToCoor := mappingToCoor.
	mappingSubways := mappingCoorToSubway.
	^self
