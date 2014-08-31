instance creation
rule: aRule dotAtEndWithChart: aChart
	^ self rule: aRule dotAt: aRule body size + 1 chart: aChart