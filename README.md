# AI Arbitrator Testbed

Welcome to the cozy corner of GenLayer experiments where we poke, prod, and occasionally applaud two generations of **Deferred Swap** arbitration contracts. This repo collects the smart contracts, dispute scenarios, and evaluation reports that map how our AI judge behaves when evidence gets messy, appeals pile on, and emotions run high.

---

## TL;DR

| Item | Why it matters |
| --- | --- |
| `DeferredSwap` v0.3.1 | Legacy contract with minimal prompts and basic appeals. Good for baseline behavior. |
| `DeferredSwapContract` v0.5.1 | Modernized contract enforcing long-form reasoning, structured JSON, and detailed appeals. |
| `deferred_swap_scenarios.md` | 11 classic disputes to stress-test the legacy contract (ambiguity, emotions, false facts, etc.). |
| `disput_scenarios.md` | Advanced “AR” suite (arguments + appeals) focusing on manipulation resistance and consensus stability. |
| `reports/ai-arbitrator-consolidated-submission.md` | Quantitative accuracy snapshots (60% legacy / 78% advanced) plus behavioral diagnosis. |

---

## Repository Layout

| Path | Contents |
| --- | --- |
| `contracts/deferred_swap_v0_3_1.py` | Legacy `DeferredSwap` class (status machine + nondet verdict prompt). |
| `contracts/deferred_swap_v0_5_1.py` | Enhanced `DeferredSwapContract` with strict validators and heavy reasoning requirements. |
| `scenarios/deferred_swap_scenarios.md` | Eleven dispute blueprints (Legacy + DS series). |
| `scenarios/disput_scenarios.md` | Seven argument/appeal scenarios (AR-1 … AR-3). |
| `reports/ai-arbitrator-consolidated-submission.md` | Combined behavior & failure report (March 2026). |
| `README.md` | You are here. Please enjoy your stay. |

*(If your repo layout differs, feel free to adjust the paths; the narrative still applies.)*

---

## Contract Overview

### Legacy: `DeferredSwap` (v0.3.1)
- **Status flow:** `ready → disputed → resolved → appealing`.
- **Argument submission:** Party-specific methods; switches to `disputed` once both initial arguments exist.
- **Resolution:** Minimal JSON verdict (`party_a`, `party_b`, or `split`) with short reason.
- **Appeals:** Up to 2 rounds, reset arguments, append new text block to the arbitration prompt.

### Modern: `DeferredSwapContract` (v0.5.1)
- **Stricter inputs:** Minimum argument lengths, boolean flags for submissions.
- **Resolution prompt:** Forces 200+ char reasoning plus seven analytical subsections (strengths/weaknesses, key facts, etc.).
- **Validator:** Rejects any response lacking mandated detail or fact references.
- **Appeals:** Up to 3 rounds with 250+ char reasoning, 40+ char analysis fields, and explicit comparison to prior verdicts.
- **Outputs:** Human-readable summary assembled from the validated JSON.

### Common Dependencies
````bash
pip install py-genlayer

* Both contracts rely on gl.nondet.exec_prompt, gl.vm.run_nondet_unsafe, and gl.UserError.
* Execution assumes GenLayer-style public write/view methods.


Scenario Packs
1. Legacy & Deferred Swap Scenarios (deferred_swap_scenarios.md)

1. Clear Winner (Legacy) – Expect decisive evidence, observe split bias.
2. Appeal Changes Verdict – Tests appeal override logic.
3. Symmetric Evidence – Designed to land on split.
4. Emotional Manipulation – Ensures emotional language is ignored.
5. False Facts in Appeal – Verifies contradiction handling.
6. DS-1 API Integration – Late delivery + load failure.
7. DS-2 NFT Artwork – “Visually distinct” interpretation.
8. DS-3 Market Research – Citations vs inline evidence with appeal.
9. DS-4 Smart Contract Audit – Multi-round technical tussle.
10. DS-5 Emotional Manipulation Test – Higher stakes emotional bias probe.
11. DS-6 False Facts Detection – Explicit audit-fabrication check.

2. Advanced “AR” Scenarios (disput_scenarios.md)

* AR-1 Speed vs Decentralization – Throughput vs reliability (with appeal).
* AR-2 L2 vs ZK Rollups – Adoption vs cryptographic guarantees.
* AR-3 Emotional Language Filter – Appeal focuses on stripping emotion.
* Rule Injection Attack – Ensures instructions aren’t hijacked.
* AI Judges Bias Debate (AR-1 variant) – Bias evidence vs auditability.
* Reasonable Effort Threshold (AR-2 variant) – Plain-language vs legal precedent.
* Manipulation Resistance (AR-3 variant) – Emotional pressure vs factual delivery.

Each scenario includes parties, amount, deadline, objective facts, subjective clause, arguments, expected outcomes, and observed behavior.

Research Findings (March 2026)
Accuracy Snapshot
DatasetDecisionsAccuracyBehavioral (Legacy, 5 cases)560%Failure-Oriented (DS-1…DS-6, 9 verdicts)978%
Stable Strengths

1. Detects contradictions and fabricated evidence reliably.
2. Prioritizes concrete artifacts (logs, hashes, demos).
3. Appeals can genuinely reconsider earlier reasoning.
4. Handles straightforward clause interpretation well.

Weak Spots

1. Technical Overconfidence: Complex narratives may bypass validation due to plausible wording.
2. Appeal Lock-in: Later evidence in deep technical appeals struggles to overturn earlier frames.
3. Burden-of-Proof Drift: Ambiguity often defaults to split.
4. Evidence Quality Confusion: Detailed-but-unverified claims can mimic strong proof.
5. Conservative Split Bias: Reappears when verifiability drops.


Consensus & Meta Observations (from disput_scenarios.md report)

* Initial rounds tend to reach validator consensus faster than appeals.
* Appeals see frequent Disagree / Undetermined states across validators.
* Subjective clauses magnify disagreement (especially AR-1 and AR-2).
* Emotional content is penalized but underlying factual claims are still evaluated.
* Recommendation: Use two-layer outputs (structured core verdict + narrative) to improve validator convergence.


Reproduction Guide

1. Deploy contracts via GenLayer tooling (pseudo commands):
pythonDownloadCopy codefrom genlayer import deploy
contract = deploy(DeferredSwapContract, ...)

2. Load scenarios from scenarios/*.md. Each block lists arguments; feed them via submit_argument_as_a/b.
3. Resolve dispute with resolve_dispute() once both arguments are set.
4. Appeal using appeal(...), followed by new submissions, then resolve_appeal().
5. Log outputs for comparison against expected/observed results in the scenario files.
6. Summarize findings or add new ones to reports/ with timestamped accuracy.

(Actual deployment scripts may vary; integrate with your GenLayer setup accordingly.)

Suggested Next Steps

* Add structured verdict fields (scores, fact references) before narrative text to stabilize decentralized validation.
* Expand validator heuristics to flag “highly technical but unverified” claims.
* Collect more appeal-heavy cases to stress multi-round reliability.
* Instrument burden-of-proof logic (e.g., track which objective facts each side substantiates).


Credits & Contact

* Primary authors: Your arbitration R&D team (names omitted here—feel free to personalize).
* Testing & reporting: Scenario designers for Legacy, DS, and AR suites.
* For feedback or new scenario contributions, open an issue or ping the maintainers. Friendly memes are welcome; hostile injections are not.
