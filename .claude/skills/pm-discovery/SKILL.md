---
name: pm-discovery
description: Create a Product Requirements Document (PRD) for a given goal. Use when you need to analyze a codebase and produce structured requirements.
---

# PM Discovery

Create a `prd.md` file in the repository root containing a Product Requirements Document.

## Steps

1. Read the goal provided in the user's message
2. Create a file called `prd.md` in the repository root with the following content:

```markdown
# PRD: [goal summary]

## Problem
[One sentence restating the goal]

## Success Criteria
- [ ] [At least one verifiable criterion]

## Scope

### In Scope
- [What to build]

### Out of Scope
- [What not to build]

## Requirements
[Functional requirements]

## Edge Cases
- [At least one edge case]
```
