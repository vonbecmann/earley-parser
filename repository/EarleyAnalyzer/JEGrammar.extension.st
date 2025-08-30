Extension { #name : 'JEGrammar' }

{ #category : '*EarleyAnalyzer' }
JEGrammar >> analyzeAccepts: words [
	^ (JEAnalyticalRecognizer given: self) accepts: words
]

{ #category : '*EarleyAnalyzer' }
JEGrammar >> analyzeParse: words [
	^ (JEAnalyticalForestParser given: self) parse: words
]
