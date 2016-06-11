initialization
initializePreNode: aPreNodeBlock postNode: aPostNodeBlock preFamily: aPreFamilyBlock postFamily: aPostFamilyBlock
	self initialize.
	preNodeBlock := aPreNodeBlock.
	postNodeBlock := aPostNodeBlock.
	preFamilyBlock := aPreFamilyBlock.
	postFamilyBlock := aPostFamilyBlock