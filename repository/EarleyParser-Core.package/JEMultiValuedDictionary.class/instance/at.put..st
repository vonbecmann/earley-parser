accessing
at: key put: anObject
	^ (self privateAt: key) add: anObject