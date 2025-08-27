"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestEarleyParserCore',
	#superclass : 'PackageManifest',
	#category : 'EarleyParser-Core-Manifest',
	#package : 'EarleyParser-Core',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestEarleyParserCore class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JEAlgorithm #predictNonterminal:at: #false)) #'2018-05-08T23:06:28.205394-03:00') )
]

{ #category : 'code-critics' }
ManifestEarleyParserCore class >> ruleIfTrueReturnsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JEDottedRule #= #false)) #'2018-05-08T23:06:29.047963-03:00') #(#(#RGMethodDefinition #(#JEOrderedPair #= #false)) #'2018-05-08T23:06:29.048132-03:00') #(#(#RGMethodDefinition #(#JEIdentityOrderedPair #= #false)) #'2018-05-08T23:06:29.048081-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #= #false)) #'2018-05-08T23:06:29.048169-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #= #false)) #'2018-05-08T23:06:29.047817-03:00') #(#(#RGMethodDefinition #(#JEColumn #= #false)) #'2018-05-08T23:06:29.048187-03:00') )
]

{ #category : 'code-critics' }
ManifestEarleyParserCore class >> ruleImplementedNotSentRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#JEDottedItem #moveDotForward #false)) #'2025-08-27T00:39:43.176286-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #equals: #false)) #'2025-08-27T00:39:43.176542-03:00') #(#(#RGMethodDefinition #(#JEColumn #isEmpty #false)) #'2025-08-27T00:39:43.176775-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #head #false)) #'2025-08-27T00:39:43.17598-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #printOn: #false)) #'2025-08-27T00:39:43.176931-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #isPredicted #false)) #'2025-08-27T00:39:43.176466-03:00') #(#(#RGMethodDefinition #(#JEDottedRule #isRepresentation #false)) #'2025-08-27T00:39:43.175941-03:00') #(#(#RGMethodDefinition #(#JEDottedRule #head #false)) #'2025-08-27T00:39:43.176325-03:00') #(#(#RGMethodDefinition #(#JEBSPPForest #release #false)) #'2025-08-27T00:39:43.175812-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #rule #false)) #'2025-08-27T00:39:43.176737-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #symbolAtDot #false)) #'2025-08-27T00:39:43.176968-03:00') #(#(#RGMethodDefinition #(#JEColumn #'<=' #false)) #'2025-08-27T00:39:43.175902-03:00') #(#(#RGMethodDefinition #(#'ManifestEarleyParserCore class' #ruleIfTrueReturnsRuleV1FalsePositive #true)) #'2025-08-27T00:39:43.1762-03:00') #(#(#RGMethodDefinition #(#JERule #hash #false)) #'2025-08-27T00:39:43.176245-03:00') #(#(#RGMethodDefinition #(#JEDottedRule #printOn: #false)) #'2025-08-27T00:39:43.175721-03:00') #(#(#RGMethodDefinition #(#JERule #printOn: #false)) #'2025-08-27T00:39:43.176026-03:00') #(#(#RGMethodDefinition #(#JEDottedRule #hash #false)) #'2025-08-27T00:39:43.176622-03:00') #(#(#RGMethodDefinition #(#JEFamily #isEmpty #false)) #'2025-08-27T00:39:43.1767-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #isEpsilon #false)) #'2025-08-27T00:39:43.17586-03:00') #(#(#RGMethodDefinition #(#JEFamily #second #false)) #'2025-08-27T00:39:43.175674-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #isActive #false)) #'2025-08-27T00:39:43.176813-03:00') #(#(#RGMethodDefinition #(#JEFamily #release #false)) #'2025-08-27T00:39:43.175627-03:00') #(#(#RGMethodDefinition #(#JEColumn #size #false)) #'2025-08-27T00:39:43.17446-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #hash #false)) #'2025-08-27T00:39:43.176388-03:00') #(#(#RGMethodDefinition #(#JEFamily #hash #false)) #'2025-08-27T00:39:43.176662-03:00') #(#(#RGMethodDefinition #(#JEDottedRule #body #false)) #'2025-08-27T00:39:43.175764-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #= #false)) #'2025-08-27T00:39:43.176428-03:00') #(#(#RGMethodDefinition #(#JEParseForest #release #false)) #'2025-08-27T00:39:43.176584-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #release #false)) #'2025-08-27T00:39:43.176504-03:00') #(#(#RGMethodDefinition #(#'ManifestEarleyParserCore class' #ruleCollectionProtocolRuleV1FalsePositive #true)) #'2025-08-27T00:39:43.173663-03:00') #(#(#RGMethodDefinition #(#JEColumn #printOn: #false)) #'2025-08-27T00:39:43.176851-03:00') #(#(#RGMethodDefinition #(#JEGrammar #parse: #false)) #'2025-08-27T00:39:43.176893-03:00') #(#(#RGMethodDefinition #(#JEColumn #hash #false)) #'2025-08-27T00:39:43.175189-03:00') #(#(#RGMethodDefinition #(#JERule #= #false)) #'2025-08-27T00:40:51.257504-03:00') #(#(#RGMethodDefinition #(#JEItem #release #false)) #'2025-08-27T00:40:51.257479-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #= #false)) #'2025-08-27T00:40:51.257564-03:00') #(#(#RGMethodDefinition #(#JEGrammar #accepts: #false)) #'2025-08-27T00:40:51.25753-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #printOn: #false)) #'2025-08-27T00:40:51.257451-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #isRepresentation #false)) #'2025-08-27T00:40:51.257649-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #isFinal #false)) #'2025-08-27T00:40:51.256823-03:00') #(#(#RGMethodDefinition #(#JEFamily #size #false)) #'2025-08-27T00:40:51.257627-03:00') #(#(#RGMethodDefinition #(#JEFamily #first #false)) #'2025-08-27T00:40:51.257673-03:00') #(#(#RGMethodDefinition #(#JEColumn #release #false)) #'2025-08-27T00:40:51.257361-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #hash #false)) #'2025-08-27T00:40:51.257696-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #equals: #false)) #'2025-08-27T00:40:51.257718-03:00') #(#(#RGMethodDefinition #(#JEParseForest #numberOfTrees #false)) #'2025-08-27T00:40:51.256311-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #release #false)) #'2025-08-27T00:40:51.2576-03:00') )
]

{ #category : 'code-critics' }
ManifestEarleyParserCore class >> ruleInconsistentMethodClassificationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#JEColumn #release #false)) #'2025-08-27T00:42:01.491565-03:00') #(#(#RGMethodDefinition #(#JEItem #release #false)) #'2025-08-27T00:42:01.492005-03:00') #(#(#RGMethodDefinition #(#JEBSPPForest #release #false)) #'2025-08-27T00:42:01.49253-03:00') #(#(#RGMethodDefinition #(#JEParseForest #release #false)) #'2025-08-27T00:42:01.492657-03:00') #(#(#RGMethodDefinition #(#JEFamily #release #false)) #'2025-08-27T00:42:01.492694-03:00') )
]

{ #category : 'code-critics' }
ManifestEarleyParserCore class >> ruleReCompactSourceCodeRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#JERule #printOn: #false)) #'2023-10-19T00:34:55.042324-03:00') #(#(#RGMethodDefinition #(#JEDottedRule #printOn: #false)) #'2023-10-19T00:34:55.04212-03:00') )
]

{ #category : 'code-critics' }
ManifestEarleyParserCore class >> ruleReShouldSendSuperInitializeAsFirstMessageV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#JEGrammarBuilder #initialize #false)) #'2025-08-27T00:42:01.50786-03:00') #(#(#RGMethodDefinition #(#JEGrammar #initialize #false)) #'2025-08-27T00:42:01.507774-03:00') #(#(#RGMethodDefinition #(#JEColumn #initialize #false)) #'2025-08-27T00:42:01.507827-03:00') )
]
