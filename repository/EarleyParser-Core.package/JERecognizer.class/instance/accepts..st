public
accepts: words
	| charts firstRule |
	charts := (0 to: words size) collect: [ :index | JEChart new ].
	firstRule := (JENonterminal for: #Start) body: {(grammar startSymbol)}.
	(charts at: 1) add: (JEItem rule: firstRule dotAtBeginningWithChartAt: 1).
	debugOn
		ifTrue: [ 
			1 to: charts size do: [ :index | 
				(charts at: index)
					inspectWithLabel:
						(String
							streamContents: [ :s | 
								s
									nextPutAll: 'chart [';
									nextPutAll: index asString;
									nextPutAll: ']' ]) ] ].
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
								(((charts at: item chart) select: [ :anItem | anItem symbolAtDot = item rule head ])
									collect: [ :anItem | anItem moveDotForward ]) ]
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
										((grammar alternativesOf: item symbolAtDot) collect: [ :rule | JEItem rule: rule dotAtBeginningWithChartAt: i ]) ] ] ] ].
	^ (charts at: words size + 1) includes: (JEItem rule: firstRule dotAtEndWithChartAt: 1)