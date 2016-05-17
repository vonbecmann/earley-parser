*EarleyUI
view
	" returns a roassal view of myself"

	| b |
	b := RTMondrian new.
	b shape rectangle withTextOnTheLeft: [ :node | node model ].
	b nodes: self nodes.
	b shape circle
		withBorder;
		withTextAbove: [ :edge | edge label ].
	b nodes: self edges.
	b shape arrowedLine.
	b edges useAssociations: (self edges collect: [ :edge | edge targetNode -> edge ]).
	b shape arrowedLine.
	b edges
		useAssociations:
			(self edges
				flatCollect: [ :edge | OrderedCollection withAll: (edge sourceNodes collect: [ :node | edge -> node ]) ]).
	b treeLayout.
	b build.
	^ b view