# Minified file detection

At present, the algorithm compares the number of lines to the number of bytes in the file, if the average exceeds 1000, it will complain.

For a UTF-32 file, that only allows for 250 characters per line, but even that seems fairly long. -- Note that I don't expect check-spelling to be able to check a UTF-32 file in the first place, so if it runs across one, this heuristic would probably be good.

To disable, add `minified-file` to `disable_checks`, and please file a bug with a sample where you think it makes sense to check the file.


