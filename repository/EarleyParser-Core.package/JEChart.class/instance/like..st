accessing
like: anItem
	^ items detect: [ :each | each equals: anItem ] ifNone: [ nil ]