//+------------------------------------------------------------------+
//|                risk_lot_indicator_crypto_safe.mq5               |
//|   Works for Forex, Gold, Crypto CFDs (BTCUSD, ETHUSD, etc.)     |
//+------------------------------------------------------------------+
#property indicator_separate_window
#property indicator_buffers 0
#property indicator_plots   0

input double RiskPercent   = 1.0;   // Percent risk
input double RiskAmountUSD = 0.0;   // Fixed USD risk
input double StopLossPips  = 100;   // Stop-loss in pips
input int RefreshSeconds   = 2;     // Refresh interval

datetime lastCalc = 0;

int OnInit()
{
   IndicatorSetString(INDICATOR_SHORTNAME, "Risk & Lot Calculator (Crypto Safe)");
   return(INIT_SUCCEEDED);
}

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   if(TimeCurrent() - lastCalc < RefreshSeconds)
      return(rates_total);
   lastCalc = TimeCurrent();

   string symbol       = Symbol();
   string accCurrency  = AccountInfoString(ACCOUNT_CURRENCY);
   double balance      = AccountInfoDouble(ACCOUNT_BALANCE);

   double contractSize = SymbolInfoDouble(symbol, SYMBOL_TRADE_CONTRACT_SIZE);
   double pointSize    = SymbolInfoDouble(symbol, SYMBOL_POINT);
   double tickValue    = SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_VALUE_PROFIT);
   double price        = SymbolInfoDouble(symbol, SYMBOL_BID);

   // If broker returns 0, calculate manually
   if(tickValue <= 0.0)
      tickValue = (contractSize * pointSize) / price;

   double pipValuePerLot = tickValue;
   double riskAmount     = (RiskAmountUSD > 0) ? RiskAmountUSD : balance * (RiskPercent / 100.0);
   double riskPerLot     = pipValuePerLot * StopLossPips;
   double lotSize        = (riskPerLot > 0) ? riskAmount / riskPerLot : 0.0;

   string riskMode = (RiskAmountUSD > 0)
                     ? "Fixed Risk: " + DoubleToString(RiskAmountUSD,2) + " " + accCurrency
                     : "Percent Risk: " + DoubleToString(RiskPercent,2) + "% (" + DoubleToString(riskAmount,2) + " " + accCurrency + ")";

   Comment(
      "------ Risk & Lot Calculator (Crypto Safe) ------\n",
      "Symbol: ", symbol, "\n",
      "Balance: ", DoubleToString(balance,2), " ", accCurrency, "\n",
      "Price: ", DoubleToString(price,2), "\n",
      "Contract Size: ", contractSize, "\n",
      "Point Size: ", DoubleToString(pointSize,8), "\n",
      "Tick Value: ", DoubleToString(tickValue,6), " ", accCurrency, "\n",
      "Stop Loss (pips): ", StopLossPips, "\n",
      riskMode, "\n",
      "Pip Value (per 1 lot): ", DoubleToString(pipValuePerLot,6), " ", accCurrency, "\n",
      "Risk per 1 lot: ", DoubleToString(riskPerLot,2), " ", accCurrency, "\n",
      "Recommended Lot: ", DoubleToString(lotSize,4), "\n",
      "------------------------------------------------"
   );

   return(rates_total);
}
