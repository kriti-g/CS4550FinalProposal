# CS4550 Final Project Proposal

Our team for the final project is composed of Seokju Yun, Kriti Gurubacharya,
Neil Resnik, and Benjamin Wakefield. We are proposing a web app in which a group
of roommates may manage their chore assignments and rotations in a more
efficient manner, as well as be reminded through text of their own appointed
chores. Furthermore, the app would also know when a chore may require more than
one person, and would prompt users to complete it if two or more of the
roommates are logged in and at home at the same time.

#### API

The main API we have chosen to use is the Twilio SMS API so that we can send
texts to users when necessary - e.g. to notify them that the chore rotation has
changed and they have a new chore to take care of, to remind them to complete a
chore before a certain time, etc.

#### Real-time Behaviour

The real-time behaviour of our app is centred around making sure that any
status updates are immediately viewable to any roommate in the same group as
the update. Any new chore/user additions or edits should be available
in real-time. For example, a roommate may finish doing the groceries and mark
it off, after which all roommates will be able to see the following:
- That the roommate in question has finished the chore.
- Which roommate is assigned to that chore next.
- The tentative date range during which this chore has to be completed again.

#### Database

The postgres DB linked to the web app will have to store a number of things as
well as users - described below.

##### A User
An object representing a user of the web app. This should contain standard user
information including an email, a name, and a password. More specific to our API,
a user should also include their phone number.

##### A Roommate Group
An object linking multiple users together in the same
group. A group may have many users, but a user may not have many groups, as the
assumption is that a user only lives in one home at a time, or at the very least
only has one home in which they are an integral part of keeping the place running.
Tentatively, a group may have many users, many chores, a home address, and a name.

##### A Chore
An object representing a chore. A chore belongs to a Roommate Group and should
have a name, information on what the chore is, when it should be completed by,
who should be completing it, as well as how often the responsibility for it should
rotate. For example, a roommate may be in charge of the dishes for three days in
a row before it becomes another roommate's responsibility. This person should be
able to mark the chore off three times (and have the expected time of completion
change accordingly) before it is reassigned to someone else in their group.

A chore should be linked to a user through some intermediate object
(e.g. a Responsibility) such that a chore requiring that more than one user be
involved in completing it can exist (prevent a many-to-many relationship.)

##### A Responsibility
A responsibility should contain the current information for a given link between
a user and a chore. For example, using the same aforementioned dish-washing
example, the Responsibility should be the object containing the information for
how many times the user has completed this chore on their rotation as well as
the date range for when it should next be completed. Thus, the responsibility
object exists to bridge the many-to-many relationship between chores and users
but also to remove information from the chore that is not directly linked to it.

#### Additional Feature
Seeing as a chore can be assigned to more than one person at once, the app will
try to prompt the users involved to complete it if it perceives them as being
"available" to do it. Using the HTML Location API, the app will check if both
users are logged in, close to each other and to their home address. It may then
check if it is a reasonable time to be doing chores (e.g. before 10pm and after
7am) and prompt one or both of them to meet their roommate and get it done.

#### Expected userbase and workflows


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
