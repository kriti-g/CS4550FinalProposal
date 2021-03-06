# CS4550FinalProposal - HTML Location Test

Testing using the standard HTML JavaScript navigator to fetch the users location,
and calculating the distance between users.


## What we tried:
Used the standard JavaScript navigator to request location from user. This gives us the latitude and longitude. When we have multiple coordinates, we can use the spherical law of cosines to calculate the distance between the two coordinates (as the crow flies).

## What was the result:
Success, the JavaScript can successfully get the coordinates, and Elixir can do math.
![Accuracy Verification](./Testing_Screenshots/Accuracy_Verification.png)

![Test1 - Same Location](./Testing_Screenshots/Test1-Same_Location.png)

![Test2 - Different Locations](./Testing_Screenshots/Test2-Different_Location.png)

## What we learned:
Getting the distance is relatively easy, as it is easy to get a user's location using JavaScript.
