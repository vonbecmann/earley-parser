an Earley item or state. like a LR(0) item. 

start: the column where the recognition started.
end: the column that contains this item or nil. but an item always belongs to a column.

firstKey :
secondKey:  a composed key useful to know if this item already exists in a column.

node : a packed parse node of myself, only used during parsing that's why it is lazy initialized.





