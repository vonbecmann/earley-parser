testing
isAmbiguous
	JEDepthFirstVisitor new
		preOrderNodeBlock: [ :packed | 
			packed familiesSize > 1
				ifTrue: [ ^ true ] ];
		visit: self.
	^ false