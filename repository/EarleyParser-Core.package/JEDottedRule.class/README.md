a dotted rule stands for a rule with the dot indicating how much has already been found and how much is still predicted.
a dotted rule is final if the dot is at the end.
a dotted rule is predicted if the dot is at the beginning.

they are unique objects due to performance reasons.
once a dotted rule is instantianted cannot be changed.

rule - an instance of JERule.
dotIndex - indicates where's the dot in the rule, ie how much has been done.
symbolAtDot - what symbol is at the right side of the dot.
                                nil if it is final(completed).
next - the next dotted rule (myself with the dot move forward)



