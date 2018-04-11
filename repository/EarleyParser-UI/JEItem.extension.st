Extension { #name : #JEItem }

{ #category : #'*EarleyParser-UI' }
JEItem >> displayValueOn: aStream [
	^ self subclassResponsibility
]

{ #category : #'*EarleyParser-UI' }
JEItem >> gtDisplayIntervalString [
	^ String streamContents: [ :s | self printIntervalOn: s ]
]

{ #category : #'*EarleyParser-UI' }
JEItem >> gtDisplayValueString [
	^ String streamContents: [ :s | self displayValueOn: s ]
]

{ #category : #'*EarleyParser-UI' }
JEItem >> gtInspectorPureIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		column: 'Name'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ]
			width: 100;
		column: 'Value'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		send: [ :each | each value ];
		yourself
]
