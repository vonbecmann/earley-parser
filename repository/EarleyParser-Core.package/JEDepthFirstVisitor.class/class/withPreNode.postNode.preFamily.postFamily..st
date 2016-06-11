instance creation
withPreNode: preNodeBlock postNode: postNodeBlock preFamily: preFamilyBlock postFamily: postFamilyBlock
	^ self basicNew
		initializePreNode: preNodeBlock
		postNode: postNodeBlock
		preFamily: preFamilyBlock
		postFamily: postFamilyBlock