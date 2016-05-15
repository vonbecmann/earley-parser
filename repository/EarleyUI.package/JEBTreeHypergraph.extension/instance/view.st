*EarleyUI
view
	| b assoc |
	b := RTMondrianViewBuilder new.
	b shape label.
	b
		nodes:
			(OrderedCollection new
				addAll: self nodes;
				addAll: self edges;
				yourself).
	assoc := OrderedCollection new.
	self edges
		do: [ :each | 
			assoc add: each -> each targetNode.
			each sourceNodes do: [ :node | assoc add: node -> each ] ].
	b edgesFromAssociations: assoc.
	b treeLayout.
	b build.
	^ b view