private
hypergraph: words
	| charts |
	charts := self basicAccepts: words.
	charts do: [ :each | each removeAll ].
	^ builder build