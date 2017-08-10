accessing
size
	| tally |
	tally := 0.
	itemsByKey associationsDo: [ :assoc | tally := tally + assoc value size ].
	^ tally