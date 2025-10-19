# News Aggregator — Design Notes and Implementation Journey

This post summarizes the problem, architecture, and solutions explored while building a robust News Aggregator, consolidating details from the system design notes and research.

## Problem Overview

- Aggregate news from multiple sources (RSS, APIs, web pages)
- Normalize, deduplicate, and rank content
- Support search, filtering, and topic feeds
- Provide near-real-time updates with reasonable cost

## High-level Architecture

- Ingestion: connectors for RSS, APIs, and HTML scraping
- Normalization: schema mapping, content extraction, language/metadata enrichment
- Deduplication: fingerprinting (URL + shingled text hash) and similarity checks
- Storage: document store for articles, object store for raw content, index for search
- Indexing: incremental indexing with backfill
- Serving: read-optimized API with caching
- Observability: metrics for latency, freshness, and source health

## Key Design Decisions

- Use batched ingestion with backpressure and retry queues
- Prefer idempotent writes with deterministic document IDs
- Maintain source registry and per-source schedules
- Employ content similarity for near-duplicates and canonicalization
- Add safety rails for scraping (robots.txt, rate limits, timeouts)

## Search and Ranking

- Token + BM25 baseline with recency boost
- Optional semantic reranking for quality queries
- Filters: source, topic, time range, language

## Performance & Cost

- Incremental updates using mtime/ETag and diffing
- Cache hot queries; precompute top N per topic
- Bulk index refresh windows off-peak

## Security & Compliance

- Comply with terms of service; honor robots, use API keys where provided
- Sanitize HTML; strip trackers
- Logging with PII minimization

## Next Steps

- Add feedback signals and CTR-based ranking
- Topic models and entity extraction for better feeds
- Alerts and personalized digests
