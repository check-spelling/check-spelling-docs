# Blacklisting words

Currently each project can use a default dictionary, or replace the default dictionary with their own sets of dictionaries.

At least one project has identified words that they'd like to remove from the dictionary.

As the main implementation includes a `whitelist` of acceptable words, it seems reasonable to handle rejecting words by adding a `blacklist` which would remove words from the dictionary (instead of removing them from the corpus).