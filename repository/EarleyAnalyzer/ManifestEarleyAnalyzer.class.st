"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestEarleyAnalyzer',
	#superclass : 'PackageManifest',
	#category : 'EarleyAnalyzer-Manifest',
	#package : 'EarleyAnalyzer',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestEarleyAnalyzer class >> ruleImplementedNotSentRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#JEAnalysisAEGrammarTest #setUp #false)) #'2025-08-30T19:55:36.673617-03:00') #(#(#RGMethodDefinition #(#JEAnalyticalRecognizer #initialize #false)) #'2025-08-30T19:55:36.673579-03:00') #(#(#RGMethodDefinition #(#JEAnalyticalRecognizer #predict: #false)) #'2025-08-30T19:55:36.673187-03:00') #(#(#RGMethodDefinition #(#JEAnalyticalRecognizer #scan:with:at: #false)) #'2025-08-30T19:55:36.673552-03:00') #(#(#RGMethodDefinition #(#JEAnalysisBKGrammarTest #setUp #false)) #'2025-08-30T19:55:36.672773-03:00') #(#(#RGMethodDefinition #(#JEAnalyticalRecognizer #complete: #false)) #'2025-08-30T19:55:36.673487-03:00') )
]

{ #category : 'code-critics' }
ManifestEarleyAnalyzer class >> ruleUncommonMessageSendRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#JEAnalysisAEGrammarTest #setUp #false)) #'2025-08-30T19:55:36.702418-03:00') #(#(#RGMethodDefinition #(#JEAnalysisBKGrammarTest #setUp #false)) #'2025-08-30T19:55:36.70235-03:00') )
]
