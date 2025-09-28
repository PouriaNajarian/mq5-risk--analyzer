# MQL5 Risk & Lot Calculator Indicator (Crypto Safe)

A comprehensive MetaTrader 5 indicator that calculates optimal lot sizes based on risk management parameters. This indicator is specifically designed to work accurately with **Forex, Gold, and Crypto CFDs** (BTCUSD, ETHUSD, etc.), addressing common calculation issues with cryptocurrency pairs.

## 🚀 Features

- **Multi-Asset Support**: Works with Forex pairs, Gold, and Crypto CFDs
- **Crypto-Safe Calculations**: Properly handles cryptocurrency pip value calculations
- **Flexible Risk Management**: Supports both percentage-based and fixed USD risk amounts
- **Real-Time Updates**: Configurable refresh interval for live calculations
- **Comprehensive Display**: Shows all relevant trading parameters and calculations
- **Account Currency Aware**: Automatically adapts to your account's base currency

## 📊 What It Calculates

The indicator provides real-time calculations for:

- **Pip Value per Lot**: Accurate pip value calculation for any instrument
- **Risk per Lot**: Total risk exposure for 1 lot at your specified stop loss
- **Recommended Lot Size**: Optimal position size based on your risk parameters
- **Account Information**: Balance, equity, and currency details
- **Symbol Information**: Contract size, point size, and current price

## ⚙️ Input Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `RiskPercent` | double | 1.0 | Percentage of account balance to risk per trade |
| `RiskAmountUSD` | double | 0.0 | Fixed USD amount to risk (takes priority if > 0) |
| `StopLossPips` | double | 100 | Stop-loss distance in pips |
| `RefreshSeconds` | int | 2 | Update interval in seconds |

## 🔧 Installation

1. **Download** the `risk_lot_indicator.mq5` file
2. **Copy** the file to your MetaTrader 5 indicators folder:
   ```
   MetaTrader 5/MQL5/Indicators/
   ```
3. **Compile** the indicator in MetaEditor (F7)
4. **Attach** to any chart from the Navigator panel

## 📈 How to Use

1. **Attach the indicator** to any chart (Forex, Gold, or Crypto)
2. **Configure your risk parameters**:
   - Set `RiskPercent` for percentage-based risk (e.g., 1% = 1.0)
   - Or set `RiskAmountUSD` for fixed dollar risk amount
   - Adjust `StopLossPips` to match your trading strategy
3. **View the calculations** in the chart comment area
4. **Use the recommended lot size** for your trades

## 💡 Example Usage

### Scenario 1: Percentage-Based Risk
- Account Balance: $10,000
- Risk Percent: 2.0%
- Stop Loss: 50 pips
- **Result**: Risk $200, recommended lot size calculated automatically

### Scenario 2: Fixed USD Risk
- Risk Amount USD: $100
- Stop Loss: 75 pips
- **Result**: Always risk exactly $100 regardless of account balance

## 🔍 Technical Details

### Crypto Calculation Fixes

This indicator addresses common issues with cryptocurrency pair calculations:

- **Proper Tick Value Calculation**: Uses `SYMBOL_TRADE_TICK_VALUE_PROFIT` for accurate crypto pip values
- **Fallback Calculation**: If broker returns 0, calculates manually using `(contractSize * pointSize) / price`
- **Real-Time Price Integration**: Uses current bid price for accurate calculations
- **Multi-Currency Support**: Works with any account currency

### Supported Instruments

- **Forex Pairs**: EURUSD, GBPUSD, USDJPY, etc.
- **Precious Metals**: XAUUSD (Gold), XAGUSD (Silver)
- **Cryptocurrency CFDs**: BTCUSD, ETHUSD, LTCUSD, etc.
- **Indices**: SPX500, NAS100, etc.

## 📋 Display Information

The indicator shows a comprehensive information panel with:

```
------ Risk & Lot Calculator (Crypto Safe) ------
Symbol: BTCUSD
Balance: 10000.00 USD
Price: 45000.00
Contract Size: 1.0
Point Size: 0.01000000
Tick Value: 0.000222 USD
Stop Loss (pips): 100
Percent Risk: 1.00% (100.00 USD)
Pip Value (per 1 lot): 0.000222 USD
Risk per 1 lot: 0.02 USD
Recommended Lot: 5000.0000
------------------------------------------------
```

## 🛠️ Customization

### Modifying Risk Parameters
- **Conservative Trading**: Use 0.5-1.0% risk
- **Moderate Trading**: Use 1.0-2.0% risk
- **Aggressive Trading**: Use 2.0-3.0% risk (not recommended)

### Adjusting Refresh Rate
- **High-Frequency Trading**: Set `RefreshSeconds` to 1
- **Standard Trading**: Keep default 2 seconds
- **Long-Term Trading**: Set to 5-10 seconds

## ⚠️ Important Notes

1. **Risk Management**: Never risk more than you can afford to lose
2. **Backtesting**: Test the indicator on historical data before live trading
3. **Broker Differences**: Some brokers may have different contract specifications
4. **Market Hours**: Calculations are based on current market prices
5. **Spread Consideration**: The indicator uses bid prices; consider spread in your analysis

## 🔄 Updates and Improvements

### Version History
- **v1.0**: Initial release with basic risk calculations
- **v1.1**: Added crypto-safe calculations and improved accuracy
- **v1.2**: Enhanced display format and added more symbol information

### Future Enhancements
- [ ] Support for multiple timeframes
- [ ] Risk-reward ratio calculations
- [ ] Position sizing for multiple open trades
- [ ] Alert system for risk threshold breaches
- [ ] Export functionality for trade logs

## 🤝 Contributing

Contributions are welcome! Please feel free to:

1. **Fork** the repository
2. **Create** a feature branch
3. **Submit** a pull request with your improvements
4. **Report** bugs or suggest new features

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## ⚡ Quick Start

```mql5
// Example: Conservative crypto trading setup
RiskPercent = 1.0;      // Risk 1% of account
StopLossPips = 200;     // 200 pip stop loss
RefreshSeconds = 2;     // Update every 2 seconds
```

## 📞 Support

If you encounter any issues or have questions:

1. **Check** the [Issues](https://github.com/PouriaNajarian/mq5-risk--analyzer/issues) page
2. **Create** a new issue with detailed information
3. **Include** your broker name and instrument specifications

## 🎯 Trading Tips

- **Start Small**: Begin with smaller risk percentages
- **Test First**: Always test on demo accounts
- **Monitor Closely**: Keep an eye on the calculations during volatile periods
- **Adjust Accordingly**: Modify parameters based on market conditions
- **Stay Disciplined**: Stick to your risk management rules

---

**Disclaimer**: This indicator is for educational and informational purposes only. Trading involves substantial risk of loss and is not suitable for all investors. Past performance is not indicative of future results.
