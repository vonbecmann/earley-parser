instance creation
rule: aRule dotAtEndWithChartAt: index
	^ self rule: aRule dotAt: aRule body size + 1 chartAt: index