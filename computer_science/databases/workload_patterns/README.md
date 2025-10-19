# Workload Patterns for Databases

Use this catalog to map application access patterns to the right database technology.

- OLTP: High-QPS, small, concurrent transactions with strict consistency guarantees
- OLAP: Large scans, aggregations, and analytical queries over big datasets
- HTAP: Blend of transactional and analytical workloads with low data latency
- Time-series: Append-heavy metrics/events with retention and downsampling needs
- Event streaming: Ordered appends, consumer groups, replay, exactly-once/at-least-once
- Search: Full-text relevance, stemming, inverted indexes, fuzzy matching
- Graph: Relationship-centric traversals, path queries, graph algorithms
- Key-value caching: Ultra-low latency, high read throughput, simple access patterns

Selection criteria

- Access patterns: point lookups vs range scans vs aggregates
- Latency and throughput targets: p99 read/write SLAs and QPS
- Consistency and isolation: read-your-writes, transactions, snapshot isolation
- Scale characteristics: vertical vs horizontal scaling, multi-region
- Cost model: storage vs compute vs data egress; hot/warm/cold tiers
- Operational model: backups, replication, upgrades, observability, SRE effort




