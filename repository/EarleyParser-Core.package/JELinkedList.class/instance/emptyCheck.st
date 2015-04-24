private
emptyCheck
	self isEmpty
		ifTrue: [ Error signal: 'collection is empty!' ]