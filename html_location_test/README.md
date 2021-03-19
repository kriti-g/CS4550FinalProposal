# CS4550 Final Project Proposal

Our team for the final project is composed of Seokju Yun, Kriti Gurubacharya,
Neil Resnik, and Benjamin Wakefield. We are proposing a web app in which a group
of roommates may manage their chore assignments and rotations in a more
efficient manner, as well as be reminded through text (using a texting api) of
their own appointed chores. Furthermore, the app would also know when a chore
may require more than one person, and would prompt users to complete it if two
or more of the roommates are logged in and at home at the same time (a check
which would happen using a location api).

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
Tentatively, a group may have many users, many chores, a home address, a name,
and a rotation order.

##### A Chore
An object representing a chore. A chore belongs to a Roommate Group and should
have a name, information on what the chore is, when it should be completed by,
who should be completing it, as well as how often the responsibility for it should
rotate. For example, a roommate may be in charge of the dishes for three days in
a row before it becomes another roommate's responsibility. This person should be
able to mark the chore off three times (and have the expected time of completion
change accordingly) before it is reassigned to someone else in their group.
Tentative example of a chore below, where the unit for rotation is number of
completions, and the unit for frequency is days.

```
{
  name: "Dishes",
  desc: "Wash all the dirty dishes and return the dry dishes to their proper place.",
  rotation: 3,
  frequency: 1,
  responsibility_id: 0,
  group_id: 0
}
```

A chore should be linked to a user through some intermediate object
(here a Responsibility) such that a chore requiring that more than one user be
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
The expected userbase for this app is any group of roommates, particularly groups
of housemates who may not be very close, groups who cannot/do not communicate well
or regularly, or groups with problem housemates who are prone to forgetting
responsibilities. This opens up the age group to all ages of users who are able
to take a role in chores (so excluding elderly or very young housemates).
The app would allow them to divide chores in an equitable manner and not feel
obliged to nag or nose into their housemates' affairs, as all information is laid
out for them in the app and the app will take care of notifications.

Though the role of all users on this web app is the same (they are housemates
where no one user has greater privileges than another in the same group),
there are multiple possible workflows in this web app.

##### Group creation
- Users Alice, Bob, Carol and Dave have decided to streamline their chores
through this web application.
- Dave takes the lead and registers an account, inputting their name, email,
phone number, and chosen password.
- Dave then creates a new group "Nice Home," inputting this name, and their
address.
- Dave is assigned to this group, and is no longer able to create new groups.
- Dave receives a link to the group in question, which he sends to each of his
roommates.

##### Group Joining
- Carol receives the link from Dave. She clicks it.
- She is prompted to register herself as a user, which she does. She is assigned
to the group upon registration. She cannot create a new group unless she leaves
this one.
- Carol is able to access the join link and send it to her housemates again if needed.
- As everyone joins the group, they are added to its rotation order. This ends up
as Dave -> Carol -> Bob -> Alice.

##### Chore creation
- Carol decides that the kitchen floor needs to be mopped every day.
- She creates a new chore called "Mopping kitchen floor," with a desc
"Thoroughly mop the kitchen floor using the swiffer," a rotation of 1 and
a frequency of 1.
- She assigns the first rotation to Alice by adding her name during the creation
process.
- Upon hitting "Create" the chore is now visible to the entire group's on their
main page.

##### Chore completion
- Alice receives a text message informing her that she has been assigned to
mopping the floor, to be completed today.
- Alice decides to do her chore.
- Upon finishing with the mopping, she logs into the application and checks
"Complete" on the "Mopping kitchen floor" chore that she can find on her list of
chores.
- Seeing as the rotation for this chore is 1, the chore is removed from Alice's
list as she is no longer assigned to it, and is instead reassigned to Dave, the
next user in the group's chore rotation order.
- Dave receives a text message informing him that he has been assigned to mopping
the floor, to be completed by tomorrow.

##### Chore deletion
- Bob buys a robot floor-cleaner for the kitchen floor. He sees that there's no
more need for him or any of his housemates to be mopping the floor anymore.
- Bob logs in and opens the general chore list on his group page instead of his
personal assigned chore list.
- He clicks "Edit" on "Mopping kitchen floor" and then clicks the delete button.
- The application prompts him to check if he's sure, he clicks yes.
- Dave receives a text message informing him that he no longer has to complete
this chore as it has been deleted.
- When Alice logs in and checks the group chore page, she can no longer see the
chore on the page.

##### Group Leaving
- Carol gets a new job in a different city and moves out.
- She logs in to the web app and navigates to her group page.
- On the page, she clicks the "Leave Group" button, is prompted to check if
she's sure, clicks yes.
- All chores assigned to Carol are reassigned to the next member in the
group rotation, Bob.
- Bob receives a text message informing him of his new chores.

#### Experiment 1 - Accessing the Twilio API from the Phoenix Server and sending a text message.



#### Experiment 2 - Using the HTML Location API to find the distance between two users
