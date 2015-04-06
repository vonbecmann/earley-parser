adding
addAll: aCollection
	^ aCollection collect: [ :each | self add: each ]