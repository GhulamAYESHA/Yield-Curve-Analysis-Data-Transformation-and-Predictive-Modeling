# Yield Curve Analysis and Bond Excess Return Prediction

## Overview

This repository contains an R script implementation and results for analyzing yield curve transformations, excess log returns, and regression-based predictive modeling. The study follows the methodology of Cochrane and Piazzesi (2005) to assess whether their identified factor remains a robust predictor of excess bond returns in modern datasets (LW22 and ZC22). The analysis includes data transformation, visualization, regression modeling, and hypothesis testing.

## Data Transformation and Visual Analysis

- Yield curve data was transformed into log forwards and excess log returns.
- Graphical analysis of excess returns (1961-2023) showed synchronized fluctuations, indicating that long-term and short-term bonds respond similarly to market conditions.
- Post-2003 trends remained consistent with historical behaviors, suggesting that the Cochrane-Piazzesi factor continued to be relevant.

### Key Findings

![image](https://github.com/user-attachments/assets/02d8f710-8cfc-4cab-9f44-b5ccd13aa0b1)
![image](https://github.com/user-attachments/assets/4b19e45b-2025-44f3-a723-55a6571bf6f6)

- Excess returns across different maturities exhibit cyclical patterns.
- No significant divergence in excess returns pre-2003 vs. post-2003.
- A single predictive factor appears to persist over time.

## Regression Analysis and Hypothesis Testing

- Regression models were used to assess the predictive power of forward rates (f1) over different maturities (n = 2 to n = 5).
- Results showed that:
- - Pre-2004: f1 had no significant predictive power (p-value = 0.802).
  - Post-2003: f1 showed a strong predictive relationship (p-value = 7.92e-16).
- This indicates that yield curve slopes gained predictive power after 2003.

### Regression Summary

![image](https://github.com/user-attachments/assets/ebe3dc0a-d590-4013-96d9-2438c3fec0b3)

## Unrestricted and Restricted Regressions

- The analysis examined the stability of Cochrane and Piazzesi’s single-factor model.
- Results confirmed the persistence of a "tent-shaped" coefficient pattern, supporting the continued relevance of the single-factor model.
- However, modern data suggests additional factors may be influencing bond excess returns.

## Testing the Single Risk Factor Restriction

- A hypothesis test was conducted to validate the predictive power of a single risk factor beyond 2003.
- Results confirmed its ongoing relevance but also highlighted the complexity of modern financial markets.
- Findings suggest that while the original factor remains valid, additional economic forces may now contribute to bond return variations.

## Conclusion

- The study successfully replicates and extends Cochrane and Piazzesi (2005).
- The single-factor model remains robust but requires adjustments to incorporate emerging market dynamics.
- Financial analysts and investors can use these findings to refine predictive models for bond markets.

## References

Cochrane, J.H., & Piazzesi, M. (2005). Bond risk premia. American Economic Review, 95(1), 138-160.

