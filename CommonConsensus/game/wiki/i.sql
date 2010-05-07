DELETE FROM wiki_references;
DELETE FROM revisions;
DELETE FROM pages;
DELETE FROM system;
DELETE FROM webs;
INSERT INTO webs (color, id, additional_style, max_upload_size, updated_at, allow_uploads, safe_mode, published, brackets_only, count_pages, created_at, address, name, markup, password) VALUES ('008B26', '1', NULL, '100', '2005-12-30 16:56:53', 'true', NULL, 'false', 'false', 'false', '2005-11-30 11:53:58', 'narrate', 'NarrateGame', 'textile', NULL);
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES (NULL, '1', '2005-11-30 20:27:00', '2005-11-30 20:27:00', 'ProblemsWithOMCS', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('1', 'AnonymousCoward', '2005-11-30 20:27:00', '18.250.6.38', '2005-11-30 20:27:00', '2005-11-30 20:27:00', '1', 'Talk about the potential problems of commonsense knowledge representation so we can improve on this iteration.');
COMMIT;
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES ('AnonymousCoward', '2', '2005-11-30 20:25:48', '2005-11-30 11:54:57', 'KnowledgeRepresentations', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('2', 'Dustin', '2005-11-30 11:54:57', '18.85.16.168', '2005-11-30 11:54:57', '2005-11-30 11:54:57', '2', 'Minsky lists a few realms of knowledge in "EM-6.1":http://web.media.mit.edu/~minsky/E6/eb6.html



h3. Spatial



Define which entities can be found in each *setting*?



h3. Social



People, agents, and inanimate objects -- how to threat them, what to expect from them, etc.



h3. Dominion



Is this really a subset of Social?  Minsky explains the "social" relam as a kind-of self-extension, not so much in terms of multiple people.   Dominion expresses ownership of objects, who owns what, how pocession is transferred.



h3.  Procedural



I see our goal system as working toward this -- a "script" with the opportunity to branch.

# what to do

# what not to do

# what to do when things go wrong





h3.  Conversational Language



A database of colloquialisms may be helpful.





h3. Cognitive



h3. Self-Knowledge

------------

h3. Adjective Clarification .

When users\' entries have an adjective in their description (tagged as *JJ*), we can issue a question asking them to classify their description. ');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('3', 'AnonymousCoward', '2005-11-30 20:25:48', '18.250.6.38', '2005-11-30 20:25:48', '2005-11-30 20:25:48', '2', 'Minsky lists a few realms of knowledge in "EM-6.1":http://web.media.mit.edu/~minsky/E6/eb6.html

# ProblemsWithOMCS

h3. Spatial



Define which entities can be found in each *setting*?



h3. Social



People, agents, and inanimate objects -- how to threat them, what to expect from them, etc.



h3. Dominion



Is this really a subset of Social?  Minsky explains the "social" relam as a kind-of self-extension, not so much in terms of multiple people.   Dominion expresses ownership of objects, who owns what, how pocession is transferred.



h3.  Procedural



I see our goal system as working toward this -- a "script" with the opportunity to branch.

# what to do

# what not to do

# what to do when things go wrong





h3.  Conversational Language



A database of colloquialisms may be helpful.





h3. Cognitive



h3. Self-Knowledge

------------

h3. Adjective Clarification .

When users\' entries have an adjective in their description (tagged as *JJ*), we can issue a question asking them to classify their description. ');
COMMIT;
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES ('Dustin', '3', '2005-11-30 20:13:11', '2005-11-30 11:55:45', 'TaggerBugs', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('4', 'Dustin', '2005-11-30 11:55:45', '18.85.16.168', '2005-11-30 11:55:45', '2005-11-30 11:55:45', '3', 'This tagger is somewhat of a POS :P  If you catch any errors, please post them here.

|_tagger_|_flour the pan_|
|*%{color:blue}Tree%*| VV DT VV |
|*%{color:blue}Brill (WSJ)%*| NN NN NN |
|*%{color:blue}Brill (BWN)%*| NN DT VBG |




p. *the/DT dog/NN bit/NN the/DT cat/NN*

|_tagger_|_The dog bit the cat_|
|*%{color:blue}Tree%*| DT NN NN DT NN |
|*%{color:blue}Brill (WSJ)%*| JJ NN NN NN NN |
|*%{color:blue}Brill (BWN)%*| DT NN NN DT NN |


look into Monty Lingua\'s correction for this


|_tagger_|_I went to the Rolling Stones concert with Bob today_|
|*%{color:blue}Tree%*| PP VVD TO DT NP NPS NN IN NP NN |
|*%{color:blue}Brill (WSJ)%*| JJ NN NN NN VBG NNS VBP VBG NN NN |
|*%{color:blue}Brill (BWN)%*| PRP VBD TO DT VBG NNS NN IN NN NN |

p.


|_tagger_|_This is a test of the emergency tagging system_|
|*%{color:blue}Tree%*| DT VBZ DT NN IN DT NN VVG NN |
|*%{color:blue}Brill (WSJ)%*| JJ NN VBG JJS NN NN NN VBG NN |
|*%{color:blue}Brill (BWN)%*| DT VBZ DT NN IN DT NN VBG NN |


The word tagging is part of a compound noun phrase and should not be lemmatized.');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('5', 'Dustin', '2005-11-30 20:13:11', '18.250.6.38', '2005-11-30 20:13:11', '2005-11-30 20:13:11', '3', 'I\'m still trying to decide which tagging method to use. The task is to reliably tag short, simple sentences -- given some goal/action expression, like "meet the pope", I want to identify verbs, modifiers, and nouns.  So far, I haven\'t been impressed by what the POS market has to offer.  Still to try are the LinkParse (CMU\'s) tagger built for Ruby and Hugo\'s MontyLingua.

|_tagger_|_flour the pan_|
|*%{color:blue}Tree%*| VV DT VV |
|*%{color:blue}Brill (WSJ)%*| NN NN NN |
|*%{color:blue}Brill (BWN)%*| NN DT VBG |




p. *the/DT dog/NN bit/NN the/DT cat/NN*

|_tagger_|_The dog bit the cat_|
|*%{color:blue}Tree%*| DT NN NN DT NN |
|*%{color:blue}Brill (WSJ)%*| JJ NN NN NN NN |
|*%{color:blue}Brill (BWN)%*| DT NN NN DT NN |


look into Monty Lingua\'s correction for this


|_tagger_|_I went to the Rolling Stones concert with Bob today_|
|*%{color:blue}Tree%*| PP VVD TO DT NP NPS NN IN NP NN |
|*%{color:blue}Brill (WSJ)%*| JJ NN NN NN VBG NNS VBP VBG NN NN |
|*%{color:blue}Brill (BWN)%*| PRP VBD TO DT VBG NNS NN IN NN NN |

p.


|_tagger_|_This is a test of the emergency tagging system_|
|*%{color:blue}Tree%*| DT VBZ DT NN IN DT NN VVG NN |
|*%{color:blue}Brill (WSJ)%*| JJ NN VBG JJS NN NN NN VBG NN |
|*%{color:blue}Brill (BWN)%*| DT VBZ DT NN IN DT NN VBG NN |


The word tagging is part of a compound noun phrase and should not be lemmatized.');
COMMIT;
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES ('Dustin', '4', '2005-12-11 19:09:51', '2005-12-11 19:09:51', 'CommonsenseFeudGame', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('6', 'Dustin', '2005-12-11 19:09:51', '18.85.16.168', '2005-12-11 19:09:51', '2005-12-11 19:09:51', '4', '*Why am I not getting any points?*

If there are not enough players and you something different that parses to the same result, the game will "double count" the entry without giving you any points.


This is not a bug.  We are saving your multiple inputs because it is good to know many different ways to say the same thing.

*Why does it hurt?*

This is a temporary bug that we are working on.');
COMMIT;
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES ('dustin', '5', '2005-11-30 20:50:26', '2005-11-30 20:50:26', 'FeudGame', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('7', 'dustin', '2005-11-30 20:50:26', '18.250.6.38', '2005-11-30 20:50:26', '2005-11-30 20:50:26', '5', 'Variations of the FeudGame:

h3. Original

Three states:
# Rules of play
# Display a goal and a template (random?) and users fill out their information
# Display the scores:
## Users who picked the most common concepts (after some lexical/semantic spreading) get more points than those who did not.


h3. Analogies

Try to force the users to create analogies, being a relationship between four parts:

    a:b :: c:d   : = "is to"
                 :: = "as"

For example

    *table* is-to *eat dinner* as ____ is-to *go swimming*

To avoid bad prompts, we will only use the analogies we collected in the Original game.  That is, we\'ll bootstrap.

h3. Metaphors

As mentioned in George Lakoff\'s essay, metaphors may be how people internally represent complex concepts.  By mapping an abstraction to a more concrete domain in a realm of spatial / geogmetric knowledge, you can use the same thought processes to think and talk about these abstract concepts that are otherwise hard to articulate.

Examples of these spatial structures are: containers, paths, obstacles and passages.

When people talk of plans, they usually talk of progress as a continuous line between them and their goal, sometimes beset with obstacles.  

People talk about love, using metaphors of physical structure: "I don\'t think we will ever _split up_", "Our relationship was _going nowhere_",  etc. ');
COMMIT;
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES ('AnonymousCoward', '6', '2005-12-30 16:56:03', '2005-11-30 20:02:00', 'RecentUpdates', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('8', 'AnonymousCoward', '2005-11-30 20:02:00', '18.250.6.38', '2005-11-30 20:02:00', '2005-11-30 20:02:00', '6', '
h3. 11.30.05

* Finally got the Feudgame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.
* Moved site to http://epsilon.media.mit.edu:3000
* Moved wiki (this) to http://epsilon.media.mit.edu:2500
* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.
* Muliple users can join FeudGame and the player list reflects the current players.

h3. 11.28.05

* *Added* sub-goals can be re-ordered or deleted before they are added.
* *Fixed* sub-goals are displayed in proper order.');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('9', 'Dustin', '2005-11-30 20:02:09', '18.250.6.38', '2005-11-30 20:02:09', '2005-11-30 20:02:09', '6', 'h3. 11.30.05

* Finally got the Feudgame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.
* Moved site to http://epsilon.media.mit.edu:3000
* Moved wiki (this) to http://epsilon.media.mit.edu:2500
* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.
* Muliple users can join FeudGame and the player list reflects the current players.

h3. 11.28.05

* *Added* sub-goals can be re-ordered or deleted before they are added.
* *Fixed* sub-goals are displayed in proper order.');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('10', 'dustin', '2005-11-30 20:34:52', '18.250.6.38', '2005-11-30 20:34:52', '2005-11-30 20:34:52', '6', 'h3. 11.30.05

* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.
* Moved site to http://epsilon.media.mit.edu:3000
* Moved wiki (this) to http://epsilon.media.mit.edu:2500
* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.
* Muliple users can join FeudGame and the player list reflects the current players.

h3. 11.28.05

* *Added* sub-goals can be re-ordered or deleted before they are added.
* *Fixed* sub-goals are displayed in proper order.');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('11', 'Dustin', '2005-12-11 19:03:47', '18.85.16.168', '2005-12-11 19:03:47', '2005-12-11 19:03:47', '6', 'h3. 12.11.05

* User scoring (save scores, rank)
* Storing data to database
* Fix IE javascript


h3. 11.30.05

* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.
* Moved site to http://epsilon.media.mit.edu:3000
* Moved wiki (this) to http://epsilon.media.mit.edu:2500
* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.
* Muliple users can join FeudGame and the player list reflects the current players.

h3. 11.28.05

* *Added* sub-goals can be re-ordered or deleted before they are added.
* *Fixed* sub-goals are displayed in proper order.');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('12', 'Dustin', '2005-12-11 22:49:05', '18.85.16.168', '2005-12-11 22:49:05', '2005-12-11 22:49:05', '6', 'h3. 12.11.05

* User scoring (save scores, rank)
* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  
* Fixed Javascript in IE (html body="onload")
* Rounded start timer as default during page appearance.
* Added META REFRESH for redundancy (seems to have stopped the white page problem)


h3. 11.30.05

* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.
* Moved site to http://epsilon.media.mit.edu:3000
* Moved wiki (this) to http://epsilon.media.mit.edu:2500
* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.
* Muliple users can join FeudGame and the player list reflects the current players.

h3. 11.28.05

* *Added* sub-goals can be re-ordered or deleted before they are added.
* *Fixed* sub-goals are displayed in proper order.');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('13', 'Dustin', '2005-12-13 15:43:15', '18.85.16.168', '2005-12-13 15:43:15', '2005-12-13 15:43:15', '6', 'h3. 12.13.05

* Fixed Parser Bug with "having%" statements.
* Updated premature "Time\'s up" Bug.
* Revising color sheme.

h3. 12.12.05

* Got rid of first "display rules" interval
* Created waiting page (/feud/startup) that is only loaded when you first start game.


h3. 12.11.05

* User scoring (save scores, rank)
* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  
* Fixed Javascript in IE (html body="onload")
* Rounded start timer as default during page appearance.
* Added META REFRESH for redundancy (seems to have stopped the white page problem)


h3. 11.30.05

* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.
* Moved site to http://epsilon.media.mit.edu:3000
* Moved wiki (this) to http://epsilon.media.mit.edu:2500
* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.
* Muliple users can join FeudGame and the player list reflects the current players.

h3. 11.28.05

* *Added* sub-goals can be re-ordered or deleted before they are added.
* *Fixed* sub-goals are displayed in proper order.');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('14', 'AnonymousCoward', '2005-12-13 20:40:16', '18.250.5.125', '2005-12-13 20:40:16', '2005-12-13 20:40:16', '6', 'h3. 12.13.05

* Fixed Parser Bug with "having%" statements.
* Fixed premature "Time\'s up" Bug.
* Revising color sheme.

h3. 12.12.05

* Got rid of first "display rules" interval
* Created waiting page (/feud/startup) that is only loaded when you first start game.


h3. 12.11.05

* User scoring (save scores, rank)
* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  
* Fixed Javascript in IE (html body="onload")
* Rounded start timer as default during page appearance.
* Added META REFRESH for redundancy (seems to have stopped the white page problem)


h3. 11.30.05

* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.
* Moved site to http://epsilon.media.mit.edu:3000
* Moved wiki (this) to http://epsilon.media.mit.edu:2500
* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.
* Muliple users can join FeudGame and the player list reflects the current players.

h3. 11.28.05

* *Added* sub-goals can be re-ordered or deleted before they are added.
* *Fixed* sub-goals are displayed in proper order.');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('15', 'AnonymousCoward', '2005-12-30 16:56:03', '69.120.115.225', '2005-12-30 16:56:03', '2005-12-30 16:56:03', '6', 'h3. 12.30.05

* Moved site to http://epsilon.media.mit.edu:3000
* Moved wiki (this) to http://epsilon.media.mit.edu:2500
* SQL bug fixed with MySQL upgrade (Mako)

h3. 12.13.05

* Fixed Parser Bug with "having%" statements.
* Fixed premature "Time\'s up" Bug.
* Revising color sheme.

h3. 12.12.05

* Got rid of first "display rules" interval
* Created waiting page (/feud/startup) that is only loaded when you first start game.


h3. 12.11.05

* User scoring (save scores, rank)
* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  
* Fixed Javascript in IE (html body="onload")
* Rounded start timer as default during page appearance.
* Added META REFRESH for redundancy (seems to have stopped the white page problem)


h3. 11.30.05

* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.
* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.
* Muliple users can join FeudGame and the player list reflects the current players.

h3. 11.28.05

* *Added* sub-goals can be re-ordered or deleted before they are added.
* *Fixed* sub-goals are displayed in proper order.');
COMMIT;
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES ('AnonymousCoward', '7', '2005-11-30 11:54:37', '2005-11-30 11:54:37', 'BugTracking', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('16', 'Dustin', '2005-11-30 11:54:37', '18.85.16.168', '2005-11-30 11:54:37', '2005-11-30 11:54:37', '7', 'h3. Introduction




h3. Components

# TaggerBugs');
COMMIT;
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES ('AnonymousCoward', '8', '2005-12-27 21:02:58', '2005-11-30 11:53:58', 'HomePage', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('17', 'Dustin', '2005-11-30 11:53:58', '18.85.16.168', '2005-11-30 11:53:58', '2005-11-30 11:53:58', '8', 'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:

h2. Links

# ToDoList
# KnowledgeRepresentations
# RecentUpdates
# BugTracking


h2. "Main Page":http://epsilon.media.mit.edu:3000/');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('18', 'Dustin', '2005-11-30 20:06:46', '18.250.6.38', '2005-11-30 20:06:46', '2005-11-30 20:06:46', '8', 'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:

h2. Links

# ToDoList what needs to be done
# RecentUpdates what has been done
# TaggerBugs oh that tagger
# KnowledgeRepresentations

h2. "Main Page":http://epsilon.media.mit.edu:3000/');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('19', 'AnonymousCoward', '2005-11-30 20:30:52', '18.250.6.38', '2005-11-30 20:30:52', '2005-11-30 20:30:52', '8', 'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:

h2. Links

# ToDoList what needs to be done
# RecentUpdates what has been done
# TaggerBugs oh that tagger
# KnowledgeRepresentations

h2. "Main Page":http://epsilon.media.mit.edu:3000/ <-- clink there to get back to the game');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('20', 'Dustin', '2005-12-11 19:18:44', '18.85.16.168', '2005-12-11 19:18:44', '2005-12-11 19:18:44', '8', 'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:

h2. Links

# ToDoList what needs to be done
# RecentUpdates what has been done
# TaggerBugs oh that tagger
# KnowledgeRepresentations
# CommonsenseFeudGame

h2. "Main Page":http://18.85.16.168/Goals/ <-- clink there to get back to the game');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('21', 'AnonymousCoward', '2005-12-11 21:04:20', '18.85.16.168', '2005-12-11 21:04:20', '2005-12-11 21:04:20', '8', 'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:

h2. Links

# ToDoList what needs to be done
# RecentUpdates what has been done
# TaggerBugs oh that tagger
# KnowledgeRepresentations
# CommonsenseFeudGame
# UserFeedback

h2. "Main Page":http://18.85.16.168/Goals/ <-- clink there to get back to the game');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('22', 'AnonymousCoward', '2005-12-27 21:02:58', '69.120.115.225', '2005-12-27 21:02:58', '2005-12-27 21:02:58', '8', 'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:

h2. Links

# ToDoList what needs to be done
# RecentUpdates what has been done
# TaggerBugs oh that tagger
# KnowledgeRepresentations
# CommonsenseFeudGame
# UserFeedback

h2. "Main Page":http://epsilon.media.mit.edu:3000 <-- clink to get back to the game');
COMMIT;
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES ('Dustin', '9', '2005-12-30 16:56:53', '2005-11-30 11:54:13', 'ToDoList', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('23', 'Dustin', '2005-11-30 11:54:13', '18.85.16.168', '2005-11-30 11:54:13', '2005-11-30 11:54:13', '9', 'h2. Technical

# BUGS
## fix sub-goal ordering
# fix unique form naming (appearance in IE?)
# put site on XNet
# svn control ?
# make PARSE into method/helper
# actually save data!
# get smtp server up / mailing features working
# -sort / delete sub-goals-

h2. Technical::Feud

# JavaScript counter in IE/ect
# JavaScript counter - make default rounded.
# Make game 
# lemmatizer - plural/past/etc.
# [one two three] status indicator
# spark graphs

ACTIONS = goals that have no alternative method of solving.
h2. Structure and StoryQuestions

# -distinguish betwixt goals and actions-  instead of 0/1, use 1+ and only hide goals that are greater than a threshold.
# KnowledgeRealms

Projects:  Tap, Commonsense Taboo,

h2. Gaming

# view other users\'s stats
# implement scoring stystem
# user photos
# user editing, 


"main page":http://18.85.16.150:3000/goals

"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('24', 'AnonymousCoward', '2005-11-30 19:59:19', '18.250.6.38', '2005-11-30 19:59:19', '2005-11-30 19:59:19', '9', 'h3. %{color:red}To do!%

* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)
* Create a helper function that returns the right sysnet/hyponyms based on the word choice.
* Modulize the form listing:
## Avoid using the same name multiple times (IE bug)
## Fix AJAX selections, lessen pause if possible.
## Permit substitution of other tenses

* Find out what\'s making it so slow!
* Create a scheme to _save the data_ and implement
* get smtp server up / mailing features working
* Feud Goals: JavaScript counter in IE/ect
* Feud Goals JavaScript counter - make default rounded.
* Interface [one two three] status indicator


ACTIONS = goals that have no alternative method of solving.
h2. Structure and StoryQuestions

# -distinguish betwixt goals and actions-  instead of 0/1, use 1+ and only hide goals that are greater than a threshold.
# KnowledgeRealms

Projects:  Tap, Commonsense Taboo,

h2. Gaming

# view other users\'s stats
# implement scoring stystem
# user photos
# user editing, 


"main page":http://18.85.16.150:3000/goals

"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('25', 'Dustin', '2005-11-30 20:05:43', '18.250.6.38', '2005-11-30 20:05:43', '2005-11-30 20:05:43', '9', 'h3. %{color:red}To do!%

* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)
* Create a helper function that returns the right sysnet/hyponyms based on the word choice.
* Modulize the form listing:
## Avoid using the same name multiple times (IE bug)
## Fix AJAX selections, lessen pause if possible.
## Permit substitution of other tenses

* Find out what\'s making it so slow:  Move to Lighttpd or Apache.
* Create a scheme to _save the data_ and implement
* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"
## get rid of the validation memo upon signup
* Feud Goals: JavaScript counter in IE/ect
* Feud Goals JavaScript counter - make default rounded.
* Interface [one two three] status indicator
* Better documentation and instructions for users
* POS tagger: Linknet or existing taggers?

h2. Testing

* Security Issues
* Multiple logins (same account) to feud game
* Entering/leaving in the middle of the game
* Session expiry


h2. Future Possibilities

# view other users\'s stats
# implement scoring stystem
# user photos
# user editing


"main page":http://18.85.16.150:3000/goals

"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('26', 'AnonymousCoward', '2005-11-30 20:30:30', '18.250.6.38', '2005-11-30 20:30:30', '2005-11-30 20:30:30', '9', 'h3. %{color:red}To do!%

* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)
* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)
* Saving the goals, spilting trees of subgoals or meging them?
* Create a way to _contextualize_ the prompts users recieve
* Create a helper function that returns the right sysnet/hyponyms based on the word choice.
* Modulize the form listing:
## Avoid using the same name multiple times (IE bug)
## Fix AJAX selections, lessen pause if possible.
## Permit substitution of other tenses

* Find out what\'s making it so slow:  Move to Lighttpd or Apache.
* Create a scheme to _save the data_ and implement
* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"
## get rid of the validation memo upon signup
* Feud Goals: JavaScript counter in IE/ect
* Feud Goals JavaScript counter - make default rounded.
* Interface [one two three] status indicator
* Better documentation and instructions for users
* POS tagger: Linknet or existing taggers?

h2. Testing

* Security Issues
* Multiple logins (same account) to feud game
* Entering/leaving in the middle of the game
* Session expiry


h2. Future Possibilities

# view other users\'s stats
# implement scoring stystem
# user photos
# user editing


"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('27', 'dustin', '2005-11-30 20:33:41', '18.250.6.38', '2005-11-30 20:33:41', '2005-11-30 20:33:41', '9', 'h3. %{color:red}To do!%

* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)
* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)
* Saving the goals, spilting trees of subgoals or meging them?
* Create a way to _contextualize_ the prompts users recieve
* Create a helper function that returns the right sysnet/hyponyms based on the word choice.
* Modulize the form listing:
## Avoid using the same name multiple times (IE bug)
## Fix AJAX selections, lessen pause if possible.
## Permit substitution of other tenses

* Find out what\'s making it so slow:  Move to Lighttpd or Apache.
* Create a scheme to _save the data_ and implement
* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"
## get rid of the validation memo upon signup
* Feud Goals: JavaScript counter in IE/ect
* Feud Goals JavaScript counter - make default rounded.
* A way to keep track of temporary submissions into the database (create a temp table?)
* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users
* POS tagger: Linknet or existing taggers?

h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests

* view other users\'s stats
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('28', 'Dustin', '2005-12-03 12:32:55', '18.85.16.168', '2005-12-03 12:32:55', '2005-12-03 12:32:55', '9', 'h3. %{color:red}To do!%

* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)
* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)
* Saving the goals, spilting trees of subgoals or meging them?
* Create a way to _contextualize_ the prompts users recieve
* Create a helper function that returns the right sysnet/hyponyms based on the word choice.
* Modulize the form listing:
## Avoid using the same name multiple times (IE bug)
## Fix AJAX selections, lessen pause if possible.
## Permit substitution of other tenses

* Find out what\'s making it so slow:  Move to Lighttpd or Apache.
* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"
## get rid of the validation memo upon signup
* Feud Goals: JavaScript counter in IE/ect
* Feud Goals JavaScript counter - make default rounded.
* A way to keep track of temporary submissions into the database (create a temp table?)
* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users
* POS tagger: Linknet or existing taggers?

h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests

* view other users\'s stats
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('29', 'AnonymousCoward', '2005-12-05 14:02:16', '18.85.18.128', '2005-12-05 14:02:16', '2005-12-05 14:02:16', '9', 'h3. %{color:red}To do!%

h2. For Tues 12/6

* User scoring (save scores, rank)
* Storing data to database
* Fix IE javascript
* Reasons for/against (alternating?)
* Ajax the input for rapidfire listing

h2. more

* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)
* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)
* Saving the goals, spilting trees of subgoals or meging them?
* Create a way to _contextualize_ the prompts users recieve
* Create a helper function that returns the right sysnet/hyponyms based on the word choice.
* Modulize the form listing:
## Avoid using the same name multiple times (IE bug)
## Fix AJAX selections, lessen pause if possible.
## Permit substitution of other tenses

* Find out what\'s making it so slow:  Move to Lighttpd or Apache.
* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"
## get rid of the validation memo upon signup
* Feud Goals: JavaScript counter in IE/ect
* Feud Goals JavaScript counter - make default rounded.
* A way to keep track of temporary submissions into the database (create a temp table?)
* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users
* POS tagger: Linknet or existing taggers?

h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests

* view other users\'s stats
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('30', 'Dustin', '2005-12-11 19:03:24', '18.85.16.168', '2005-12-11 19:03:24', '2005-12-11 19:03:24', '9', 'h3. %{color:red}To do!%

h2. For Tues 12/6


* Reasons for/against (alternating?)
* Ajax the input for rapidfire listing

h2. more

* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)
* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)
* Saving the goals, spilting trees of subgoals or meging them?
* Create a way to _contextualize_ the prompts users recieve
* Create a helper function that returns the right sysnet/hyponyms based on the word choice.
* Modulize the form listing:
## Avoid using the same name multiple times (IE bug)
## Fix AJAX selections, lessen pause if possible.
## Permit substitution of other tenses

* Find out what\'s making it so slow:  Move to Lighttpd or Apache.
* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"
## get rid of the validation memo upon signup
* Feud Goals: JavaScript counter in IE/ect
* Feud Goals JavaScript counter - make default rounded.
* A way to keep track of temporary submissions into the database (create a temp table?)
* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users
* POS tagger: Linknet or existing taggers?

h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests

* view other users\'s stats
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('31', 'AnonymousCoward', '2005-12-11 19:09:11', '18.85.18.68', '2005-12-11 19:09:11', '2005-12-11 19:09:11', '9', 'h3. %{color:red}To do!%

* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)

* Reasons for/against (alternating?)

h2. goals

* Saving the goals, spilting trees of subgoals or meging them?
* Create a way to _contextualize_ the prompts users recieve
* Create a helper function that returns the right sysnet/hyponyms based on the word choice.
* Find out what\'s making it so slow:  Move to Lighttpd or Apache.
* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"
## get rid of the validation memo upon signup
* Feud Goals: JavaScript counter in IE/ect
* Feud Goals JavaScript counter - make default rounded.
* A way to keep track of temporary submissions into the database (create a temp table?)
* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users
* POS tagger: Linknet or existing taggers?

h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests

* view other users\'s stats
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('32', 'Dustin', '2005-12-11 21:59:45', '18.85.16.168', '2005-12-11 21:59:45', '2005-12-11 21:59:45', '9', 'h3. %{color:red}To do!%

* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)

* Reasons for/against (alternating?)

* Better Scoring
# Make sure it scores against old results
# Show which users guessed what
# Show which users scored points
# Paginate scores / Limit results?


h2. goals

* Saving the goals, spilting trees of subgoals or meging them?
* Create a way to _contextualize_ the prompts users recieve
* Create a helper function that returns the right sysnet/hyponyms based on the word choice.
* Find out what\'s making it so slow:  Move to Lighttpd or Apache.
* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"

* Feud Goals: JavaScript counter in IE/ect
* Feud Goals JavaScript counter - make default rounded.
* A way to keep track of temporary submissions into the database (create a temp table?)
* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users
* POS tagger: Linknet or existing taggers?

h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests


* view other users\'s contributions
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('33', 'Dustin', '2005-12-11 22:57:36', '18.85.16.168', '2005-12-11 22:57:36', '2005-12-11 22:57:36', '9', '


h2. %{color:red}To Do%

* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)

* Migrate to Epsilon

* Change really bad words to poor words.

* Quotes, comics, pictures during loading.

* Better interface: graphics, bars, colours, sensations 
# Sparkgraphs!

* Better Scoring
# Make sure it scores against old results
# Show which users guessed what
# Show which users scored points


* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"

* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users

h2. Open Questions (please comment)

* Should we ask for user\'s email? Age? SSN?
* How should we represent many results (just the top, !=1, etc)
* Ask for negative expertise?


h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game -- how should we handle this?
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests


* view other users\'s contributions
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('34', 'Dustin', '2005-12-12 21:08:50', '18.85.16.168', '2005-12-12 21:08:50', '2005-12-12 21:08:50', '9', '

h2. %{color:red}To Do%

* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)

* Migrate to Epsilon

* Change really bad words to poor words.

* Quotes, comics, pictures during loading.

* Better interface: graphics, bars, colours, sensations 
# Sparkgraphs!

* Better Scoring
# Make sure it scores against old results
# Show which users guessed what
# Show which users scored points


* Reset Goals::goal_used to 0 for all goals each time anew goal is added.


* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"

* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users

h2. Open Questions (please comment)

* Should we ask for user\'s email? Age? SSN?
* How should we represent many results (just the top, !=1, etc)
* Ask for negative expertise?


h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game -- how should we handle this?
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests


* view other users\'s contributions
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('35', 'AnonymousCoward', '2005-12-13 11:37:28', '18.85.19.35', '2005-12-13 11:37:28', '2005-12-13 11:37:28', '9', 'h2. %{color:red}To Do%


* I think that the "Application Error (rails) " error was triggered by someone\'s input that crashed on the parser.  The reason the error was not specific is that it is running in Production mode.



* Fix time\'s up error(from class, after enter one)

* scoring Rails App error

* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)

* Migrate to Epsilon

* Change really bad words to poor words.

* Quotes, comics, pictures during loading.

* Better interface: graphics, bars, colours, sensations 
# Sparkgraphs!

* Better Scoring
# Make sure it scores against old results
# Show which users guessed what
# Show which users scored points


* Reset Goals::goal_used to 0 for all goals each time anew goal is added.


* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"

* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users

h2. Open Questions (please comment)

* Should we ask for user\'s email? Age? SSN?
* How should we represent many results (just the top, !=1, etc)
* Ask for negative expertise?


h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game -- how should we handle this?
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests


* view other users\'s contributions
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('36', 'Dustin', '2005-12-13 15:40:41', '18.85.16.168', '2005-12-13 15:40:41', '2005-12-13 15:40:41', '9', 'h2. %{color:red}To Do%




* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)

* Migrate to Epsilon

* Change really bad words to poor words.

* Quotes, comics, pictures during loading.

* Better interface: graphics, bars, colours, sensations 
# Sparkgraphs!

* Better Scoring
# Make sure it scores against old results
# Show which users guessed what
# Show which users scored points


* Reset Goals::goal_used to 0 for all goals each time anew goal is added.


* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"

* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users

h2. Open Questions (please comment)

* Should we ask for user\'s email? Age? SSN?
* How should we represent many results (just the top, !=1, etc)
* Ask for negative expertise?


h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game -- how should we handle this?
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests


* view other users\'s contributions
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('37', 'AnonymousCoward', '2005-12-30 16:56:53', '69.120.115.225', '2005-12-30 16:56:53', '2005-12-30 16:56:53', '9', 'h2. %{color:red}To Do%


* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)

* Change really bad words to poor words.

* Add more quotes to \'holding page\'

* Better interface: graphics, bars, colours, sensations 
# Sparkgraphs!

* Better Scoring
# Make sure it scores against old results
# Show which users guessed what
# Show which users scored points


* Reset Goals::goal_used to 0 for all goals each time anew goal is added.


* get smtp server up / mailing features working
## send welcome letter
## "forgot your pass"

* statistics to display the results, sparklines, etc
* Interface [one two three] status indicator
* Better documentation and instructions for users

h2. Open Questions (please comment)

* Should we ask for user\'s email? Age? SSN?
* How should we represent many results (just the top, !=1, etc)
* Ask for negative expertise?


h2. Testing

* Security Issues, ip logging
* Multiple logins (same account) to feud game -- how should we handle this?
* Entering/leaving in the middle of the game
* Session expiry


h2. Feature Requests


* view other users\'s contributions
* categories of users
* user photos
* integrate (somehow) with other networks
* user editing
* integrate Wiki with main site
* localization, other languages



"textile reference":http://hobix.com/textile/ -- wiki formatting guide');
COMMIT;
BEGIN;
INSERT INTO pages (locked_by, id, updated_at, created_at, name, web_id) VALUES ('AnonymousCoward', '10', '2005-12-18 21:26:52', '2005-12-11 21:04:39', 'UserFeedback', '1');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('38', 'Dustin', '2005-12-11 21:04:39', '18.85.16.168', '2005-12-11 21:04:39', '2005-12-11 21:04:39', '10', '*What did you think of the game?*');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('39', 'Dustin', '2005-12-11 22:46:09', '18.85.16.168', '2005-12-11 22:46:09', '2005-12-11 22:46:09', '10', '*What did you think of the game?*

I would like to see quotes during the page loading sequence - Dustin');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('40', 'Dustin', '2005-12-11 23:57:53', '18.250.5.125', '2005-12-11 23:57:53', '2005-12-11 23:57:53', '10', 'h3. *What did you think of the game?*

If you have any comments about the game, please post them on the wiki, send me an email, or drop by my office.  In particular, we\'re interested in finding out:


h3. 1. which parts you found entertaining, and which detracted

h3. 2. the durations of the game\'s intervals -- too short or long?  was the timer annoying?


h3. 3. are the instructions and interface intuitive?

h3. 4. bugs??

h3. 5. How can we make this more entertaining?

Thanks for your help!

-- Dustin & Alea');
INSERT INTO revisions (id, author, updated_at, ip, revised_at, created_at, page_id, content) VALUES ('41', 'AnonymousCoward', '2005-12-18 21:26:52', '18.85.16.150', '2005-12-18 21:26:52', '2005-12-18 21:26:52', '10', 'h3. *What did you think of the game?*

If you have any comments about the game, please post them on the wiki, send me an email, or drop by my office.  In particular, we\'re interested in finding out:


h3. 1. which parts you found entertaining, and which detracted

h3. 2. the durations of the game\'s intervals -- too short or long?  was the timer annoying?


h3. 3. are the instructions and interface intuitive?

h3. 4. bugs??

h3. 5. How can we make this more entertaining?

Thanks for your help!

-- Dustin & Alea

Amazing!');
COMMIT;
