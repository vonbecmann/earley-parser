gt-inspector-extension
gtInspectorEdgesIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: edges size asString , ' hyperedges';
		display: edges;
		column: 'Target Node' evaluated: [ :each | each targetNode ];
		column: 'Label' evaluated: [ :each | each label ];
		column: 'Source Nodes' 
			evaluated: [ :each | String streamContents: [ :s | each gtDisplaySourceNodesOn: s ] ];
		showOnly: 50;
		yourself