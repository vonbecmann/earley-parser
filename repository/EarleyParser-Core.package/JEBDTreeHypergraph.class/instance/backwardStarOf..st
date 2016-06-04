private
backwardStarOf: aNode
	^ backwardStar at: aNode ifAbsent: [ Array empty ]