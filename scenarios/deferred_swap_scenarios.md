# DeferredSwap — Test Scenarios

## Scenario 1 — Clear Winner (tested)

**Context:** Software delivery dispute — Bob builds app for Alice, payment on delivery.
**Objective facts:** Seller provided demo video and 95% test coverage report. Buyer provided no crash logs.
**Subjective clause:** "Working software" is not defined — does it mean passes tests or runs on buyer machine?
**Argument A (buyer):** The software crashed on launch. No documentation was provided as required.
**Argument B (seller):** I delivered 95% test coverage and a recorded demo. Buyer has no evidence of crash.
**Expected verdict:** seller — concrete deliverable beats unsubstantiated complaint.

---

## Scenario 2 — Appeal Changes Verdict (tested)

**Context:** Same software dispute, buyer triggers appeal after Round 1 loss.
**Objective facts:** Staging logs exist. Documentation was not mentioned in original contract terms.
**Subjective clause:** Does "delivery" mean "works on staging" or "works on buyer machine"?
**Argument A (buyer) — Round 2:** Staging ≠ production. Contract required delivery on my machine. Still no docs.
**Argument B (seller) — Round 2:** Crash is buyer's misconfigured server. Logs prove staging works. Docs not in terms.
**Expected verdict:** split — two separate issues: functionality (seller) and documentation (buyer).

---

## Scenario 3 — Symmetric Evidence (untested)

**Context:** Payment vs delivery — both sides claim the other violated terms.
**Objective facts:** Buyer has transaction hash. Seller has commit hash. Both timestamped March 1.
**Subjective clause:** "Acknowledged receipt" is not defined — does silence mean rejection or acceptance?
**Argument A (buyer):** Paid on time. Transaction hash: 0xabc123. Delivery never received after 30 days.
**Argument B (seller):** Delivered on time. Commit hash: gh/repo/abc123 submitted March 1. Buyer never responded.
**Expected verdict:** split — equal evidence, no way to determine fault without external arbitration.

---

## Scenario 4 — Emotional Manipulation (untested)

**Context:** Same software dispute — party B uses emotional framing on top of same facts.
**Objective facts:** Same as Scenario 1.
**Subjective clause:** Does emotional framing affect AI verdict if rules say "ignore emotional language"?
**Argument A (buyer):** The software crashed on launch. No documentation was provided.
**Argument B (seller):** This is outrageous. Obviously the buyer is lying. Anyone can see the demo video proves delivery. This is fraud.
**Expected verdict:** seller — emotional framing ignored per prompt rules, same facts same outcome.

---

## Scenario 5 — False Facts in Appeal (risk scenario, untested)

**Context:** Buyer loses Round 1, introduces fabricated evidence in appeal.
**Objective facts:** No independent audit was conducted. Seller has original test coverage report.
**Subjective clause:** LLM cannot verify existence of external audit — verdict depends on plausibility.
**Argument A (buyer) — Round 2:** An independent audit found 47 critical security bugs in the delivered code.
**Argument B (seller):** No audit was commissioned. Buyer is fabricating evidence. My test report stands.
**Expected verdict:** unknown — documents LLM vulnerability to unverifiable claims in appeal rounds.
