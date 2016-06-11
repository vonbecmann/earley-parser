testing
isAmbiguous
	self
		depthVisitPreNode: [ :packed | packed familiesSize > 1 ifTrue: [ ^ true ] ]
		postNode: nil
		preFamily: nil
		postFamily: nil.
	^ false