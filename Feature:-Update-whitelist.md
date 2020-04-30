# Update whitelist

Presently, the action reports a comment which includes a posix shell command to update the whitelist.

It would be much nicer if one could click something and have the action update the whitelist.

## Implementation paths

### 

## Downsides

I see a lot of people running the commands blindly and missing the fact that there are real misspellings in the output.

* Part of this is that they aren't used to looking at the output.
* Part of this is that the current release (0.0.15-alpha) doesn't highlight certain cases (this is fixed in a prerelease, I expect it to be available in 0.0.16-alpha shortly).