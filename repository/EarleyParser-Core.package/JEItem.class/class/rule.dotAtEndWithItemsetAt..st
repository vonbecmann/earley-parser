instance creation
rule: aRule dotAtEndWithItemsetAt: index
	^ self rule: aRule dotAt: aRule body size + 1 itemsetAt: index