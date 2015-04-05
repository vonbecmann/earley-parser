tests
testChartGreaterOrEqualThan
	| one other |
	one := JEChart number: 2.
	other := JEChart number: 1.
	self assert: one >= other