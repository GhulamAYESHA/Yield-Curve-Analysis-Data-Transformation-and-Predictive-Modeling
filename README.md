# Yield-Curve-Analysis-Data-Transformation-and-Predictive-Modeling

## Overview

This report presents the implementation of yield curve analysis using R. The study follows the methodology outlined by Cochrane and Piazzesi (2005) to examine the predictive power of the yield curve for excess bond returns. The implementation involves data transformation, regression analysis, and hypothesis testing on historical and modern datasets.

### Data Transformation and Visual Analysis
#### Objective

Transform yield curve data into log forwards and excess log returns.

#### Datasets

- LW22 and ZC22, covering the period from 1961 to 2023.

#### Visualization

- Graphs of excess log returns for both datasets.
- Comparison of pre-2003 and post-2003 trends.
- Observation of cyclical patterns in bond returns.

#### Findings

- The bond market exhibits synchronized movements across maturities.
- No significant divergence in excess returns post-2003.
- The factor identified by Cochrane and Piazzesi remains valid beyond their original sample period.

### Regression Analysis and Hypothesis Testing

#### Objective

Evaluate the yield curve’s ability to predict excess returns.

#### Method

Regression analysis on maturities (n = 2 to n = 5).

#### Time Segmentation

Pre-2004 and post-2003 periods.

Key Results

![image](https://github.com/user-attachments/assets/e84d2ff3-5f99-4f5c-8241-bec5a6581ee8)

- Pre-2004 results indicate no significant predictive power of f1.
- Post-2003 results suggest a strong relationship between forward rates and excess returns.


### Unrestricted and Restricted Regressions

#### Objective

Test the single-factor hypothesis of Cochrane and Piazzesi (2005).

#### Analysis

- Coefficient patterns exhibit a "tent" shape in both pre- and post-2003 datasets.

- Results confirm the persistence of the single-factor model in market predictions.


