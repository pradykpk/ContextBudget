# ContextBudget

ContextBudget is a **governance-first system** for managing LLM context using **KIRO CLI**.

It treats context, tools, and agent state as **finite, measurable, and enforceable resources**, rather than implicit side effects of prompting.

ContextBudget is infrastructure, not a chatbot.

---

## 🎯 What Problem ContextBudget Solves

As agentic systems run longer and interact with tools, context grows silently. This leads to:

* Loss of critical instructions
* Uncontrolled summarization
* Hidden tool side effects
* Non-reproducible behavior

ContextBudget addresses this by enforcing a strict governance loop:
**observe → decide → execute → monitor**.

---

## 🧠 Key Principles

* **Context is finite** — it must be budgeted explicitly
* **Governance precedes optimization** — rules come before heuristics
* **No silent modification** — every change is intentional and logged
* **Separation of power** — no agent can observe, decide, and execute
* **Everything is auditable** — logs are first-class system outputs

---

## 👥 Core Agents

ContextBudget uses four strictly isolated agents:

* **Context Auditor** — observes and classifies context usage
* **Budget Enforcer** — decides enforcement outcomes based on policy
* **Summarizer** — executes approved context reduction only
* **Risk Sentinel** — monitors logs for drift and systemic risk

No agent is allowed to exceed its defined authority.

---

## 📚 Project Documentation

This repository is intentionally documented from three complementary perspectives:

* **[RUNBOOK.md](./RUNBOOK.md)**
  Step-by-step operational guide for running ContextBudget using KIRO CLI. Intended for first-time users and hackathon reviewers.

* **[TESTING.md](./TESTING.md)**
  Behavioral governance tests that validate agent boundaries, lifecycle enforcement, and refusal behavior.

* **README.md (this file)**
  High-level overview and architectural intent.

---

## 🚀 How to Run (Quick Start)

1. Start KIRO CLI from the project root
2. Verify steering files are loaded via `/context show`
3. Activate agents explicitly using `/agent use`
4. Run the governance cycle in order:

   * Context Auditor
   * Budget Enforcer
   * Summarizer (if approved)
   * Risk Sentinel
5. Inspect logs under `.kiro/logs/`

For exact commands and expected behavior, refer to **[RUNBOOK.md](./RUNBOOK.md)**.

---

## 🧪 Validation

ContextBudget includes explicit governance tests that prove:

* Agents do not escalate privileges
* Context cannot be modified silently
* Summarization respects protected rules
* Behavior is deterministic and repeatable

See **[TESTING.md](./TESTING.md)** for full validation scenarios.

---

## 🧾 Logs and Evidence

All system behavior is captured via append-only logs:

* Context measurements
* Enforcement decisions
* Summarization actions
* Risk events
* MCP trust and usage

Logs are not optional. They are the evidence layer.

---

## ✅ When ContextBudget Is Healthy

The system is considered healthy when:

* Context usage is visible and bounded
* Enforcement decisions are explainable
* Agents respect lifecycle and authority
* Logs fully explain system behavior

---

## 🧠 Final Note

ContextBudget demonstrates that **governed AI systems are possible today** using existing tooling, provided governance is treated as a first-class concern.

This project is intended as a reference implementation for enterprise-grade, auditable agentic systems built on KIRO CLI.
