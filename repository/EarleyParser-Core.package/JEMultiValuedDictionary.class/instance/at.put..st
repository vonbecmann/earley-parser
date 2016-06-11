accessing
at: key put: anObject
	self privateAt: key put: anObject.
	^ anObject