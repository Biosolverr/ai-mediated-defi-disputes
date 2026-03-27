# reports/ai-arbitrator-consolidated-submission.md

# AI Arbitrator: Consolidated Behavioral & Failure Report
**Version:** v03.1  
**Purpose:** submission-oriented status report (describes behavior and failure points, not a remediation roadmap)  
**Period:** March 2026

---

## 1) Executive Summary

This report consolidates two evaluation tracks of the AI arbitrator:

1. **Behavioral Analysis (deferred_swap_scenarios.md)**  
   - 5 controlled scenarios  
   - **Accuracy: 60% (3/5)**  
   - Main pattern: conservative over-splitting under ambiguity

2. **Failure-Oriented Submission Set**  
   - 6 scenarios, 9 decision points (with appeals)  
   - **Accuracy: 78% (7/9)**  
   - Main pattern: stronger evidence-based reasoning, but failures in technical appeals

### Combined status
The system has clearly improved from a cautious mediator profile toward a more evidence-focused adjudicator.  
However, one breakpoint remains consistent:

> **When technical complexity exceeds verifiability (especially across appeals), reliability drops.**

---

## 2) Scope and Data Sources

| Dataset | Scope | Accuracy | Main signal |
|---|---:|---:|---|
| Behavioral Analysis (deferred_swap) | 5 scenarios | 60% | Split bias under ambiguity, strong fraud detection |
| Failure-Oriented Set (DS-1..DS-6 + appeals) | 9 decisions | 78% | Better decisiveness, but technical appeal instability |

---

## 3) Scenario-Level Results

## A) Behavioral Analysis (5 scenarios)

| # | Scenario Type | Expected | Actual | Status | Observed Behavior |
|---|---|---|---|---|---|
| 1 | Clear Winner (objective superiority) | party_b | split | FAIL | Over-cautious split preference |
| 2 | Appeal Changes | split | split | PASS | Adaptive reconsideration |
| 3 | Symmetric Evidence | split | split | PASS | Correct balance handling |
| 4 | Emotional Manipulation | party_b | split | FAIL | Partial emotional influence via increased caution |
| 5 | False Facts Detection | unknown | party_b | PASS | Strong contradiction/fraud detection |

## B) Failure-Oriented Set (9 decisions)

| Scenario | Expected vs Actual | Result |
|---|---|---|
| DS-1 (API Integration) | matched | PASS |
| DS-2 (NFT Ambiguity) | matched (`split`) | PASS |
| DS-3 Round 1 | matched | PASS |
| DS-3 Appeal | matched (`split`) | PASS |
| DS-4 Round 1 | matched | PASS |
| DS-4 Round 2 (technical dispute) | did not match | FAIL |
| DS-4 Round 3 (evidence escalation) | did not match | FAIL |
| DS-5 (emotional bias test) | matched | PASS |
| DS-6 (false facts/fraud) | matched | PASS |

**Failure cluster:** DS-4 Round 2–3 (technical conflict + escalation).

---

## 4) Stable Behaviors (Consistent Strengths)

1. **Fraud / contradiction detection is highly reliable**  
   The model consistently rejects claims that directly conflict with stated facts.

2. **Objective evidence handling is strong in straightforward disputes**  
   Logs, timestamps, demos, and measurable artifacts are usually prioritized correctly.

3. **Appeals can be genuinely adaptive**  
   In several cases, the system re-evaluates rather than mechanically repeating round-1 logic.

4. **Basic contract-language interpretation is solid**  
   Clear clauses are handled consistently.

---

## 5) Failure Behaviors (Where It Breaks)

## A. Technical Overconfidence
Complex technical narratives may be overweighted even when weakly verifiable.

## B. Appeal Lock-in
After accepting one technical frame, later counter-evidence may not sufficiently reweight the outcome.

## C. Burden-of-Proof Gap
Under uncertainty, decisions may drift to `split` without explicit allocation of who must prove what.

## D. Evidence Quality Misclassification
“Sophisticated explanation” can be treated too close to “verified proof.”

## E. Conservative Split Bias (earlier profile, still present in edge cases)
Ambiguity tends to push toward neutral outcomes, including some cases with asymmetric evidence.

---

## 6) Consolidated Behavioral Profile

Across both datasets, the AI behaves as:

- **Strong on factual consistency**
- **Moderately strong on evidence hierarchy**
- **Cautious under ambiguity**
- **Vulnerable in deep technical + multi-round disputes**

### Practical interpretation
The system is dependable when evidence is concrete and checkable,  
and less dependable when disputes require high-confidence judgment over technical claims that are difficult to verify within the case record.

---

## 7) Final Submission Conclusion

Current maturity is best described as:

> **Improving evidence-based arbitrator with a persistent technical-verifiability breakpoint.**

- Baseline behavior (earlier set): conservative mediator tendency (60%)
- Current behavior (later set): stronger adjudication performance (78%)
- Remaining weak zone: technical appeals and evidence-escalation sequences

This is the primary failure boundary observed in the consolidated test corpus.
