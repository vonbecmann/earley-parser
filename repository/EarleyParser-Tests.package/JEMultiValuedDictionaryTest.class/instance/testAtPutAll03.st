tests-accessing
testAtPutAll03
	dict at: 'A' putAll: (Set with: 1 with: $e).
	
	self assert: ((dict at: 'A') includesAll: { 1. $e })