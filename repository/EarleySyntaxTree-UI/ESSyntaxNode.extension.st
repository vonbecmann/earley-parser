Extension { #name : #ESSyntaxNode }

{ #category : #'*EarleySyntaxTree-UI' }
ESSyntaxNode >> gtInspectorPureIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		display: 
			[ {('symbol' -> symbol).
				('reason' -> reason).
				('start index' -> start).
				('end index' -> end)} ];
		column: 'Name'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ]
			width: 100;
		column: 'Value'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		send: [ :each | each value ];
		yourself
]
