// Query to detect arbitrage opportunities (spread > 0.3, latency < 0.1)
detectArbitrage: {
    select from marketData where spread > 0.3, latency < 0.1
}

// Query to calculate average latency over time
averageLatencyByMinute: {
    select avg latency by time.minute timestamp from marketData
}

// Query for bid-ask spread distribution
spreadDistribution: {
    select count i by spread from marketData
}

// Save and test the queries
\save queries.q
\l queries.q
detectArbitrage[]
averageLatencyByMinute[]
