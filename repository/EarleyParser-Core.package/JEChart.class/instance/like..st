accessing
like: anObject
	^ items detect: [ :each | each equals: anObject ] ifNone: [ nil ]