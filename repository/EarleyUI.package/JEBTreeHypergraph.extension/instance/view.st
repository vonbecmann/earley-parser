*EarleyUI
view
	" returns a roassal view of myself"

	| b assoc |
	b := RTMondrian new.
	b shape label.
	b
		nodes:
			(OrderedCollection new
				addAll: self nodes;
				addAll: self edges;
				yourself).
	assoc := OrderedCollection new.
	assoc
		addAll:
			(self edges
				flatCollect: [ :edge | 
					(OrderedCollection with: (edge -> edge targetNode))
						addAll: (edge sourceNodes collect: [ :node | node -> edge ]);
						yourself ]).
	b edges useAssociations: assoc.
	b treeLayout.
	b build.
	^ b view