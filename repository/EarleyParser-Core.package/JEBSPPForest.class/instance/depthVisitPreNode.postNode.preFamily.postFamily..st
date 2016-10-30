public
depthVisitPreNode: preNodeBlock postNode: postNodeBlock preFamily: preFamilyBlock postFamily: postFamilyBlock
	(JEDepthFirstVisitor
		withPreOrderNode: preNodeBlock
		postOrderNode: postNodeBlock
		preOrderFamily: preFamilyBlock
		postOrderFamily: postFamilyBlock) visit: root