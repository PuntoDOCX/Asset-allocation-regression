# Asset-allocation-regression

"It is widely agreed that asset allocation accounts for a large part of the variability in the return on a typical investor's portfolio. This is especially true if the overall portfolio is invested in multiple funds, each including a number of securities.
Asset allocation is generally defined as the allocation of an investor's portfolio among a number of "major" asset classes. Clearly such a generalization cannot be made operational without defining such classes.
Once a set of asset classes has been defined, it is important to determine the exposures of each component of an investor's overall portfolio to movements in their returns. Such information can be aggregated to determine the investor's overall effective asset mix. If it does not conform to the desired mix, appropriate alterations can then be made."
ASSET ALLOCATION: MANAGEMENT STYLE AND PERFORMANCE MEASUREMENT" by Sharpe, 1992. 

What the code does is basically running a regression on the returns of a portfolio against returns from asset classes representing factors (like Fama-French 5 factor model). By doing this we are able to get an estimation of the factor tilts without having information about the composition of the portfolio.
