# User stories

## Roles
1. Owner
2. Mechanic
3. Counter staff
4. Customer

## User stories

### Recieve a bike:
As a counter staff, i want to register a customer and the bike they bring, so that the shop can identify the bike and contact the customer during the repair.

#### Acceptance criteria:
- The screen show the customer name and phone number, the bike's model, and its serial number.
-  The repair has a promised completion date.
- The bike can't be confused from another bike due its serial number.

### Check if a bike is ready:
As a counter staff, i want to see current status of the bikes in the shop, so that i can answer a customer who ask if their bike is ready.

#### Acceptance criteria:
- Each repair shows its current status.
- Each repair shows the promised completion date.
- The screen shows that there are no active repairs if there are no one in repair.

### Find the previous repairs of a bike:
As a counter staff, i want to see the repair history of a bike so that i can tell what work has previously done to that bike.

### Record arrival photos:
As a counter staff, i want to record photos of the bike when it arrive, so that the shop has evidence of its condition before any works.

### Record a diagnostic:
As a mechanic, i want to write a detailed diagnosis of what is wrong whit a bike, so that the problem is understandable to the rest of the shop.

#### Acceptance criteria:
- The repair screen shows diagnosis as text.
- The diagnosis remains visible while doing the repair.
- When theres nothing to show, the screen shows that there are no diagnosis yet if the bike has not been diagnosed yet.

### See repairs that missed the promised date:
As an owner, i want to see rapirs that are past their promised completion date, so that i can act before the customer has to call and complain.

### Charge a different price for a repair:
As an owner, i want to record a price for a service that can differ from the normal list price, so that the shop can charge less when there is a reason.

### Preserve historical repair prices:
As an owner, i want to complete repairs to keep the prices that applied to them, so that changing the service list in January does not change the amounts recorded for earlier repairs.

### View public service prices
As a customer, i want to see the shop's service list and current prices online, so that i can know what common repairs cost without calling to the shop.

#### Acceptance criteria:
- The screen shows the services offered by the shop.
- Each service show its current price.
- The screen does not expose customer information.

### 11. Collect a bike without approving the repair:
As a customer, i want to be able to collect my bike without the proposed repair when i reject it, so that i don't need to pay for works i did not approve.

### Big story. Make the bike repair:
As a mechanic, i want to manage all the work required for a bike, so that can be repaired correctly and returned to the customer.

### Split 1. Diagnose the bike:
As a mechanic, i want to record a detailed diagnosis of the bike, so that the shop knows what work must be performed and what it will cost.
### Split 2. Record the required services:
As a mechanic, i want to record the services that the bike needs, so that the shop knows what work need to be performed and the cost of it.
### Split 3. Mark the repair as ready:
As a mechanic, i want to mark a repair as ready when the work is completed, so that the counter staff can tell the customer that the bike is ready. 
