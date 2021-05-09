# Suggest Area Dictionaries

To make the out-of-the-box flow better, it'd be helpful if the tool
automatically suggested [[Area Dictionaries|Feature: Area Dictionaries]] to enable.

As the work to parallelize the spell checker yields lists of unknown words,
it's possible to check a number of potential supplemental dictionaries against
files and determine which ones would have the most benefit.

I'm still thinking about how to do this.

It could be done against the final unknown list, or it could be done on
a per-file basis.

I'm not sure what the threshold for suggesting a word list should be.

Possibilities:

* covers `>x(%)` of the unknown words
* grows the known word list by `>x(%)`
* results in `>x(%)` files having `0` unknown words
