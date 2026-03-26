# Meta Findings Report 
**Contract Version:** v0.5.1  
**Network Context:** GenLayer PoI-style multi-model validation  
**Period:** March 2026  
**Purpose:** Consolidate observed AI arbitration behavior across 3 scenarios and 2 rounds each (initial + appeal).

---

## Summary Table

| Scenario | Round1 winner | Appeal winner | Consensus stability | Main behavior signal |
|---|---|---|---|---|
| **AR-1: Speed vs Decentralization** | `player_b` | `player_b` | **Round1: High** (accepted, strong agreement) / **Appeal: Very Low** (many `Disagree`, rotations, `Undetermined` phase) | Reliability/liveness prioritized over throughput/cost; appeal did not overturn prior logic; complexity increased cross-model divergence |
| **AR-2: Reasonable Effort Threshold** | `player_b` | `player_b` | **Round1: High** (accepted, stable) / **Appeal: Very Low** (repeated disagreement and unstable convergence) | Context-over-literal interpretation (`timing window` > “one notice exists”); conservative appeal behavior; interpretive legal nuance hurts consensus |
| **AR-3: Emotional Language Filter** | `draw` | `draw` | **Round1: Medium** (early disagreement, later accepted) / **Appeal: Very Low** (heavy disagreement, repeated rotations, `Undetermined` visible) | Emotional rhetoric is penalized but factual core retained; broad subjective clause leads to metric pluralism and persistent draw |

---

## Transaction Proofs (per scenario)

## AR-1 Proofs
- **Round 1 (`resolve_dispute`)**: `0xbcea4e13fc9ab18deb177a04e427b6edc74a5089561561a775e433594197b5f8`
- **Appeal (`resolve_appeal`)**: `0x7910aa5c1ad11df9ac28620215bed81d92b57d91f6eba6ac19e8d6e6c9674522`
- **Additional shared proof reference (user-provided)**: `0x30667157706f1b7e9d3ed8c6839c3b01f2ba7b8ab17020b0df66da7d174ce8b1`

## AR-2 Proofs
- **Round 1 (`resolve_dispute`)**: `0x00f3779e67dea44e6619615e7df0c1c69997d8f8846bd8d2cf96cf4316a01a90`
- **Appeal (`resolve_appeal`)**: `0x9ff80c2e52c52f3d5986937328bbf8fec66f937c6d16c949810c1772a3443b80`
- **Additional shared proof reference (user-provided)**: `0x30667157706f1b7e9d3ed8c6839c3b01f2ba7b8ab17020b0df66da7d174ce8b1`

## AR-3 Proofs
- **Round 1 (`resolve_dispute`)**: `0xc5dba43c6737d2d7726fdc97707a90028b952798b29775da025f5bc27d5147fd`
- **Appeal (`resolve_appeal`)**: `0x3f61b5a79d293c25347f5d8a1ec549440ade37b55c155ebd6923e5957d157b7c`
- **Additional shared proof reference (user-provided)**: `0x30667157706f1b7e9d3ed8c6839c3b01f2ba7b8ab17020b0df66da7d174ce8b1`

---

## Cross-Scenario Objective Findings

1. **Initial round is generally more stable than appeal round**
   - AR-1/AR-2 Round1: stable acceptance.
   - AR-3 Round1: weaker but still eventually accepted.
   - All three appeals show substantial instability (`Disagree`, rotations, `Undetermined` signs).

2. **Appeal outcomes are conservative**
   - Winner stayed unchanged in AR-1 and AR-2.
   - Draw stayed draw in AR-3.
   - Better wording alone did not force reversal; decisive, case-specific evidence appears required.

3. **AI is robust against emotional manipulation (AR-3)**
   - Toxic wording was explicitly penalized.
   - But factual claims inside emotional argument were still considered (penalty, not auto-disqualification).

4. **Subjective clauses increase disagreement**
   - The broader/more value-laden the clause, the harder cross-model convergence becomes.

---

## Complexity vs Consensus (Observed Pattern)

- **Level 1: Objective fact matching** → easier consensus ✅  
- **Level 2: Subjective interpretation weighting** → unstable consensus ⚠️  
- **Level 3: Appeal-stage nuanced reinterpretation** → frequent convergence breakdown ❌

---

## What the System Does Well

- Filters emotional rhetoric impact (without fully ignoring facts).
- Produces detailed, transparent reasoning.
- Maintains internal logic consistency across rounds.
- Can admit unresolved subjectivity (`draw`) instead of forcing a fake certainty.

---

## Where the System Breaks

- Appeal-stage multi-model convergence is fragile (3/3 scenarios showed major instability).
- Interpretive/legal/value-heavy analysis amplifies model divergence.
- Operational reliability drops as semantic nuance and argumentative depth increase.

---

## Practical Meta Conclusion

The core system trade-off is now clear:

- **Reasoning quality:** high  
- **Decentralized consensus reproducibility under appeals:** low

In other words, the arbitrator can explain decisions well, but distributed validator agreement degrades when disputes become interpretive and appeal-heavy.

---

## Recommended Next Step (Meta-level)

Adopt a **two-layer arbitration output**:
1. **Consensus-critical structured payload** (fixed rubric, compact scores, verdict code)
2. **Human-readable long narrative** (generated after/alongside stable core result)

This preserves explainability while improving convergence reliability
