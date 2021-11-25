Extension { #name : #JEItem }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEItem >> displayValueOn: aStream [
	^ self subclassResponsibility
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEItem >> gtDisplayIntervalString [
	^ String streamContents: [ :s | self printIntervalOn: s ]
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEItem >> gtDisplayValueString [
	^ String streamContents: [ :s | self displayValueOn: s ]
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEItem >> gtInspectorBrowserIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite tree
		title: 'Browse';
		display: [ self ];
		children: [ :each | each children ];
		yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
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
