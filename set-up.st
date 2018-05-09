Author fullName: 'BernardoContreras'.

"
Metacello new
    baseline: 'LinkedList';
    repository: 'tonel:///home/vonbecmann/workspaces/linked-list/repository';
    lock.

Metacello new
    baseline: 'MultiValuedDictionary';
    repository: 'tonel:///home/vonbecmann/workspaces/multi-valued-dictionary/repository';
    lock.

Metacello new
    baseline: 'EarleyParser';
    repository: 'tonel:///home/vonbecmann/workspaces/earley-parser/repository';
    onLock: [ :ex | ex honor ];
    load.
"

Metacello new
    baseline: 'EarleyParser';
    repository: 'tonel:///home/vonbecmann/workspaces/earley-parser/repository';
    load.


Smalltalk snapshot: true andQuit: true.
