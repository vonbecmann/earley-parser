"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestEarleyParserCore,
	#superclass : #PackageManifest,
	#category : #'EarleyParser-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestEarleyParserCore class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JEAlgorithm #predictNonterminal:at: #false)) #'2018-05-08T23:06:28.205394-03:00') )
]

{ #category : #'code-critics' }
ManifestEarleyParserCore class >> ruleIfTrueReturnsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JEDottedRule #= #false)) #'2018-05-08T23:06:29.047963-03:00') #(#(#RGMethodDefinition #(#JEOrderedPair #= #false)) #'2018-05-08T23:06:29.048132-03:00') #(#(#RGMethodDefinition #(#JEIdentityOrderedPair #= #false)) #'2018-05-08T23:06:29.048081-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #= #false)) #'2018-05-08T23:06:29.048169-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #= #false)) #'2018-05-08T23:06:29.047817-03:00') #(#(#RGMethodDefinition #(#JEColumn #= #false)) #'2018-05-08T23:06:29.048187-03:00') )
]
