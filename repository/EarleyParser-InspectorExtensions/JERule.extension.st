Extension { #name : #JERule }

{ #category : #'*EarleyParser-InspectorExtensions' }
JERule >> gtInspectorDottedRulesIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Dotted Rules' ];
		display: [ dottedRules ];
		column: 'Dot Index' evaluated: [ :each | each dotIndex ] width: 75;
		column: 'Dotted Rule' evaluated: [ :each | each ];
		showOnly: 50;
		yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JERule >> gtInspectorPureIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		display: [ {('head' -> self head)}
				, (self body withIndexCollect: [ :each :index | ('body at: ' , index asString) -> each ]) ];
		column: 'Name' evaluated: [ :each | each key ] width: 100;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself
]
