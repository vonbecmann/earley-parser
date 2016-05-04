tests
test09CollectCubes
	| result |
	
	list add: 1.
	list add: 2.
	list add: 3.
	list add: 4.
	
	result := list collect: [ :each | each raisedTo: 3 ].
	
	self assert: result asArray equals: #(1 8 27 64)