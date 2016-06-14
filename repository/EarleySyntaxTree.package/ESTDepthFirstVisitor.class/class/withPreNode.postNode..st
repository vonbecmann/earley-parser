instance creation
withPreNode: preNodeBlock postNode: postNodeBlock
	^ self basicNew initializePreNode: preNodeBlock postNode: postNodeBlock