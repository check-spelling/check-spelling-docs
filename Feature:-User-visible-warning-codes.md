# User visible warning codes

Through [v0.0.19](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.19), while check-spelling had an internal warning code, GitHub didn't surface the code to end users.

There is a wiki page that describes the [[Event descriptions]].

But, without the warning code, it's a bit hard to known how a given warning message maps to the table.

As of [v0.0.20 alpha 4](https://github.com/check-spelling/check-spelling/releases/tag/v0.0.20-alpha4), the warning code is now included in the log as shown by GitHub in the pretty view (it was always present in the action log, but while it was tagged to GitHub, GitHub didn't do anything with that information).
