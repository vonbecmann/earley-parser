public
depthVisitPreNode: preNodeBlock postNode: postNodeBlock preFamily: preFamilyBlock postFamily: postFamilyBlock
	(JEDepthFirstVisitor
		withPreOrderNodeAction: preNodeBlock
		postOrderNodeAction: postNodeBlock
		preOrderFamilyAction: preFamilyBlock
		postOrderFamilyAction: postFamilyBlock) visit: root