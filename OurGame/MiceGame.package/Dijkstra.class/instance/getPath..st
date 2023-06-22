as yet unclassified
getPath: dest
	|path cur|
	path := OrderedCollection new.
	path add: (graph getMappingIndexToCoor at: dest).
	cur := parent at: dest.
	[(parent at: cur) ~= -1]
		whileTrue: [path add: (graph getMappingIndexToCoor at: cur). cur := parent at: cur].
	^path reversed