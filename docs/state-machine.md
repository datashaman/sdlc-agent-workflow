# State Machine

## Statuses

- `draft`
- `ready-for-architecture-review`
- `needs-product-clarification`
- `architecture-planning`
- `architecture-approved`
- `ready-for-implementation`
- `in-implementation`
- `technical-review`
- `technical-changes-requested`
- `product-acceptance`
- `product-changes-requested`
- `accepted`
- `merged-closed`

## Transitions

```text
draft -> ready-for-architecture-review
ready-for-architecture-review -> needs-product-clarification
needs-product-clarification -> ready-for-architecture-review
ready-for-architecture-review -> architecture-planning
architecture-planning -> architecture-approved
architecture-approved -> ready-for-implementation
ready-for-implementation -> in-implementation
in-implementation -> technical-review
technical-review -> technical-changes-requested
technical-changes-requested -> in-implementation
technical-review -> product-acceptance
product-acceptance -> product-changes-requested
product-changes-requested -> in-implementation
product-acceptance -> accepted
accepted -> merged-closed
```

## Event Triggers

- PO submits product intent: `draft`
- Issue and PR are created: `ready-for-architecture-review`
- Architect Agent posts clarification questions: `needs-product-clarification`
- Product direction is updated: `ready-for-architecture-review`
- Scope is feasible and clear: `architecture-planning`
- Architect approves direction: `architecture-approved`
- Tasks are ready: `ready-for-implementation`
- Implementation starts: `in-implementation`
- Implementation is ready for review: `technical-review`
- Architect rejects implementation: `technical-changes-requested`
- Architect approves implementation: `product-acceptance`
- PO rejects delivered behavior: `product-changes-requested`
- PO approves delivered behavior: `accepted`
- Work is merged or closed: `merged-closed`

