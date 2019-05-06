Module One Final Project - Models, Stories, Relationships
========================

#### Models

Writers, Publications, Open Calls

#### Stories

Writer
* As a writer, I want to get a list of all the open calls by publications. (**Read**)
* As a writer, I want to get a list of all the open calls by theme. (**Read**)
* As a writer, I want to be able to choose an open call and submit work. (**Create**)
* As a writer, I want to get all the past selected works from a specific organization. (**Read**)
* As a writer, I should be able to edit my submission before the deadline. (**Update**)
* As a writer, I want to be able to delete my submission before the deadline. (**Delete**)

Publication
* As a publication, I want to get an open calls with a theme and a deadline. (**Read**)
* As a publication, I want to be able to view all the submissions by writers for a specific open call. (**Read**)
* As a publication, when an open call deadline is passed, I want to randomly select (we're too cheap to pay a jury!) a winning submission.
* As a publication, I want to get all the past selected works from a specific organization. (**Read**)
* As a publication, I should be able to edit the guidelines of the open call before the deadline. (**Update**)
* As a publication, I want to be able to delete my open call before the deadline. (**Delete**)

Open Call
* As an open call, I am active until the deadline, then I am closed.


#### Relationships

Writers:

* Has many open calls.
* Has many publications through open calls.

Publications:

* Has many open calls.
* Has many writers through open calls.

Open Calls:

* Belongs to writers.
* Belongs to publications.


