public
accepts: aString
	| itemsets |
	itemsets := (0 to: aString size) collect: [ :index | Set new ].
	(itemsets at: 1) add: (JEItem rule: #(S (E)) dotAt: 1 itemsetAt: 1).
	^ true