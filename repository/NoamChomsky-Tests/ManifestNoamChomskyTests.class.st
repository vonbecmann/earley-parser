"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestNoamChomskyTests,
	#superclass : #PackageManifest,
	#category : #'NoamChomsky-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestNoamChomskyTests class >> ruleUnoptimizedToDoRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#NCCharacterSetComplementTerminalTest #testMatches02 #false)) #'2023-07-16T23:38:18.963629-03:00') )
]
