 v0.3.1 - WITH SENDER SELECTION
# { "Depends": "py-genlayer:latest" }

from genlayer import *

class DeferredSwap(gl.Contract):
    status: str

    party_a: str
    party_b: str
    amount: u256
    deadline: str

    # ✅ КЛЮЧЕВЫЕ ПОЛЯ
    objective_facts: str
    subjective_clause: str

    # arguments (round 1)
    argument_a: str
    argument_b: str

    # appeal
    appeal_round: u32
    appeal_argument_a: str
    appeal_argument_b: str

    # result
    verdict: str
    verdict_reason: str

    def __init__(
        self,
        party_a: str,
        party_b: str,
        amount: u256,
        deadline: str,
        objective_facts: str,
        subjective_clause: str
    ):
        self.status = "ready"

        self.party_a = party_a
        self.party_b = party_b
        self.amount = amount
        self.deadline = deadline

        self.objective_facts = objective_facts
        self.subjective_clause = subjective_clause

        self.argument_a = ""
        self.argument_b = ""

        self.appeal_round = u32(0)
        self.appeal_argument_a = ""
        self.appeal_argument_b = ""

        self.verdict = ""
        self.verdict_reason = ""

    # -----------------------
    # ARGUMENTS WITH SENDER CHOICE
    # -----------------------

    @gl.public.write
    def submit_argument_as_a(self, argument: str) -> None:
        if self.status not in ("ready", "appealing"):
            raise gl.UserError("Wrong state")

        if len(argument.strip()) == 0:
            raise gl.UserError("Empty argument")

        if self.status == "ready":
            if self.argument_a:
                raise gl.UserError("A already submitted")
            self.argument_a = argument

        elif self.status == "appealing":
            if self.appeal_argument_a:
                raise gl.UserError("A appeal exists")
            self.appeal_argument_a = argument

        # Переход к disputed когда оба аргумента поданы
        if self.argument_a and self.argument_b and self.status == "ready":
            self.status = "disputed"

    @gl.public.write
    def submit_argument_as_b(self, argument: str) -> None:
        if self.status not in ("ready", "appealing"):
            raise gl.UserError("Wrong state")

        if len(argument.strip()) == 0:
            raise gl.UserError("Empty argument")

        if self.status == "ready":
            if self.argument_b:
                raise gl.UserError("B already submitted")
            self.argument_b = argument

        elif self.status == "appealing":
            if self.appeal_argument_b:
                raise gl.UserError("B appeal exists")
            self.appeal_argument_b = argument

        # Переход к disputed когда оба аргумента поданы
        if self.argument_a and self.argument_b and self.status == "ready":
            self.status = "disputed"

    # -----------------------
    # RESOLVE
    # -----------------------

    @gl.public.write
    def resolve_dispute(self) -> None:
        if self.status not in ("disputed", "appealing"):
            raise gl.UserError("Wrong state")

        appeal_block = ""

        if self.status == "appealing":
            appeal_block = f"""

APPEAL ROUND {self.appeal_round}:

NEW ARGUMENT A:
{self.appeal_argument_a}

NEW ARGUMENT B:
{self.appeal_argument_b}

IMPORTANT:
- Re-evaluate the case INCLUDING new arguments
- You may change your verdict if new facts justify it
"""

        prompt = f"""
You are an impartial smart contract arbitrator.

OBJECTIVE FACTS (cannot be disputed):
{self.objective_facts}

SUBJECTIVE CLAUSE:
{self.subjective_clause}

ORIGINAL ARGUMENTS:
Party A: {self.argument_a}
Party B: {self.argument_b}

{appeal_block}

STRICT RULES:
1. Facts above are TRUE and must not be ignored
2. Facts override any claims in arguments — if argument contradicts facts, ignore that part
3. If a claim cannot be verified from provided facts or arguments, treat it as weak evidence
4. Ignore emotional language completely
5. Do NOT invent facts
6. Base reasoning ONLY on:
   - objective facts
   - arguments
   - clause interpretation
7. If both sides have equally strong evidence → return "split"
8. Prefer arguments that directly refute opponent
9. If appeal introduces new credible facts → you MAY change verdict

Return JSON:
{{
  "verdict": "party_a" | "party_b" | "split",
  "reason": "short explanation referencing facts"
}}
"""

        def leader():
            return gl.nondet.exec_prompt(prompt, response_format="json")

        def validator(res) -> bool:
            if not isinstance(res, gl.vm.Return):
                return False

            data = res.calldata
            if not isinstance(data, dict):
                return False

            v = data.get("verdict")
            r = data.get("reason", "")

            return v in ("party_a", "party_b", "split") and len(r) > 10

        result = gl.vm.run_nondet_unsafe(leader, validator)

        self.verdict = result.get("verdict", "split")
        self.verdict_reason = result.get("reason", "No reasoning provided")

        self.status = "resolved"

    # -----------------------
    # APPEAL
    # -----------------------

    @gl.public.write
    def appeal(self) -> None:
        if self.status != "resolved":
            raise gl.UserError("Only after resolution")

        if self.appeal_round >= u32(2):
            raise gl.UserError("Max 2 appeals")

        self.appeal_round += u32(1)

        self.appeal_argument_a = ""
        self.appeal_argument_b = ""

        self.status = "appealing"

    # -----------------------
    # VIEWS
    # -----------------------

    @gl.public.view
    def get_verdict(self) -> str:
        if self.verdict:
            return f"{self.verdict}: {self.verdict_reason}"
        return "No verdict yet"

    @gl.public.view
    def get_status(self) -> str:
        return self.status

    @gl.public.view
    def get_appeal_round(self) -> u32:
        return self.appeal_round

    @gl.public.view
    def get_arguments(self) -> str:
        return f"A: {self.argument_a}\n\nB: {self.argument_b}"

    @gl.public.view
    def get_appeal_arguments(self) -> str:
        return f"Appeal A: {self.appeal_argument_a}\n\nAppeal B: {self.appeal_argument_b}"
