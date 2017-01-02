an Earley item or state 

 [ dotted rule @  start ].
 [ dotted rule @  [ start, end ] ].

start: where the recognition of the dotted rule started.
end: the item set that contains this item or nil. but an item always belongs to an item set.

- an item with the dot at the beginning (just after the arrow) is known as a predicted item, since it results from a prediction.
- an item with the dot at the end is called a final (reduce) item, since the dot at the end means that the whole right-hand side has been recognized and can be reduced.
- an item with the dot in front of a non-terminal is call it a prediction item, since it gives rise to predictions.

- node : a packed parse node of myself, only used during parsing that's why it is lazy initialized.

