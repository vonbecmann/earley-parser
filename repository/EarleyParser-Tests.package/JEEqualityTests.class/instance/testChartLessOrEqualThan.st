tests
testChartLessOrEqualThan
	| one other |
	one := JEChart number: 1.
	other := JEChart number: 2.
	self assert: one <= other