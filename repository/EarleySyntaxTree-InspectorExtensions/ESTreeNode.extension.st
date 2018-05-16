Extension { #name : #ESTreeNode }

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESTreeNode >> gtInspectorChildrenIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite list
		title: [ 'Children' ];
		display: [ children ];
		send: [ :each | each ];
		yourself
]

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESTreeNode >> gtInspectorPureIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		display: [ {('model' -> self model)} ];
		column: 'Name' evaluated: [ :each | each key ] width: 75;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself
]
