## Submission 

* This is the second submission of the ggplate R package.

There was the following comment from Beni Altman:

Please rather use the Authors@R field and declare Maintainer, Authors and Contributors with their appropriate roles with person() calls.
e.g. something like:
Authors@R: c(person("Alice", "Developer", role = c("aut", "cre","cph"),
email = "alice.developer@some.domain.net"),
person("Bob", "Dev", role = "aut") )

* I am a bit confused about this since this was already the format of the Author field. There was a line break, which maybe caused some issues that I have removed now.

If there are references describing the methods in your package, please add these in the description field of your DESCRIPTION file in the form
authors (year) <doi:...>
authors (year) <arXiv:...>
authors (year, ISBN:...)
or if those are not available: <https:...>
with no space after 'doi:', 'arXiv:', 'https:' and angle brackets for auto-linking. (If you want to add a title as well please put it in quotes: "Title")

* There are no references describing the method. The package just creates a plot of a plate, which is not easy to achieve with ggplot. But there is still nothing I would cite.

## Test environments
* macOS-latest (on GitHub actions), R 4.2.2
* windows-latest (on GitHub actions), R 4.2.2
* ubuntu-20.04 (on GitHub actions), R 4.2.2
* ubuntu-20.04 (on GitHub actions), r-devel
* windows-ix86+x86_64 (win-builder), r-devel
* fedora-clang-devel (R-hub), r-devel
* windows-x86_64-devel (R-hub), r-devel
* Ubuntu Linux 20.04.1 LTS (R-hub), r-release

## R CMD check results

0 errors ✓ | 0 warnings ✓ | 0 notes ✓

