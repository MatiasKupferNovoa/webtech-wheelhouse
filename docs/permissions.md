# Permissions

## Customers

The owner and counter can read, create and edit customers.
Only the owner can delete them. Mechanics have no access.

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| index | Yes, all customers | Yes, all customers | No |
| show | Yes | Yes | No |
| new | Yes | Yes | No |
| create | Yes | Yes | No |
| edit | Yes | Yes | No |
| update | Yes | Yes | No |
| destroy | Yes | No | No |

## Bikes

The owner and counter can read, create and edit bikes.
Only the owner can delete them. Mechanics have no access.

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| index | Yes, all bikes | Yes, all bikes | No |
| show | Yes | Yes | No |
| new | Yes | Yes | No |
| create | Yes | Yes | No |
| edit | Yes | Yes | No |
| update | Yes | Yes | No |
| destroy | Yes | No | No |

## Repairs

The owner and counter can read all repairs.
Mechanics can only read repairs assigned to their staff member.
A mechanic account without a staff member sees no repairs.

A repair is handed back when its status is picked_up.
Only the owner can edit a repair in that state.

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| index | All repairs | All repairs | Only assigned repairs |
| show | All repairs | All repairs | Only assigned repairs |
| new | Yes | Yes | No |
| create | Yes | Yes | No |
| edit | Yes | If not handed back | If assigned and not handed back |
| update | Yes | If not handed back | If assigned and not handed back |
| destroy | Yes | No | No |
| destroy_photo | Yes | If not handed back | No |

When editing is allowed, the owner and counter can change all the
repair form fields, including the mechanic, dates, services and prices.

Mechanics can only change the status and diagnosis, and add intake photos.

The account that received the repair comes from the session when
the repair is created. It cannot be changed through the form.

## Services

Everyone can read the services, including visitors without a session.
Only the owner can create, edit and delete services.

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| index | Yes, all services | Yes, all services | Yes, all services |
| show | Yes | Yes | Yes |
| new | Yes | No | No |
| create | Yes | No | No |
| edit | Yes | No | No |
| update | Yes | No | No |
| destroy | Yes | No | No |

## Staff

All signed-in accounts can read the staff.
Only the owner can create, edit and delete staff members.

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| index | Yes, all staff | Yes, all staff | Yes, all staff |
| show | Yes | Yes | Yes |
| new | Yes | No | No |
| create | Yes | No | No |
| edit | Yes | No | No |
| update | Yes | No | No |
| destroy | Yes | No | No |

## Informational pages

Home, Visit and About require a session.

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| home | Yes | Yes | Yes |
| visit | Yes | Yes | Yes |
| about | Yes | Yes | Yes |

## Accounts

There are no account listing, editing or deletion pages.
New registrations receive the default mechanic role and its permissions.
Authentication exceptions are documented in decisions.md.

## API

The API retains its existing token authentication and permissions,
documented in api.md.