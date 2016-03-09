gt-inspector-extension
gtDisplayOn: s
	self printOn: s.
	s
		space;
		nextPut: $[;
		nextPutAll: dictionary size asString;
		nextPutAll:
				(dictionary size = 1
						ifTrue: [ ' item' ]
						ifFalse: [ ' items' ]);
		nextPut: $];
		space;
		nextPutAll: ((String streamContents: [ :stream | dictionary printElementsOn: stream ]) truncateWithElipsisTo: 42)