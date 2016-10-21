hold a simple benchmark.
| duration |
Smalltalk 
	garbageCollect;
	garbageCollectMost.
duration := JEBenchmark new acceptsBKBenchmark.
'| ', Date today asString, ' | ', duration asString, ' |'.
