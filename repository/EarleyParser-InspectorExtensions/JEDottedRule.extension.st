Extension { #name : #JEDottedRule }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEDottedRule >> gtInspectorPureIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		display: [ {
			('rule' -> self rule).
			('dotIndex' -> self dotIndex).
			('symbolAtDot' -> self symbolAtDot).
			('predicted' -> self isPredicted).
			('active' -> self isActive).
			('final' -> self isFinal).
			('next Dotted Rule') -> next } ];
		column: 'Name' evaluated: [ :each | each key ] width: 100;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself
]
