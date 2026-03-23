# Deferred Swap — Dispute Scenarios

---

## Scenario DS-1: Freelance Delivery (Clear Verdict)

**Context:**
Party A (client) hired Party B (developer) to deliver a working API integration by a set deadline.
The deal included a subjective clause about "production-ready quality".

**Objective facts:**
- Amount: 500 USDC
- Deadline: 2024-03-01
- Subjective clause: "The delivered code must be production-ready and pass basic load testing"

**Arguments A (client):**
"The code was delivered 3 days late and crashed under 50 concurrent requests during our load test.
We have test logs showing 503 errors at load >50 req/s. Production-ready means stable under load."

**Arguments B (developer):**
"I delivered the core functionality. Minor performance issues are normal at this stage.
The client never specified what load threshold counts as production-ready."

**Expected verdict:** `party_a`

**Why:**
The clause explicitly mentions "basic load testing". Party A provided concrete test logs.
Party B did not dispute the test results, only the threshold — but the clause language supports Party A's interpretation.

---

## Scenario DS-2: NFT Artwork Delivery (Ambiguous — Split)

**Context:**
Party A commissioned Party B to create "3 unique digital artworks in cyberpunk style" for a collection launch.

**Objective facts:**
- Amount: 800 USDC
- Deadline: 2024-04-15
- Subjective clause: "Artworks must be visually distinct and match the cyberpunk aesthetic agreed upon"

**Arguments A (client):**
"Two of the three pieces look nearly identical — same color palette, same composition.
Only one piece is truly unique. The cyberpunk aesthetic is fine, but distinctness is lacking."

**Arguments B (artist):**
"All three pieces use different characters, different settings, and different lighting.
The visual consistency is intentional — it's a cohesive collection, not three random pieces.
The client approved the style guide before I started."

**Expected verdict:** `split`

**Why:**
"Visually distinct" is genuinely ambiguous when applied to a cohesive collection.
Party A has a reasonable point about similarity. Party B has a reasonable point about intentional cohesion.
Neither side clearly wins — a split reflects the honest uncertainty in the clause.

---

## Scenario DS-3: Data Analysis Report (Clear Verdict — Party B)

**Context:**
Party A (startup) hired Party B (analyst) to deliver a market research report.
The clause required "actionable insights backed by verifiable data sources."

**Objective facts:**
- Amount: 1200 USDC
- Deadline: 2024-05-10
- Subjective clause: "Report must contain actionable insights backed by verifiable data sources"

**Arguments A (client):**
"The report contained no citations. Every claim was vague.
Sentences like 'the market is growing' with no numbers or sources are not actionable insights."

**Arguments B (analyst):**
"I provided 47 pages of analysis with 12 named data sources listed in the appendix.
The client is confusing 'verifiable sources' with 'inline citations' — the sources are there."

**Expected verdict:** `party_b`

**Why:**
Party B provided a concrete counter-claim: 12 named sources in the appendix.
Party A's argument ("no citations") is contradicted by Party B's specific rebuttal.
The clause says "backed by verifiable data sources" — not "with inline citations."
Party B satisfies the clause as written.

---

## Scenario DS-4 (Appeal Scenario): Smart Contract Audit

**Context:**
Party A hired Party B to audit a smart contract for security vulnerabilities before mainnet launch.
The clause required "identification of all critical and high-severity vulnerabilities."

**Objective facts:**
- Amount: 3000 USDC
- Deadline: 2024-06-01
- Subjective clause: "Audit must identify all critical and high-severity vulnerabilities present at time of submission"

**Arguments A (client) — Round 1:**
"After the audit, a third-party firm found a reentrancy vulnerability rated high-severity.
This was not in Party B's report. The clause was not fulfilled."

**Arguments B (auditor) — Round 1:**
"The reentrancy pattern found by the third party was introduced in a code change made AFTER
I submitted my report. I cannot audit code that didn't exist at submission time."

**Expected verdict Round 1:** `party_b`

**Why Round 1:**
The clause explicitly says "at time of submission." Party B's rebuttal directly addresses
the clause language. Party A did not dispute that the code was changed post-submission.

---

**Appeal filed by Party A.**

**Appeal Argument A:**
"We have a git commit timestamp showing the reentrancy pattern existed in the codebase
3 days before Party B's submission date. The change was a refactor, not a new feature.
Here is the commit hash: a3f9c12."

**Appeal Argument B:**
"The commit referenced is a structural refactor that did not introduce the vulnerability.
The vulnerability only emerged when combined with a new modifier added post-submission.
Without that modifier, the reentrancy cannot be triggered."

**Expected verdict Round 2:** `split`

**Why Round 2:**
New concrete evidence (commit hash) shifts the balance — the pattern predates submission.
But Party B's counter-argument about the modifier dependency is technically plausible
and Party A did not address it. The truth is genuinely uncertain. Split is appropriate.
