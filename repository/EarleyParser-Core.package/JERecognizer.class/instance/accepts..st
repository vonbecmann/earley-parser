public
accepts: words
	| charts firstRule |
	charts := (1 to: words size + 1) collect: [ :index | JEChart number: index ].
	firstRule := (JENonterminal for: #Start) body: {(grammar startSymbol)}.
	charts first add: (JEItem rule: firstRule dotAtBeginningWithChart: charts first).
	debugOn
		ifTrue: [ charts inspectWithLabel: 'All charts' ].
	1 to: words size + 1 do: [ :i | 
		| chart |
		chart := charts at: i.
		chart
			do: [ :item | 
				item isFinal
					ifTrue: [ 
						"complete"
						chart
							addAll:
								((item chart select: [ :anItem | anItem isFinal not and: [anItem symbolAtDot = item rule head] ]) collect: [ :anItem | anItem moveDotForward ]) ]
					ifFalse: [ 
						item symbolAtDot isTerminal
							ifTrue: [ 
								(i <= words size and: [ item symbolAtDot equals: (words at: i) ])
									ifTrue: [ 
										"scan"
										(charts at: i + 1) add: item moveDotForward ] ]
							ifFalse: [ 
								"predict"
								chart
									addAll:
										((grammar alternativesOf: item symbolAtDot) collect: [ :rule | JEItem rule: rule dotAtBeginningWithChart: chart ]) ] ] ] ].
	^ charts last includes: (JEItem rule: firstRule dotAtEndWithChart: charts first)