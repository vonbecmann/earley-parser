testing
isAmbiguous
	JEDepthFirstVisitor new
		preOrderNodeBlock: [ :packed | 
			packed children size > 1
				ifTrue: [ ^ true ] ];
		visit: self.
	^ false