# kdb+/q Database

This folder contains scripts for storing, querying, and analyzing high-frequency trading data using kdb+/q.

## Files
- `schema.q`: Defines the table schema for market data.
- `queries.q`: Pre-defined queries for latency analysis and arbitrage detection.
- `data_ingest.q`: Imports raw market data into the database.
- `real_time.q`: Processes real-time data streams for analysis.

## How to Use
1. Start kdb+/q:
   ```bash
   q

2. Load the schema:
    \l schema.q

3. Import data:
    importData["data/raw/market_data.csv"]

4. Run queries:
    \l queries.q
    detectArbitrage[]
    averageLatencyByMinute[]

5. Process real-time data:
    \l real_time.q
    processRealTimeData["data/real_time/stream.csv"]