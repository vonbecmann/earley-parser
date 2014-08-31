public
accepts: words
	| charts firstRule |
	charts := (1 to: words size + 1) collect: [ :index | JEChart number: index ].
	firstRule := (JENonterminal for: #Start) body: {(grammar startSymbol)}.
	(charts at: 1) add: (JEItem rule: firstRule dotAtBeginningWithChartAt: (charts at: 1)).
	debugOn
		ifTrue: [ charts do: [ :chart | chart inspectWithLabel: chart asString ] ].
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
								((item chart select: [ :anItem | anItem symbolAtDot = item rule head ]) collect: [ :anItem | anItem moveDotForward ]) ]
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
										((grammar alternativesOf: item symbolAtDot) collect: [ :rule | JEItem rule: rule dotAtBeginningWithChartAt: chart ]) ] ] ] ].
	^ (charts at: words size + 1) includes: (JEItem rule: firstRule dotAtEndWithChartAt: (charts at: 1))