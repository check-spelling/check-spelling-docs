Some dictionaries will have high overlap with other dictionaries.

currently a report will be of the form:

> Unrecognized words (_number_)
> Previously acknowledged words that are now absent _number not listed_
> Available dictionaries could cover words not in the dictionary
> This includes both expected items (_some number which also counts items that are absent_) from .github/actions/spelling/expect.txt and unrecognized words (_number_)

> dictionary (_total entries_) covers _matching entry count_ of them

It might be nice to show:

> dictionary (_unique matching entries_, _common matching entries_, _total entries_)

Where _unique matching entries_ + _common matching entries_ = _matching entry count_.

An entry in a dictionary would be scored into _unique matching entries_ only if it isn't present in other dictionaries.
