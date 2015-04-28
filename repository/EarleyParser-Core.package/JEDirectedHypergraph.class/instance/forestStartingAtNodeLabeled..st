public
forestStartingAtNodeLabeled: anObject
	| root |
	root := nodes detect: [ :each | each label = anObject ].
	^ self forestStartingAt: root