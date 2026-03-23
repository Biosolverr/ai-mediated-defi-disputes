# AI-Mediated DeFi Disputes

A GenLayer project exploring on-chain AI arbitration for DeFi disputes.

## Overview

Two smart contracts that use LLM consensus (via GenLayer validators) to resolve
disputes and evaluate arguments without human judges.

## Contracts

| Contract | Purpose | Flow |
|----------|---------|------|
| DeferredSwap | Bilateral dispute with appeal | create → dispute → resolve → appeal → re-resolve |
| Arena | Subjective argument evaluation | create → submit × 2 → resolve |

## Repository Structure
# ai-mediated-defi-disputes

ai-mediated-defi-disputes/
├── contracts/      — GenLayer smart contracts
├── scripts/        — Demo flow runners
├── scenarios/      — Test cases and edge cases
├── research/       — Analysis and findings
└── README.md

## Key Findings

- **Verdict changes under appeal** — LLM updates verdict when new concrete facts are introduced
- **Refutation beats assertion** — attacking opponent's specific example outperforms making new claims
- **Prompt rules respected** — constructor-level rules constrain LLM judgment consistently
- **State read timing** — GenLayer Studio may return stale state immediately after write transactions

## Requirements

- GenLayer Studio — [studio.genlayer.com](https://studio.genlayer.com)
- Python 3.10+ (for demo scripts)

## How to Deploy

1. Copy contract from `contracts/`
2. Paste into GenLayer Studio
3. Fill constructor arguments
4. Follow step-by-step guide in `scripts/`

## Tested On

- GenLayer Studio (March 2026)
- Validator models: DeepSeek-V3, Llama-4-Maverick, Grok-4
- All scenarios reached ACCEPTED consensus status
