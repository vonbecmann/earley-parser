accessing
like: anObject
	^ items detect: [ :each | each = anObject ] ifNone: [ nil ]