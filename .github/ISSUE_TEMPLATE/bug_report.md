---
name: Bug report
about: Create a report to help us improve
title: ''
labels: bug
assignees: jpquast

---

**Describe the bug**
A clear and concise description of what the bug is and what the expected behaviour is.

**To Reproduce**
Create a reproducible example with the `reprex` package. Exactly follow these [steps](https://reprex.tidyverse.org). Then post the reprex here as it is.

If you need to provide your own dataset, you can use the `dput()` function to turn your `data.frame` into code that you can use in the reprex. This is an example of how this would work:

``` r
# Load package for example data
library(ggplate)

# Use example dataset to demonstrate use of dput
data("data_continuous_12")

# Use dput to generate code for recreating the dataset
dput(data_continuous_12)
#> structure(list(Value = c(0.57, 0.89, 0.78, 0.11, 0.55, 0.48, 
#> 0.06, 0.51, 0.56, 1, 0.96, 0.91), well = c("A1", "A2", "A3", 
#> "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4")), row.names = c(NA, 
#> -12L), class = c("tbl_df", "tbl", "data.frame"))
```

Just use the output of `dput()` to create the input data in your reprex.

**Additional context**
Add any other context about the problem here.
