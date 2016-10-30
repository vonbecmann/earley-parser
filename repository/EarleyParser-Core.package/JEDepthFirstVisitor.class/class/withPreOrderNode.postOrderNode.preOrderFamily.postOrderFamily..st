instance creation
withPreOrderNode: preOrderNodeBlock postOrderNode: postOrderNodeBlock preOrderFamily: preOrderFamilyBlock postOrderFamily: postOrderFamilyBlock
	^ self basicNew
		initializePreOrderNode: preOrderNodeBlock
		postOrderNode: postOrderNodeBlock
		preOrderFamily: preOrderFamilyBlock
		postOrderFamily: postOrderFamilyBlock