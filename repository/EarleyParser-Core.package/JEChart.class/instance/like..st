accessing
like: anObject
	^ items detect: [ :each | each like: anObject ] ifNone: [ nil ]