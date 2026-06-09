# Software Design Process

## Overview

The software design process is a structured sequence of phases that transforms a business need into a deployable system. Each phase builds on the outputs of the previous one — but critically, each phase also feeds back into the layers above and below it. The process is not a rigid waterfall; it is an iterative cycle where discoveries at any stage can refine earlier decisions.

**Core Mindset:** "We use each step to refine the layers above and below it" — not "We finish step X and never look back."

---

## Phase Sequence with Feedback Loops

```
1. Business Requirements
        ↓ ↑
2. Problem Statement & Current State Analysis
        ↓ ↑
3. High-Level Architecture (System Design)
        ↓ ↑  ←──── feedback from Step 5 (Technical Design)
4. Functional Design
        ↓ ↑  ←──── feedback from Step 7 (Testing)
5. Technical Design (Detailed Design)
        ↓ ↑
6. Implementation
        ↓ ↑
7. Testing & Validation
        ↓ ↑
8. Deployment & Operations
```

**Critical Feedback Loops:**
- Technical Design (5) often uncovers constraints that force changes to High-Level Architecture (3)
- Testing (7) can reveal flaws in Functional Design (4)
- Implementation (6) may surface edge cases requiring revisits to Technical Design (5)
- For distributed systems, heavy database indexing, or multi-threaded processing: pay extra attention to the loop between Architecture (3) and Technical Design (5)

---

## 1. Business Requirements

**Purpose:** Define the *Why* and the *What*.

**Outputs:**
- Business goals and objectives
- Stakeholder identification
- Success metrics (KPIs) — how will you measure if this software actually succeeded? (e.g., "Reduces processing time by 40%", "Supports 1,000+ test cases with < 5 min overhead")
- Constraints (budget, timeline, regulatory)
- Scope boundaries (in-scope / out-of-scope)

**Key Questions:**
- What problem are we solving?
- Who benefits?
- How do we measure success?

---

## 2. Problem Statement & Current State Analysis

**Purpose:** Articulate the gap between the current state and the desired state.

**Outputs:**
- Problem statement
- Current state description (existing tools, workflows, pain points)
- Pain points with root causes
- Gap analysis
- Assumptions and risks
- Constraint mapping — identify what you *cannot* change (legacy databases, strict compliance/licensing boundaries, tight budget limits) before designing the future state

**Key Questions:**
- What is broken or insufficient today?
- Why can't we solve this with what we already have?
- What are the biggest pain points?
- What are the hard constraints we must design around?

---

## 3. High-Level Architecture (System Design)

**Purpose:** Define the system structure, boundaries, and major components at a conceptual level.

**Outputs:**
- System context diagram (how the system fits in the broader ecosystem)
- Component/microservice decomposition
- Technology stack decisions
- Integration points with external systems
- Non-functional requirements (scalability, availability, security)
- Communication patterns (sync vs async, REST vs gRPC vs messaging)
- Cross-cutting concerns strategy — security, data privacy, scalability, and observability (metrics, logging, tracing) defined here, not deferred

**Key Questions:**
- What are the major building blocks?
- How do they communicate?
- What are the deployment constraints?
- How do we handle security, observability, and data privacy across all services?

---

## 4. Functional Design

**Purpose:** Define *what* each component does — its behavior, contracts, data, and workflows — without specifying *how* it is implemented internally.

**Outputs:**
- Functional requirements per component (prioritized: Must / Should / Nice-to-have)
- Data models (entities, relationships, key fields)
- API contracts (endpoints, request/response schemas)
- Workflow diagrams (sequence diagrams, flowcharts)
- Business rules and validation logic
- User-facing behavior descriptions
- Versioning and lifecycle rules
- Edge case and failure mode mapping — don't just design the happy path; define how the system behaves when an API times out, a database connection drops, or a user enters invalid data

**Key Questions:**
- What does each service do?
- What data does it own?
- What APIs does it expose?
- What workflows does it orchestrate?
- What are the input/output contracts between services?
- What happens when things go wrong? (timeouts, bad input, partial failures)

---

## 5. Technical Design (Detailed Design)

**Purpose:** Define *how* each component is implemented internally — algorithms, code structure, infrastructure specifics.

**Outputs:**
- Class diagrams / module structure
- Algorithm design and pseudocode
- Database schema DDL (indexes, constraints, partitioning strategy)
- Infrastructure design (container specs, networking, storage)
- Error handling and retry strategies
- Caching strategy
- Security implementation (auth flows, encryption, secrets management)
- Performance design (connection pooling, batching, pagination)
- CI/CD pipeline design
- Monitoring and alerting implementation
- Proof of Concept (PoC) spikes — if using a new framework or complex approach (e.g., multi-threaded processing, novel data pipeline), write throwaway code here to validate assumptions before full implementation

**Key Questions:**
- How is each API endpoint implemented?
- What are the exact database queries?
- How do we handle failures and edge cases?
- What is the deployment topology?
- Have we validated risky technical assumptions with a PoC?

---

## 6. Implementation

**Purpose:** Write production-ready, clean code.

**Outputs:**
- Source code (services, tests, migrations)
- Infrastructure-as-code (Terraform, Helm charts, Docker configs)
- CI/CD pipelines
- Documentation (README, runbooks)

**Practice: Continuous Review**
- Don't wait until the end of implementation to get feedback
- Use CI pipelines and incremental code reviews throughout
- Write unit tests and integration test frameworks alongside implementation (shift-left testing)

---

## 7. Testing & Validation

**Purpose:** Verify the system meets functional and non-functional requirements.

**Outputs:**
- End-to-end (E2E) validation
- Performance/load tests
- Security testing results
- User acceptance testing (UAT) sign-off
- Regression test suites

**Practice: Shift-Left Testing**
- Unit tests and integration tests should be written alongside Step 6 (Implementation), not deferred to this step
- Step 7 focuses on E2E validation, load testing, and UAT — the tests that require the full system running together

---

## 8. Deployment & Operations

**Purpose:** Release the system and maintain it in production.

**Outputs:**
- Deployment runbooks
- Monitoring dashboards
- Alerting rules
- Incident response procedures
- Capacity planning
- Post-launch review

**Practice: Rollback & Maintenance Strategy**
- Define how to deploy without downtime (e.g., blue-green deployments, canary releases)
- Plan for self-healing and alerting — if something breaks at 2:00 AM, how does the system respond?
- Define rollback procedures before the first production deploy

---

## Relationship Between Phases

| From | To | Relationship |
|------|----|--------------|
| Business Requirements | Problem Statement | Requirements define what success looks like; problem statement explains the gap |
| Problem Statement | Architecture | Pain points and constraints drive architectural decisions |
| Architecture | Functional Design | Architecture defines boundaries; functional design fills in behavior |
| Functional Design | Technical Design | Functional defines *what*; technical defines *how* |
| Technical Design | Implementation | Technical design is the blueprint; implementation is the build |
| Technical Design | Architecture | Technical constraints may force architectural changes (feedback loop) |
| Testing | Functional Design | Test failures may reveal gaps in functional spec (feedback loop) |

---

## Common Mistakes

| Mistake | Consequence |
|---------|-------------|
| Skipping problem statement | Building a solution that doesn't address the real pain |
| Jumping from architecture to implementation | Missing API contracts, unclear data ownership, integration chaos |
| Mixing functional and technical design | Over-specifying too early, limiting implementation flexibility |
| No versioning/lifecycle in functional design | Breaking changes with no migration path |
| Treating phases as strictly waterfall | Rework piles up at the end instead of being caught early |
| Only designing the happy path | System breaks in production on first unexpected input |
| No PoC for risky technical assumptions | Weeks of refactoring when assumptions prove wrong |
| Deferring all testing to the end | Late discovery of fundamental design flaws |
| No rollback strategy | Stuck with a broken deploy and no way back |

---

## Key Principles

1. **Iterate, don't waterfall** — each phase refines the layers above and below it
2. **Validate early** — PoC spikes during Technical Design save weeks of refactoring during Implementation
3. **Shift left** — testing starts during Implementation, not after it
4. **Design for failure** — edge cases and failure modes are first-class design concerns, not afterthoughts
5. **Define constraints first** — know what you cannot change before designing what you will build
6. **Measure success** — KPIs defined in Step 1 are validated in Steps 7 and 8
7. **Each phase is complete enough to inform the next without over-constraining it**
