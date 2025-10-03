# Technical Indicators Overview

This document provides a summary of commonly used technical indicators in financial analysis and algorithmic trading. These indicators help traders identify trends, momentum, and potential reversal points in the market.

| Indicator                          | Description |
|-----------------------------------|-------------|
| **Volume Moving Average (MA)**    | A moving average applied to trading volume instead of price. Helps identify volume trends over time. Can be Simple (SMA) or Exponential (EMA). |
| **Exponential Moving Average (EMA)** | A type of moving average that places greater weight on recent data points, making it more responsive to new information than a simple moving average. |
| **Relative Strength Index (RSI)** | A momentum oscillator that measures the speed and change of price movements. Values range from 0 to 100. Typically, RSI > 70 is considered overbought, and RSI < 30 oversold. |
| **Moving Average Convergence Divergence (MACD)** | A trend-following momentum indicator that shows the relationship between two EMAs (typically 12-day and 26-day). Also includes a signal line (9-day EMA of MACD). |
| **Volume-Weighted Average Price (VWAP)** | The average price of a security, weighted by volume. Commonly used by institutional traders to gauge the average entry or exit price throughout the day. |
| **Bollinger Bands (BOLL)**        | A volatility indicator consisting of a middle band (usually a 20-period SMA) and two outer bands ±2 standard deviations from the middle. It expands and contracts based on market volatility. |

## Notes
- Most of these indicators are used in conjunction with each other to confirm trading signals.
- Parameters (like periods for MA, RSI, MACD) can be customized based on trading strategies and timeframes.
