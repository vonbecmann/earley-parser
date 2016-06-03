accessing
at: key put: anObject
	| found |
	found := self privateAt: key.
	found add: anObject.
	^ anObject