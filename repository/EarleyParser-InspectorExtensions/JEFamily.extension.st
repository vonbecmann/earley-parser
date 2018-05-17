Extension { #name : #JEFamily }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEFamily >> gtInspectorChildrenIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Children' ];
		display: [ self children ];
		column: 'Child' evaluated: [ :each | each ];
		showOnly: 50;
		yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEFamily >> gtInspectorPureIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Pure' ];
		display: [ {('parent' -> parent)} ];
		column: 'Name' evaluated: [ :each | each key ] width: 75;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself
]
