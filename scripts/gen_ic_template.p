"""
GenLayer IC Template Generator

Generates contract and scenario stubs for new Intelligent Contract projects.

Usage:
    python gen_ic_template.py --type deferred_swap --name my_project
    python gen_ic_template.py --type arena --name debate_club
"""

import argparse
import os

DEFERRED_SWAP_CONTRACT = '''from genlayer import *

@gl.contract
class {class_name}:
    status: str
    buyer: str
    seller: str
    amount: int
    terms: str
    argument_a: str
    argument_b: str
    verdict: str
    appeal_round: int

    def __init__(self, buyer: str, seller: str, amount: int, terms: str):
        self.status = "created"
        self.buyer = buyer
        self.seller = seller
        self.amount = amount
        self.terms = terms
        self.argument_a = ""
        self.argument_b = ""
        self.verdict = ""
        self.appeal_round = 0

    def build_llm_prompt(self, arg_a: str, arg_b: str) -> str:
        return f"""
You are an impartial AI arbitrator for a DeFi contract dispute.

Contract terms: {{self.terms}}

Party A argument: {{arg_a}}
Party B argument: {{arg_b}}

Rules:
1. Base your verdict only on objective facts.
2. Ignore emotional language.
3. Reference contract terms explicitly in your reasoning.
4. If evidence is missing or equal, return split.

Respond with exactly one of:
"party_a: <reason>"
"party_b: <reason>"
"split: <reason>"
        """

    @gl.public.write
    def submit_argument(self, party: str, argument: str) -> None:
        if party == "buyer":
            self.argument_a = argument
        elif party == "seller":
            self.argument_b = argument
        if self.argument_a and self.argument_b:
            self.status = "disputed"

    @gl.public.write
    def resolve_dispute(self) -> None:
        prompt = self.build_llm_prompt(self.argument_a, self.argument_b)
        result = gl.exec_prompt(prompt)
        self.verdict = result.strip()
        self.status = "resolved"

    @gl.public.write
    def appeal(self) -> None:
        self.appeal_round += 1
        self.status = "appealing"
        self.argument_a = ""
        self.argument_b = ""

    @gl.public.write
    def submit_appeal_argument(self, party: str, argument: str) -> None:
        if party == "buyer":
            self.argument_a = argument
        elif party == "seller":
            self.argument_b = argument
        if self.argument_a and self.argument_b:
            self.status = "re-disputed"

    @gl.public.write
    def re_resolve_dispute(self) -> None:
        prompt = self.build_llm_prompt(self.argument_a, self.argument_b)
        result = gl.exec_prompt(prompt)
        self.verdict = result.strip()
        self.status = "re-resolved"

    @gl.public.view
    def get_status(self) -> str:
        return self.status

    @gl.public.view
    def get_verdict(self) -> str:
        return self.verdict if self.verdict else "No verdict yet"

    @gl.public.view
    def get_appeal_round(self) -> int:
        return self.appeal_round
'''

ARENA_CONTRACT = '''from genlayer import *

@gl.contract
class {class_name}:
    topic: str
    rules: str
    argument_a: str
    argument_b: str
    winner: str
    reason: str
    status: str

    def __init__(self, topic: str, rules: str):
        self.topic = topic
        self.rules = rules
        self.argument_a = ""
        self.argument_b = ""
        self.winner = ""
        self.reason = ""
        self.status = "open"

    def build_llm_prompt(self, arg_a: str, arg_b: str) -> str:
        return f"""
Topic: {{self.topic}}
Rules: {{self.rules}}

Player A: {{arg_a}}
Player B: {{arg_b}}

Rules for evaluation:
1. Apply the rules above strictly.
2. Ignore emotional language.
3. Base decision on logical consistency and concrete examples only.

Respond with exactly one of:
"player_a: <reason>"
"player_b: <reason>"
        """

    @gl.public.write
    def submit_argument(self, player: str, argument: str) -> None:
        if player == "a":
            self.argument_a = argument
        elif player == "b":
            self.argument_b = argument
        if self.argument_a and self.argument_b:
            self.status = "ready"

    @gl.public.write
    def resolve_match(self) -> None:
        prompt = self.build_llm_prompt(self.argument_a, self.argument_b)
        result = gl.exec_prompt(prompt)
        self.status = "resolved"
        if result.strip().startswith("player_a"):
            self.winner = "player_a"
        else:
            self.winner = "player_b"
        self.reason = result.split(":", 1)[1].strip() if ":" in result else result

    @gl.public.view
    def get_status(self) -> str:
        return self.status

    @gl.public.view
    def get_result(self) -> str:
        if not self.winner:
            return "No result yet"
        return f"{{self.winner}}: {{self.reason}}"
'''

SCENARIO_TEMPLATE = '''# {project_name} — Test Scenarios

## Scenario 1 — [Name]

**Context:** [Describe the situation]
**Objective facts:** [What can be verified — numbers, hashes, dates]
**Subjective clause:** [What is open to interpretation]
**Argument A:** [First party argument]
**Argument B:** [Second party argument]
**Expected verdict:** [party_a / party_b / split — and why]

---

## Scenario 2 — [Name]

**Context:**
**Objective facts:**
**Subjective clause:**
**Argument A:**
**Argument B:**
**Expected verdict:**

---

## Scenario 3 — Appeal Round

**Context:** [Same dispute, appeal triggered after Round 1]
**Objective facts:**
**Subjective clause:**
**Argument A (Round 1):**
**Argument B (Round 1):**
**Round 1 verdict:**
**Argument A (Appeal):** [New facts or reframing]
**Argument B (Appeal):**
**Expected verdict after appeal:**
'''


def to_class_name(name: str) -> str:
    return "".join(word.capitalize() for word in name.replace("-", "_").split("_"))


def generate(contract_type: str, project_name: str) -> None:
    class_name = to_class_name(project_name)
    output_dir = project_name

    os.makedirs(f"{output_dir}/contracts", exist_ok=True)
    os.makedirs(f"{output_dir}/scenarios", exist_ok=True)

    if contract_type == "deferred_swap":
        contract_content = DEFERRED_SWAP_CONTRACT.format(class_name=class_name)
        contract_file = f"{output_dir}/contracts/{project_name}_contract.py"
    elif contract_type == "arena":
        contract_content = ARENA_CONTRACT.format(class_name=class_name)
        contract_file = f"{output_dir}/contracts/{project_name}_contract.py"
    else:
        print(f"Unknown type: {contract_type}. Use 'deferred_swap' or 'arena'.")
        return

    with open(contract_file, "w") as f:
        f.write(contract_content)

    scenario_file = f"{output_dir}/scenarios/{project_name}_scenarios.md"
    with open(scenario_file, "w") as f:
        f.write(SCENARIO_TEMPLATE.format(project_name=project_name))

    print(f"Generated:")
    print(f"  {contract_file}")
    print(f"  {scenario_file}")
    print(f"\nNext steps:")
    print(f"  1. Fill in scenarios in {scenario_file}")
    print(f"  2. Deploy {contract_file} in GenLayer Studio")
    print(f"  3. Run through your scenario arguments manually")


def main():
    parser = argparse.ArgumentParser(
        description="GenLayer IC Template Generator"
    )
    parser.add_argument(
        "--type",
        required=True,
        choices=["deferred_swap", "arena"],
        help="Contract type to generate"
    )
    parser.add_argument(
        "--name",
        required=True,
 
