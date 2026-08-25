# User stories

## Roles
1. Owner
2. Mechanic
3. Counter staff
4. Customer

## User stories

### 1. Recieve a bike:
As a counter staff, i want to register a customer and the bike they bring, so that the shop can identify the bike and contact the customer during the repair.

#### Acceptance criteria:
- The screen show the customer name and phone number, the bike's model, and its serial number.
-  The repair has a promised completion date.
- The bike can't be confused from another bike due its serial number.

### 2. Check if a bike is ready:
As a counter staff, i want to see current status of the bikes in the shop, so that i can answer a customer who ask if their bike is ready.

#### Acceptance criteria:
- Each repair shows its current status.
- Each repair shows the promised completion date.
- The screen shows that there are no active repairs if there are no one in repair.

### 3. Find the previous repairs of a bike:
As a counter staff, i want to see the repair history of a bike so that i can tell what work has previously done to that bike.

### 4. Record arrival photos:
As a counter staff, i want to record photos of the bike when it arrive, so that the shop has evidence of its condition before any works.

### 5. See repairs that missed the promised date:
As an owner, i want to see repairs that are past their promised completion date, so that i can act before the customer has to call and complain.

#### Acceptance criteria:
- Each late repair shows the bike and its promised date
- Late repairs can be distinguised from repairs that are still in the promised date.
- If no repairs are late, the screen show a message that there are no overdue repairs.

### 6. Charge a different price for a repair:
As an owner, i want to record a price for a service that can differ from the normal list price, so that the shop can charge less when there is a reason.

### 7. Preserve historical repair prices:
As an owner, i want to complete repairs to keep the prices that applied to them, so that changing the service list in January does not change the amounts recorded for earlier repairs.

### 8. View public service prices:
As a customer, i want to see the shop's service list and current prices online, so that i can know what common repairs cost without calling to the shop.

#### Acceptance criteria:
- The screen shows the services offered by the shop.
- Each service show its current price.
- The screen does not expose customer information.

### 9. Collect a bike without approving the repair:
As a customer, i want to be able to collect my bike without the proposed repair when i reject it, so that i don't need to pay for works i did not approve.

### 10. Pick up a completed bike:
As a customer, i want to receive my bike after its repair is finished, so that the repair process can be completed.

### 11. Big story. Make the bike repair:
As a mechanic, i want to manage all the work required for a bike, so that can be repaired correctly and returned to the customer.

### 12. Split 1. Diagnose the bike:
As a mechanic, i want to record a detailed diagnosis of the bike, so that the shop knows what work must be performed and what it will cost.
### 13. Split 2. Record the required services:
As a mechanic, i want to record the services that the bike needs, so that the shop knows what work need to be performed and the cost of it.
### 14. Split 3. Mark the repair as ready:
As a mechanic, i want to mark a repair as ready when the work is completed, so that the counter staff can tell the customer that the bike is ready.