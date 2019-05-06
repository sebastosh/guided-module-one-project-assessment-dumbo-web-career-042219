Module One Final Project - Models, Stories, Relationships
========================

#### Models

Writers, Open Calls 

Joining Model: Applications

#### Stories

Writer
* As a writer, I want to get a list of all the open calls by theme. (**Read**)
* As a writer, I want to be able to choose an open call and submit an application. (**Create**)
* As a writer, I should be able to edit my application before the deadline. (**Update**)
* As a writer, I want to be able to delete my application before the deadline. (**Delete**)

Open Call
* As an open call, I want to launch an application with a theme and a deadline. (**Create**)
* As an open call, I want to be able to view all the submitted applications by writers. (**Read**)
* As an open call, when an application deadline is passed, I want to randomly select a winning submission(too cheap to pay a jury!).  (**Update**)
* As an open call, I am active until the deadline, then I am closed. (**Update**)


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
