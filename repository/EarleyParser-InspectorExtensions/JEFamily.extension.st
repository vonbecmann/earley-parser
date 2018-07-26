Extension { #name : #JEFamily }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEFamily >> gtInspectorMembersIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Members' ];
		display: [ self members ];
		column: 'Member' evaluated: [ :each | each ];
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
