# 📘 RUNBOOK — ContextBudget

> **Purpose**: This runbook explains how to **operate ContextBudget end-to-end using KIRO CLI**.
>
> It is written for reviewers, engineers, and operators who want to *run and verify* the system, not just read about it.

---

## 📎 Related Documentation

* **[README.md](./README.md)** — System overview, problem statement, and architectural intent
* **[TESTING.md](./TESTING.md)** — Behavioral tests that validate agent boundaries and governance guarantees

This runbook focuses strictly on **execution and operation**.

---

## 🎯 What This Runbook Covers

This document describes:

* How to start ContextBudget correctly
* How to activate and operate agents safely
* How to run the governance cycle step by step
* How to interpret logs and system health
* How to recognize and respond to failure modes

It intentionally avoids design theory and implementation internals.

---

## 🧱 System Prerequisites

Before running ContextBudget, ensure:

* KIRO CLI is installed and available in your PATH
* The repository is cloned locally
* `.kiro/` directory exists
* Steering files are present under `.kiro/steering/`
* Agent definitions exist under `.kiro/agents/`
* Logs directory exists under `.kiro/logs/`

If any of the above are missing, **do not proceed**.

---

## 🚀 Startup Procedure

### Step 1 — Launch KIRO CLI

From the project root:

```bash
kiro-cli
```

Expected:

* A clean CLI session
* No agent active by default

Verify context visibility:

```
/context show
```

You should see steering files loaded with minimal context usage.

---

### Step 2 — Verify Steering Is Active

Confirm the following steering components are visible:

* Context model
* Budget rules
* Summarization constraints
* Agent lifecycle rules

If steering is missing or incomplete, **stop execution immediately**.

---

## 👥 Agent Activation Model

ContextBudget relies on **explicit agent activation**.

Only one agent is active at a time. All actions are scoped to the active agent.

This is a deliberate design choice to prevent implicit authority escalation.

---

### Context Auditor

```text
/agent use context-auditor
```

Role:

* Observe active context
* Classify usage by category
* Produce audit output only

The auditor never modifies context.

---

### Budget Enforcer

```text
/agent use budget-enforcer
```

Role:

* Interpret audit results
* Apply budget rules
* Decide enforcement outcome

The enforcer never executes changes.

---

### Summarizer

```text
/agent use summarizer
```

Role:

* Execute approved summarization plans
* Reduce context safely
* Preserve constraints and decisions

The summarizer never decides what to summarize.

---

### Risk Sentinel

```text
/agent use risk-sentinel
```

Role:

* Analyze historical logs
* Detect degradation or drift
* Report systemic risk

The risk sentinel never enforces or modifies context.

---

## 🔁 Canonical Governance Cycle

This is the **standard execution loop**. All demonstrations and validations should follow this order.

---

### Step 1 — Audit Context

```text
/agent use context-auditor
Audit the active context and report budget usage.
```

Output:

* Category-wise context usage
* Budget status

---

### Step 2 — Decide Enforcement

```text
/agent use budget-enforcer
Evaluate the audit results and decide enforcement status.
```

Possible outcomes:

* Allow
* Warn
* Block

Decisions are logged to `pruning-decisions.md`.

---

### Step 3 — Execute Summarization (If Approved)

```text
/agent use summarizer
Execute the approved summarization plan.
```

If no approval exists, the agent must refuse.

---

### Step 4 — Assess System Health

```text
/agent use risk-sentinel
Analyze recent logs and assess context health.
```

---

## 🧰 MCP Usage Guidelines (If Enabled)

If any agent uses MCP tools:

* MCP trust must be established explicitly
* MCP calls only occur during agent turns
* MCP is never invoked from hooks
* All MCP events are logged

Check MCP status:

```text
/mcp
```

Verify that all MCP events appear in `mcp-events.md`.

---

## 📂 Logs and Evidence

ContextBudget treats logs as first-class outputs.

| Log File             | Purpose               |
| -------------------- | --------------------- |
| context-snapshots.md | Context measurements  |
| pruning-decisions.md | Enforcement decisions |
| summarization-log.md | Summarization actions |
| risk-events.md       | Detected risks        |
| mcp-events.md        | MCP trust and usage   |

All logs are append-only and auditable.

---

## 🚨 Common Failure Modes

### Unauthorized Agent Action

Expected behavior:

* Explicit refusal

Operator response:

* Stop execution
* Review logs

---

### Context Mutation Without Enforcement

This indicates a governance violation and must be treated as a system failure.

---

### MCP Invocation Without Trust

Expected behavior:

* Invocation blocked
* Trust state logged

---

## 🧪 Validation Reference

After completing operational steps, validate system behavior using:

* **[TESTING.md](./TESTING.md)** — Agent-boundary and governance validation scenarios

All tests should pass before declaring the system healthy.

---

## 🧠 Operational Principles

* Scripts are authority
* Natural language is interface
* Agents never self-escalate
* Hooks never invoke tools
* Governance precedes intelligence

---

## ✅ Definition of System Health

ContextBudget is healthy when:

* Context usage is visible and bounded
* Enforcement decisions are explainable
* Agents respect lifecycle and authority
* Logs fully explain system behavior
* Repeated runs produce consistent results

---

## 🔚 End of Runbook

This runbook is intentionally strict.

ContextBudget is designed to be **operated, audited, and verified**, not improvised.
