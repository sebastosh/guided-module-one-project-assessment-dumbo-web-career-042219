Module One Final Project - Models, Stories, Relationships
========================

#### Models

Writers, Open Calls

Joining Model: Applications

#### Stories

Writer
* As a writer, I want to get a list of all the open calls by theme. (**Read**)
* As a writer, I want to be able to choose an open call and submit an application. (**Create**)
* As a writer, I should be able to edit my application. (**Update**)
* As a writer, I want to be able to delete my application. (**Delete**)

Open Call
* An open call, has a theme and a deadline. (**Create**)
* As an open call, I want to be able to view all the submitted applications by writers. (**Read**)
* As an open call, I want to randomly select a winning submission(too cheap to pay a jury!).  (**Update**)
* As an open call, I am active until I select a winner, then I am closed. (**Update**)


#### Relationships

Writers:

* Has many applications.
* Has many open calls through applications

Open Calls:

* Has many applications.
* Has many writers through applications.

Applications:

* Belongs to writers.
* Belongs to open calls.
