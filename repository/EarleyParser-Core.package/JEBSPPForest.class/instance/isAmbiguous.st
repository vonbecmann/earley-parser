testing
isAmbiguous
	self
		depthVisitPreNode: [ :packed | packed children size > 1 ifTrue: [ ^ true ] ]
		postNode: nil
		preFamily: nil
		postFamily: nil.
	^ false