# CS4550 Final Project Proposal

Our team for the final project is composed of Seokju Yun, Kriti Gurubacharya,
Neil Resnik, and Benjamin Wakefield. We are proposing a web app in which a group
of roommates may manage their chore assignments and rotations in a more
efficient manner, as well as be reminded through text of their own appointed
chores. Furthermore, the app would also know when a chore may require more than
one person, and would prompt users to complete it if two or more of the
roommates are logged in and at home at the same time.

The main API we have chosen to use is the Twilio SMS API so that we can send
automated texts to users when necessary - i.e. to remind them to complete a chore.
In order to ease our use of this API, we are looking at a Twilio API Elixir
client, ExTwilio.

The real-time behaviour of our app is centred around making sure that any
status updates are immediately viewable to any roommate in the same group as
the update. For example, a roommate may finish doing the groceries and mark
it off, after which all roommates will be able to see the following:
- That the roommate in question has finished the chore.
- Which roommate is assigned to that chore next.
- The tentative date range during which this chore has to be completed again.

The postgres DB linked to the web app will have to store a number of things
aside from users. These include:

##### A Roommate Group
An object linking multiple users together in the same
group. A group may have many users, but a user may not have many groups, as the
assumption is that a user only lives in one home at a time, or at the very least
only has one home in which they are an integral part of keeping the place running.
Tentatively, a group may have many users, many chores, a home address, and a name.

##### A Chore
An object representing a chore. A chore belongs to a Roommate Group 


- Who’s on your team?
- What’s your project idea?
- What API do you plan to use?
- What realtime behavior are you planning?
- What persistent state other than users will you be storing in a postgres DB?
- What “something neat” thing are you going to do?
- For each experiment:
What did you try?
What was the result?
What did you learn?
- What kinds of users do you expect to have use your app?
- For each kind of users, what is their most common workflow / user story?
