"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestEarleyParserCore,
	#superclass : #PackageManifest,
	#category : 'EarleyParser-Core'
}

{ #category : #'code-critics' }
ManifestEarleyParserCore class >> ruleAssertEqualSignIntoAssertEqualsV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JEBSPPFParser #buildForestFrom: #false)) #'2016-09-30T01:48:41.877607-03:00') )
]

{ #category : #'code-critics' }
ManifestEarleyParserCore class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JELinkedList #collect: #false)) #'2016-05-15T17:49:21.887503-03:00') #(#(#RGMethodDefinition #(#JELinkedList #addAll: #false)) #'2016-05-15T17:49:21.887444-03:00') #(#(#RGMethodDefinition #(#JELinkedList #select: #false)) #'2016-05-15T17:49:21.887522-03:00') #(#(#RGMethodDefinition #(#JEAlgorithm #predictNonterminal:at: #false)) #'2016-06-09T19:35:23.717721-03:00') #(#(#RGMethodDefinition #(#JEAlgorithm #predictNonterminal:at: #false)) #'2016-06-09T19:35:23.717407-03:00') )
]

{ #category : #'code-critics' }
ManifestEarleyParserCore class >> ruleIfTrueReturnsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JEDottedItem #= #false)) #'2016-09-30T01:48:41.900439-03:00') #(#(#RGMethodDefinition #(#JEDottedRule #= #false)) #'2016-09-30T01:48:41.900004-03:00') #(#(#RGMethodDefinition #(#JEColumn #= #false)) #'2016-09-30T01:48:41.898053-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #= #false)) #'2016-09-30T01:48:41.90046-03:00') #(#(#RGMethodDefinition #(#JEOrderedPair #= #false)) #'2016-09-30T01:48:41.900366-03:00') #(#(#RGMethodDefinition #(#JEIdentityOrderedPair #= #false)) #'2016-12-14T20:54:20.161577-03:00') )
]

{ #category : #'code-critics' }
ManifestEarleyParserCore class >> ruleInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#JEBDTreeHypergraph #size #false)) #'2016-05-15T17:49:21.858504-03:00') #(#(#RGMethodDefinition #(#JELink #value #false)) #'2016-05-15T17:49:21.85864-03:00') #(#(#RGMethodDefinition #(#JEHypernode #value #false)) #'2016-05-15T17:49:21.858775-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #value #false)) #'2016-05-15T17:49:21.8588-03:00') #(#(#RGMethodDefinition #(#JEParseForest #size #false)) #'2016-05-15T17:49:21.85882-03:00') )
]

{ #category : #'code-critics' }
ManifestEarleyParserCore >> ruleCollectionProtocolRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#JELinkedList #collect: #false)) #'2015-04-22T19:54:43.396301-03:00') #(#(#RGMethodDefinition #(#JELinkedList #select: #false)) #'2015-04-30T09:46:41.246945-03:00') #(#(#RGMethodDefinition #(#JELinkedList #addAll: #false)) #'2015-05-29T22:24:30.190152-03:00') )
]

{ #category : #'code-critics' }
ManifestEarleyParserCore >> ruleDetectContainsRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#JELinkedList #detect:ifNone: #false)) #'2015-04-25T17:47:48.218101-03:00') )
]

{ #category : #'code-critics' }
ManifestEarleyParserCore >> ruleIfTrueReturnsRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#JEDottedItem #= #false)) #'2015-02-13T02:15:44.904019-03:00') #(#(#RGMethodDefinition #(#JERule #= #false)) #'2015-02-24T12:30:40.359083-03:00') #(#(#RGMethodDefinition #(#JEDottedRule #= #false)) #'2015-02-25T12:36:15.366458-03:00') #(#(#RGMethodDefinition #(#JESymbolTerminal #= #false)) #'2015-03-18T01:28:00.374179-03:00') #(#(#RGMethodDefinition #(#JEColumn #= #false)) #'2015-03-18T01:28:00.374459-03:00') #(#(#RGMethodDefinition #(#NCNonterminal #= #false)) #'2015-03-18T01:28:00.374688-03:00') #(#(#RGMethodDefinition #(#JEPointer #= #false)) #'2015-04-19T01:06:16.466176-03:00') #(#(#RGMethodDefinition #(#JEHypernode #= #false)) #'2015-04-30T09:46:41.113231-03:00') #(#(#RGMethodDefinition #(#JEBDirectedHyperedge #= #false)) #'2015-04-30T09:46:41.113617-03:00') #(#(#RGMethodDefinition #(#JELink #= #false)) #'2015-05-04T11:54:54.230238-03:00') #(#(#RGMethodDefinition #(#NCCharacterTerminal #= #false)) #'2015-05-06T21:18:23.056977-03:00') #(#(#RGMethodDefinition #(#JEToken #= #false)) #'2015-05-12T12:37:59.872947-03:00') #(#(#RGMethodDefinition #(#JEDottedItem #equals: #false)) #'2015-05-12T12:37:59.872634-03:00') #(#(#RGMethodDefinition #(#NCRxCharacterSetTerminal #= #false)) #'2015-05-18T16:14:43.257994-03:00') #(#(#RGMethodDefinition #(#JETerminalItem #= #false)) #'2015-08-01T19:39:35.26963-03:00') )
]

{ #category : #'code-critics' }
ManifestEarleyParserCore >> ruleInconsistentMethodClassificationRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#JELink #value #false)) #'2015-04-15T22:21:55.255473-03:00') )
]
