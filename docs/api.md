# API v1

## Routes
| Method | Path | Token | Statuses |
|---|---|---|---|
| GET | /api/v1/services | No | 200 |
| GET | /api/v1/services/:id | No | 200, 404 |
| POST | /api/v1/services | Yes | 201, 400, 401, 422 |
| GET | /api/v1/repairs | Yes | 200, 400, 401 |
| GET | /api/v1/repairs/:id | Yes | 200, 401, 404 |

Token header: `Authorization: Bearer YOUR_TOKEN`.

## Service example
```
{
  "id": 1,
  "name": "Brake adjustment",
  "price": "20000.0",
  "repairs_count": 2
}
```

## Repair example
```
{
  "id": 1,
  "state": "received",
  "received_on": "2026-10-20",
  "promised_on": "2026-10-23",
  "picked_up_on": null,
  "bike": {
    "brand": "Trek",
    "model": "Marlin 5",
    "serial_number": "WH-001"
  },
  "customer": { "name": "Ana Morales" },
  "lines": [
    { "service": "Brake adjustment", "price_charged": "20000.0" }
  ],
  "total": "20000.0",
  "overdue": false,
  "customer_answer": "not_recorded"
}
```

## Repair collection example
```
[
  {
    "id": 1,
    "state": "received",
    "received_on": "2026-10-20",
    "promised_on": "2026-10-23",
    "picked_up_on": null,
    "bike": {
      "brand": "Trek",
      "model": "Marlin 5",
      "serial_number": "WH-001"
    },
    "customer": { "name": "Ana Morales" },
    "lines": [],
    "total": "0.0",
    "overdue": false,
    "customer_answer": "not_recorded"
  }
]
```

## Error example
```
{ "errors": ["Not found"] }
```

## Decisions
- Prices and totals are decimal strings in CLP to avoid floating-point conversion.
- Repairs omit foreign keys, customer phones, staff details, photos, diagnoses and internal timestamps because accounting does not need them.