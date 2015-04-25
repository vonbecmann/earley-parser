printing
printDescriptionLabelOn: aStream
	aStream
		nextPutAll:
				(self isReduction
						ifTrue: [ 'reduction' ]
						ifFalse: [ 'predecessor' ]);
		space.
	label printOn: aStream