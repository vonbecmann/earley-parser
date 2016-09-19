public
depthVisitPreNode: preNodeBlock postNode: postNodeBlock preFamily: preFamilyBlock postFamily: postFamilyBlock
	(JEDepthFirstVisitor
		withPreNode: preNodeBlock
		postNode: postNodeBlock
		preFamily: preFamilyBlock
		postFamily: postFamilyBlock) visit: root