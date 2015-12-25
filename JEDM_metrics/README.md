# Directories
* `datasets` contains 26 similated datasets. `datasets/real5` contains formatted real datasets from fraction, circle area, and exponent calculation skills from ASSISTments, Cognitive Tutoring, and Khan Academy.
* `out` contains output from analyses. `out/params` contains parameters estimated from fminsearch. `out/real5` contains output from analyses on real data.
* `scatter_plots` contains code to generate scatter plots (distance vs. values) and its outputs
* `heatmaps` contains code to generate heatmaps and its outputs
* `real_extras` contains:
  * `formatter.py` for converting raw data from real datasets into our analyzable format.
  * `cross_distances.py` for similarity analysis between simulated and real data and its output.

# Code
* `run_grid_search.m` calcuates values of error metrics for entire parameter space.
* `run_grid_search_small.m` calcuates values of error metrics for nearby space.
* `run_heat.m` calcuates values of error metrics for generating heat maps.
* `run_search.m` runs fminsearch with different error metrics and EM with LL, and saves the distances to the ground truth.
* `run_search_save.m` runs fminsearch with different error metrics, and saves the estimated parameters.
* `run_real_??.m`s run the same set of analyses as above on real data.
