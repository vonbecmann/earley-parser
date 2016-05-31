*EarleyUI
gtInspectorPureIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		display: [ {
			('key' -> self key).
			('rule' -> self rule).
			('dotIndex' -> self dotIndex).
			('symbolAtDot' -> self symbolAtDot).
			('predicted' -> self isPredicted).
			('final' -> self isFinal).
			('next Dotted Rule') -> self next } ];
		column: 'Name' evaluated: [ :each | each key ] width: 100;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself