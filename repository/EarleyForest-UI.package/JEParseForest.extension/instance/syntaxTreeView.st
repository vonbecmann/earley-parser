*EarleyForest-UI
syntaxTreeView
	" returns a roassal view of a syntax tree"

	| b |
	b := RTMondrian new.
	b shape rectangle withTextOnTheLeft: [ :node | node model ].
	b nodes: syntaxTree nodes.
	b shape circle
		withBorder;
		withTextAbove: [ :edge | edge ].
	b nodes: syntaxTree edges.
	b shape arrowedLine.
	b edges useAssociations: (syntaxTree edges collect: [ :edge | edge targetNode -> edge ]).
	b shape arrowedLine.
	b edges
		useAssociations:
			(syntaxTree edges
				flatCollect:
					[ :edge | OrderedCollection withAll: (edge sourceNodes collect: [ :node | edge -> node ]) ]).
	b layout tree.
	b build.
	^ b view