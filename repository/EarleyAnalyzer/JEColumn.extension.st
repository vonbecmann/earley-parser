Extension { #name : 'JEColumn' }

{ #category : '*EarleyAnalyzer' }
JEColumn >> itemStartColumnNumbers [
	^ (items collect: [ :each | each start number ]) asArray
]
