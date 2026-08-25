# Decisions
## Can two or more mechanics work on the same repair?
### Assumption:
Each repair has one mechanic for it. 
### If the answer is different:
The relationship between the table "repairs" and "mechanics" would become many to many. The "mechanic_id" column would be removed from repairs and a new entity would be needed to connect mechanics with repairs, like the "repairs", "service" and "repair_services" tables relationship.

## Does the customer approve or reject the full repair, or can they approve individual services?
### Assumption:
The customer approves or rejects all the proposed repair as one.
### If the answer is different:
The approval decision would need to belong to each "repair_service" instead of the "repair". Each repair service would need an approval status so that every proposed service could be independent.

## Does the system need to record the current owner of a bike?
###Assumption:
The model only know which customer brought the bike. Even if the bike is not permanently from one customer, the bike's history will show the current owner at the repair time.
### If the answer is different:
The model would need a relationship between "customers" and "bikes" to know the currently owner of each bike. The model will also need a entity of the bike ownership to preserve the ownership history and know which owner brought the bike in a specific time.
