# CommonConsensus v2 Documentation

## Getting up and running

There are two components to **CommonConsensus**: the *game client*, a Flash "swif" file, `CommonConsenus.swf`, and the *web server*, a collection of Python files using the [Google App Engine] (http://appengine.google.com) web application framework.

To run the server, you will need:

  - Python 2.7
  - Google App Engine SDK
  - Git, optionally, if you want to push changes back to GitHub.


If you plan on modifying the *client* binary (students in Henry's class don't have to), you will need to compile [Adobe Flex code](http://www.adobe.com/products/flex/).  Flex is a combination of ActionScript 3 and MXML files.  These are proprietary formats but ActionScript 3 is based on the same [EMCAScript](http://en.wikipedia.org/wiki/ECMAScript) standard as JavaScript, and MXML files are simply XML structures used to describe visual objects and widgets. 

The project is built using Flash Bulder 4 (previous versions were called *Flex* Builder).  You can obtain a trial version of this beta Eclipse-based IDE from [here](http://labs.adobe.com/technologies/flashbuilder4/).


### Obtaining the source


**CommonConsensus**\ is still in development stages, so I recommend that you obtain the latest code from the Git repository: 
    
    git clone git@github.com:commonsense/CommonConsensus.git

This will create a folder in your current directory with two subdirectories:

     commonconsensus/
                    /server
                    /client

From within the root of the repository, you can always obtain the latest version (called the "head") of the source code by typing:

    git pull

### Configuring and running the server

First, you'll need to configure your own Google App Engine account, and pick a `APP-NAME`, that will be hosted on `http://APP-NAME.appspot.com`.  

Move into the `server` directory (e.g., `cd commonconsensus/server`).  Edit the `app.yaml` file so it contains your `APP-NAME`.

You should be able to launch the Python server by running

    python dev_appserver.py .

If you are configured correctly, this will allow your files to be served on the local machine.  Check it out by opening this page in your browser:

\indent \url{http://localhost:8080}

You can login to the game with the username and password `test`, which are pre-populated in this development version of the client.

You can upload the files to Google App Engine to have them hosted on Google's infrastructure.  You can do this by opening the App Engine GUI, adding "an existing project" to the list by selecting CommonConsensus' `server` directory, and then clicking **Deploy**.

# Modifying CommonConsensus


## Editing the client

You should have Adobe Flash/Flex Builder installed or you can use the Flex compiler `mxmlc` but this does not come with an integrated, graphical developement environment.   Flex Builder is available both as a standalone program or as an Eclipse builder plugin.  Students can get a free license for the Professional addition from [here](https://freeriatools.adobe.com/).

Once you have it installed, click *File* $\rightarrow$ *Import* $\rightarrow$ *Flex Builder Project*, and then select the `game-client` directory.

Alternatively, if you have the `mxmlc` program installed (it will install with Flex Builder, but will not be in your default path), you can run the Makefile script to compile the Flash `swf` by typing `make`. 


# Future Directions

Several promising directions came out of a discussion with folks at SLB.
 
 - enlarge the answer panel
 - enlarge font for answers
 - sort answers by score/name
 - focus on the text entry automatically
 - different colors for changed answers (?)
 - remember who added the answers (for credit, blame)
 - better visualizations of results, or real time visualization of answer panels
 - report on server load
 - spell checking
 - shorten the answer phase (?)
 - clear lingering charts after game

## Open Problems to consider 

 1. What if the user wants to "pass" on the answer?  Should this be an option, is there another game or question they can advance to -- perhaps by spawning a single player mode.
 2. How to encourage social interactions?  Other ways for users to cultivate a digital identity and interact with other players.
 3. What is the ideal duration?
 4. How to handle questions with only one answer?

