hold a simple benchmark.
| duration |
Smalltalk 
	garbageCollect;
	garbageCollectMost.
duration := JEBenchmark new acceptsBK.
'| ', Date today asString, ' | ', duration asString, ' |'.
