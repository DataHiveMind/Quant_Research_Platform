// Table schema for market data
marketData: ([timestamp: `timestamp$()]
    bidPrice: `float$();     // Bid price
    askPrice: `float$();     // Ask price
    spread: `float$();       // Spread (ask - bid)
    volume: `int$();         // Volume of trade
    latency: `float$()       // Latency of trade
)

// Save the schema for persistence
\save marketData
