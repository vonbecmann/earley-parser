public
depthVisitPreNode: preNodeBlock postNode: postNodeBlock preFamily: preFamilyBlock postFamily: postFamilyBlock
	JEDepthFirstVisitor new
		preOrderNodeBlock: preNodeBlock;
		postOrderNodeBlock: postNodeBlock;
		preOrderFamilyBlock: preFamilyBlock;
		postOrderFamilyBlock: postFamilyBlock;
		visit: root