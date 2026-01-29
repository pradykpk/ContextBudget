# TEST: Enforce Budget Rules

## Expected Agent
budget-enforcer

## Expected Behavior
- Interpret audit output
- Decide allow / warn / block
- Do NOT modify context

## Expected Logs
- pruning-decisions.md appended

## Prompt
Based on the latest audit results, decide whether summarization is allowed.
Log the enforcement decision.

