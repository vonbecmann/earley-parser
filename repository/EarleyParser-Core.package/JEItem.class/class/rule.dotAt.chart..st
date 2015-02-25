instance creation
rule: aRule dotAt: index chart: aChart
	^ self rule: (JEDottedRule rule: aRule withDotAt: index) chart: aChart