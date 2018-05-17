Extension { #name : #JEPackedNode }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEPackedNode >> gtInspectorFamiliesIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Families' ];
		display: [ families ];
		column: 'Family' evaluated: [ :each | each ];
		showOnly: 50;
		yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEPackedNode >> gtInspectorPureIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Pure' ];
		display: [ {('model' -> self model)} ];
		column: 'Name' evaluated: [ :each | each key ] width: 75;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself
]
