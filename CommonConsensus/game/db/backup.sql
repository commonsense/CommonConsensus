-- MySQL dump 8.23
--
-- Host: localhost    Database: narrate_development
---------------------------------------------------------
-- Server version	5.0.24a-standard

--
-- Table structure for table `bads`
--

CREATE TABLE bads (
  id int(11) NOT NULL auto_increment,
  goal_id int(11) NOT NULL default '0',
  game_type int(11) NOT NULL default '0',
  times int(11) NOT NULL default '1',
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bads`
--


INSERT INTO bads VALUES (15,11,0,1);
INSERT INTO bads VALUES (16,73,1,2);
INSERT INTO bads VALUES (17,32,0,3);
INSERT INTO bads VALUES (18,70,0,1);
INSERT INTO bads VALUES (19,50,0,10);
INSERT INTO bads VALUES (20,74,1,1);
INSERT INTO bads VALUES (21,68,1,1);
INSERT INTO bads VALUES (22,24,0,3);
INSERT INTO bads VALUES (23,102,2,1);
INSERT INTO bads VALUES (24,101,1,1);
INSERT INTO bads VALUES (25,96,0,1);
INSERT INTO bads VALUES (26,25,0,2);
INSERT INTO bads VALUES (27,118,0,1);
INSERT INTO bads VALUES (28,57,0,3);
INSERT INTO bads VALUES (29,22,0,6);
INSERT INTO bads VALUES (30,106,1,2);
INSERT INTO bads VALUES (31,53,0,5);
INSERT INTO bads VALUES (32,125,0,1);
INSERT INTO bads VALUES (33,67,1,2);
INSERT INTO bads VALUES (34,103,3,1);
INSERT INTO bads VALUES (35,72,0,3);
INSERT INTO bads VALUES (36,83,3,1);
INSERT INTO bads VALUES (37,72,1,4);
INSERT INTO bads VALUES (38,30,0,4);
INSERT INTO bads VALUES (39,33,0,1);
INSERT INTO bads VALUES (40,117,3,2);
INSERT INTO bads VALUES (41,120,0,2);
INSERT INTO bads VALUES (42,59,1,3);
INSERT INTO bads VALUES (43,42,0,5);
INSERT INTO bads VALUES (44,115,1,6);
INSERT INTO bads VALUES (45,68,3,1);
INSERT INTO bads VALUES (46,12,0,1);
INSERT INTO bads VALUES (47,29,0,4);
INSERT INTO bads VALUES (48,52,0,1);
INSERT INTO bads VALUES (49,45,0,1);
INSERT INTO bads VALUES (50,60,0,3);
INSERT INTO bads VALUES (51,73,2,1);
INSERT INTO bads VALUES (52,49,0,1);
INSERT INTO bads VALUES (53,40,0,1);
INSERT INTO bads VALUES (54,140,0,2);
INSERT INTO bads VALUES (55,68343,1,1);
INSERT INTO bads VALUES (56,56964,1,2);
INSERT INTO bads VALUES (57,57538,1,1);
INSERT INTO bads VALUES (58,39986,1,1);
INSERT INTO bads VALUES (59,11560,1,1);
INSERT INTO bads VALUES (60,48692,1,1);
INSERT INTO bads VALUES (61,14424,1,1);
INSERT INTO bads VALUES (62,29905,1,1);
INSERT INTO bads VALUES (63,54679,1,1);
INSERT INTO bads VALUES (64,44464,1,1);
INSERT INTO bads VALUES (65,1623,1,1);
INSERT INTO bads VALUES (66,22110,1,1);
INSERT INTO bads VALUES (67,52064,1,1);
INSERT INTO bads VALUES (68,67176,1,1);
INSERT INTO bads VALUES (69,15481,1,2);
INSERT INTO bads VALUES (70,46785,1,1);
INSERT INTO bads VALUES (71,13860,1,1);
INSERT INTO bads VALUES (72,62238,1,1);
INSERT INTO bads VALUES (73,47417,1,1);
INSERT INTO bads VALUES (74,42923,1,1);
INSERT INTO bads VALUES (75,47367,1,1);
INSERT INTO bads VALUES (76,16889,1,1);
INSERT INTO bads VALUES (77,1014,1,1);
INSERT INTO bads VALUES (78,19487,1,1);
INSERT INTO bads VALUES (79,68798,1,1);
INSERT INTO bads VALUES (80,30947,1,7);
INSERT INTO bads VALUES (81,31412,1,1);
INSERT INTO bads VALUES (82,56273,1,4);
INSERT INTO bads VALUES (83,10476,1,3);
INSERT INTO bads VALUES (84,64944,1,1);
INSERT INTO bads VALUES (85,12720,1,1);
INSERT INTO bads VALUES (86,9847,1,6);
INSERT INTO bads VALUES (87,51027,1,1);
INSERT INTO bads VALUES (88,37609,1,1);
INSERT INTO bads VALUES (89,11600,0,1);
INSERT INTO bads VALUES (90,11708,1,1);
INSERT INTO bads VALUES (91,802,0,1);
INSERT INTO bads VALUES (92,11325,1,3);
INSERT INTO bads VALUES (93,2034,2,1);
INSERT INTO bads VALUES (94,10453,3,1);
INSERT INTO bads VALUES (95,5183,2,1);
INSERT INTO bads VALUES (96,10461,1,1);
INSERT INTO bads VALUES (97,2089,0,1);
INSERT INTO bads VALUES (98,10171,0,1);
INSERT INTO bads VALUES (99,12738,1,1);
INSERT INTO bads VALUES (100,12743,0,1);
INSERT INTO bads VALUES (101,12740,2,1);
INSERT INTO bads VALUES (102,12747,2,1);
INSERT INTO bads VALUES (103,12755,1,1);

--
-- Table structure for table `controls`
--

CREATE TABLE controls (
  id int(11) NOT NULL auto_increment,
  state int(11) NOT NULL default '0',
  `last` datetime default NULL,
  users blob,
  goal int(40) default '1',
  structure int(11) default '1',
  guesses blob,
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `controls`
--


INSERT INTO controls VALUES (1,1,'2006-01-31 14:21:29','[\0',116,14,'{\0');

--
-- Table structure for table `envs`
--

CREATE TABLE envs (
  id int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  created_by int(11) default '0',
  env_used int(11) default '0',
  order_num int(11) default '0',
  parent_id int(11) default '0',
  is_leaf int(5) default '0',
  date_created date default NULL,
  env_type varchar(255) default NULL,
  envs_count int(11) default '0',
  PRIMARY KEY  (id),
  KEY fk_env (parent_id)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `envs`
--


INSERT INTO envs VALUES (1,'Earth',0,0,0,0,0,NULL,NULL,4);
INSERT INTO envs VALUES (2,'North America',0,0,0,1,0,NULL,NULL,0);
INSERT INTO envs VALUES (3,'South America',0,0,0,1,0,NULL,NULL,0);
INSERT INTO envs VALUES (4,'Africa',0,0,0,1,0,NULL,NULL,0);
INSERT INTO envs VALUES (5,'Atlantic Ocean',0,0,0,1,0,NULL,NULL,0);
INSERT INTO envs VALUES (6,'Atmosphere',0,0,0,1,0,NULL,NULL,0);

--
-- Table structure for table `feedback`
--

CREATE TABLE feedback (
  id int(11) NOT NULL auto_increment,
  `first` text,
  `second` text,
  third text,
  fourth text,
  fifth text,
  sixth text,
  userid int(11) default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--



--
-- Table structure for table `feedbacks`
--

CREATE TABLE feedbacks (
  id int(11) NOT NULL auto_increment,
  `first` text,
  `second` text,
  third text,
  fourth text,
  fifth text,
  sixth text,
  userid int(11) default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedbacks`
--


INSERT INTO feedbacks VALUES (1,'sdfasdf',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO feedbacks VALUES (2,'sdfasdf','','','','',NULL,9);
INSERT INTO feedbacks VALUES (3,'sdfasdf','','','','',NULL,9);
INSERT INTO feedbacks VALUES (4,'Yes.','The timer, the competetiveness, and the other users','Not enough users were playing. Some of the questions were bad.','Yes, I was asked about X','Yes',NULL,9);
INSERT INTO feedbacks VALUES (5,'Yes','','','','',NULL,9);
INSERT INTO feedbacks VALUES (6,'a','a','a','a','',NULL,9);
INSERT INTO feedbacks VALUES (7,'vg','g','p','vp','nothing',NULL,9);
INSERT INTO feedbacks VALUES (8,'a','a','a','a','','',57);
INSERT INTO feedbacks VALUES (9,'g','g','p','a','The fact that you have to play with another person was frustrating. and that other people did not write as detailed answers as I did so I did not get points.','If more people were playing or at least a computer was playing against you.... ',40);
INSERT INTO feedbacks VALUES (10,'g','g','p','g','I\'m not the best test case because I\'ve used the game before. I think it is tough to tell just from the interface that you are matching to other\'s imputs. The immediate feedback + red bar for matches helps (a nice improvement from the last version).  English templates for questions were off in one of the examples I tried, causes anxietiy when the clock is ticking and I have to read the sentence a few times w/out being able to get it.','I wonder if you could order the questions somehow so a person could conect the context in their minds, to make a flow from one game to the next.  I think it would help the person cultivate more answers and be able to add entries more quickly. \r\n\r\nI wonder if you could have some visualizaiton of time running out instead of the counter. I didn\'t feel much pressure from the time running out. \r\n',68);
INSERT INTO feedbacks VALUES (11,'g','a','p','g','It was allowed to choose more than one alternative, so I received a lot of points! ','images, sounds, chat ',64);
INSERT INTO feedbacks VALUES (12,'g','g','p','g','Some of my entrances were not considered [especially those made when time was finishing - at about 3 or 2 seconds]','are the questions about time bonus? you can mark many answers and you get points for all of them. I think this way it is too easy.\r\nAny way, congratulations for the game!',65);
INSERT INTO feedbacks VALUES (13,'g','a','p','g','','',63);
INSERT INTO feedbacks VALUES (14,'g','vg','p','a','Repetition of question','',66);
INSERT INTO feedbacks VALUES (15,'g','g','vg','p','Yes... many times I have answered lots of things which was not registered by the system! I mean, I typed the answer, pressed the return buttom, and the answer was not added to my list of contributions.\r\nAlso, I have gotten many questions repeated.\r\nAnother thing to be considered is the fact that I could not understand how the points were calculated. This was very frustrating.','I would add some pictures and also some sounds. For example, a car crashing, people having an argument, children singing happy birthday, etc.',58);
INSERT INTO feedbacks VALUES (16,'g','g','a','g','I wasn\'t sure whether I should try to type different ways of saying the same thing, e.g. \"to save data\", \"to backup my computer\", \"to avoid losing files\"\r\nI wasn\'t sure whether you wanted just one answer for how long something takes, or several.','It was fine for a half hour, but I began to get bored, so maybe more variety.',53);
INSERT INTO feedbacks VALUES (17,'a','p','p','a','*Several times iIentered more than 1 answer but the system didn\'t count it.\r\n*In the multiple-choice questions the user just select the five options and the system sums it, making the commonsense opinion up.\r\n*The time counter increases the number of spelling mistakes.\r\n\r\n\r\n','select the users that i\'can see in ranking.\r\nthe system count properly when i type more than an anwser.\r\nthe system recognizes similar anwsers.',59);
INSERT INTO feedbacks VALUES (18,'g','g','vp','vg','the game works best when you have multiple players playing. when i joined i think most had logged off.','diversity of questions would help.',70);
INSERT INTO feedbacks VALUES (19,'g','g','p','a','it repeats the questions quickly','a larger set of questions and a more interactive interface with other players',67);
INSERT INTO feedbacks VALUES (20,'g','g','p','g','no other people playing at the time','',71);

--
-- Table structure for table `goals`
--

CREATE TABLE goals (
  id int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  created_by int(11) default '0',
  goal_used int(11) default '0',
  order_num int(11) default '0',
  parent_id int(11) default '0',
  goals_count int(11) default '0',
  is_leaf int(5) default '0',
  date_created date default NULL,
  PRIMARY KEY  (id),
  KEY fk_goal (parent_id)
) ENGINE=MyISAM AUTO_INCREMENT=12759 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goals`
--


INSERT INTO goals VALUES (12734,'turn on the tv',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12735,'turn on the stereo',0,141,0,0,0,0,NULL);
INSERT INTO goals VALUES (12736,'play a cd',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12737,'watch a movie',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12738,'turn down the volume',0,141,0,0,0,0,NULL);
INSERT INTO goals VALUES (12739,'burn a CD',0,141,0,0,0,0,NULL);
INSERT INTO goals VALUES (12740,'turn up the bass',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12741,'turn up the treble',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12742,'make dinner',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12743,'listen to music',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12744,'relax at home',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12745,'give a lecture',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12746,'call technical support',0,141,0,0,0,0,NULL);
INSERT INTO goals VALUES (12747,'host a party',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12748,'record a television show',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12749,'record a dvd',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12750,'record a cd',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12751,'download a movie',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12752,'find the TV remote control',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12753,'copy a CD',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12754,'build a CD library',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12755,'take a vacation',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12756,'shop for groceries',0,142,0,0,0,0,NULL);
INSERT INTO goals VALUES (12757,'make a phonecall',0,141,0,0,0,0,NULL);
INSERT INTO goals VALUES (12758,'walk your dog',0,142,0,0,0,0,NULL);

--
-- Table structure for table `guesses`
--

CREATE TABLE guesses (
  id int(11) NOT NULL auto_increment,
  g_string varchar(255) default NULL,
  g_type int(11) default NULL,
  g_verb varchar(255) default NULL,
  g_noun varchar(255) default NULL,
  g_both varchar(255) default NULL,
  num int(11) default NULL,
  goal_id int(11) default NULL,
  game_type int(11) default '1',
  category int(11) default NULL,
  players int(11) default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=60367 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guesses`
--


INSERT INTO guesses VALUES (59564,'find the remote',12,'find','the remote','find the remote',2,12738,1,1,1);
INSERT INTO guesses VALUES (59565,'turn off the stereo',12,'turn','off the stereo','turn off the stereo',1,12738,1,2,0);
INSERT INTO guesses VALUES (59566,'turn off the tv',12,'turn','off the tv','turn off the tv',1,12738,1,3,0);
INSERT INTO guesses VALUES (59567,'turn the volume knob',12,'turn','the volume knob','turn the volume knob',1,12738,1,4,0);
INSERT INTO guesses VALUES (59568,'minutes',12,'','','minutes',1,12749,3,1,1);
INSERT INTO guesses VALUES (59569,'because you are hungry',12,'you','are hungry','you are hungry',2,12742,0,1,3);
INSERT INTO guesses VALUES (59570,'you are hungry',12,'be','hungry','be hungry',1,12742,0,1,1);
INSERT INTO guesses VALUES (59571,'to eat food',12,'eat','food','eat food',1,12742,0,2,1);
INSERT INTO guesses VALUES (59572,'so you can eat it',12,'eat','it','eat it',1,12742,0,3,1);
INSERT INTO guesses VALUES (59573,'seconds',12,'','','seconds',1,12740,3,1,1);
INSERT INTO guesses VALUES (59574,'minutes',12,'','','minutes',2,12740,3,2,2);
INSERT INTO guesses VALUES (59575,'to listen to music',12,'listen','to music','listen to music',2,12739,0,1,9);
INSERT INTO guesses VALUES (59576,'hours',12,'','','hours',1,12748,3,1,1);
INSERT INTO guesses VALUES (59577,'minutes',12,'','','minutes',1,12748,3,2,1);
INSERT INTO guesses VALUES (59578,'minutes',12,'','','minutes',1,12743,3,1,1);
INSERT INTO guesses VALUES (59579,'hours',12,'','','hours',1,12743,3,2,1);
INSERT INTO guesses VALUES (59580,'minutes',12,'','','minutes',1,12742,3,1,1);
INSERT INTO guesses VALUES (59581,'hours',12,'','','hours',1,12742,3,2,1);
INSERT INTO guesses VALUES (59582,'seconds',12,'','','seconds',1,12741,3,1,1);
INSERT INTO guesses VALUES (59583,'find a blank cd',12,'find','a blank cd','find a blank cd',2,12739,1,1,2);
INSERT INTO guesses VALUES (59584,'put the cd into your computer',12,'put','the cd into your computer','put the cd into your computer',1,12739,1,2,1);
INSERT INTO guesses VALUES (59585,'put the cd in your computer',12,'put','the cd in your computer','put the cd in your computer',1,12739,1,2,1);
INSERT INTO guesses VALUES (59586,'open up a cd-burning software',12,'open','up a cd-burning software','open up a cd-burning software',1,12739,1,3,1);
INSERT INTO guesses VALUES (59587,'finger',12,'','','finger',2,12740,2,1,11);
INSERT INTO guesses VALUES (59588,'knob',12,'','','knob',1,12740,2,2,1);
INSERT INTO guesses VALUES (59589,'button',12,'','','button',2,12740,2,3,11);
INSERT INTO guesses VALUES (59590,'remote',12,'','','remote',1,12740,2,4,1);
INSERT INTO guesses VALUES (59591,'mixer',12,'','','mixer',1,12740,2,5,1);
INSERT INTO guesses VALUES (59592,'receiver',12,'','','receiver',1,12740,2,6,1);
INSERT INTO guesses VALUES (59593,'bowl',12,'','','bowl',1,12742,2,1,1);
INSERT INTO guesses VALUES (59594,'pan',12,'','','pan',1,12742,2,2,1);
INSERT INTO guesses VALUES (59595,'stove',12,'','','stove',2,12742,2,3,2);
INSERT INTO guesses VALUES (59596,'spoon',12,'','','spoon',1,12742,2,4,1);
INSERT INTO guesses VALUES (59597,'knife',12,'','','knife',2,12742,2,5,10);
INSERT INTO guesses VALUES (59598,'hours',12,'','','hours',1,12745,3,1,1);
INSERT INTO guesses VALUES (59599,'minutes',12,'','','minutes',1,12745,3,2,1);
INSERT INTO guesses VALUES (59600,'to watch tv',12,'watch','tv','watch tv',2,12734,0,1,2);
INSERT INTO guesses VALUES (59601,'put the cd in the tray',12,'put','the cd in the tray','put the cd in the tray',1,12736,1,1,1);
INSERT INTO guesses VALUES (59602,'harness',12,'','','harness',1,12747,2,1,1);
INSERT INTO guesses VALUES (59603,'turn the volume button',12,'turn','the volume button','turn the volume button',1,12738,1,5,1);
INSERT INTO guesses VALUES (59604,'to get help solving a technical problem',12,'get','help solving a technical problem','get help solving a technical problem',1,12746,0,1,1);
INSERT INTO guesses VALUES (59605,'to get help',12,'get','help','get help',1,12746,0,2,1);
INSERT INTO guesses VALUES (59606,'to get assistance',12,'get','assistance','get assistance',1,12746,0,2,1);
INSERT INTO guesses VALUES (59607,'finger',12,'','','finger',3,12741,2,1,12);
INSERT INTO guesses VALUES (59608,'button',12,'','','button',3,12741,2,2,12);
INSERT INTO guesses VALUES (59609,'mixer',12,'','','mixer',2,12741,2,3,11);
INSERT INTO guesses VALUES (59610,'receiver',12,'','','receiver',1,12741,2,4,1);
INSERT INTO guesses VALUES (59611,'remote',12,'','','remote',1,12741,2,5,1);
INSERT INTO guesses VALUES (59612,'press the power button',12,'press','the power button','press the power button',1,12735,1,1,1);
INSERT INTO guesses VALUES (59613,'to have fun',12,'have','fun','have fun',1,12737,0,1,1);
INSERT INTO guesses VALUES (59614,'to relax',12,'to','relax','to relax',2,12737,0,2,3);
INSERT INTO guesses VALUES (59615,'to see the movie',12,'see','the movie','see the movie',1,12737,0,3,1);
INSERT INTO guesses VALUES (59616,'to be entertained',12,'be','entertained','be entertained',2,12737,0,4,3);
INSERT INTO guesses VALUES (59617,'find a remote control',12,'find','a remote control','find a remote control',1,12740,1,1,1);
INSERT INTO guesses VALUES (59618,'pick up the remote',12,'pick','up the remote','pick up the remote',1,12740,1,2,1);
INSERT INTO guesses VALUES (59619,'finger',12,'','','finger',1,12734,2,1,1);
INSERT INTO guesses VALUES (59620,'button',12,'','','button',1,12734,2,2,1);
INSERT INTO guesses VALUES (59621,'seconds-minutes',12,'','','seconds-minutes',4,12749,3,2,5);
INSERT INTO guesses VALUES (59622,'to make friends',12,'make','friends','make friends',1,12747,0,1,1);
INSERT INTO guesses VALUES (59623,'to be with your friends',12,'be','with your friends','be with your friends',1,12747,0,2,1);
INSERT INTO guesses VALUES (59624,'to have fun',12,'have','fun','have fun',1,12747,0,3,1);
INSERT INTO guesses VALUES (59625,'to celebrate your birthday',12,'celebrate','birthday','celebrate birthday',1,12747,0,4,1);
INSERT INTO guesses VALUES (59626,'seconds-minutes',12,'','','seconds-minutes',9,12750,3,1,65);
INSERT INTO guesses VALUES (59627,'minutes-hours',12,'','','minutes-hours',2,12745,3,3,3);
INSERT INTO guesses VALUES (59628,'seconds-minutes',12,'','','seconds-minutes',2,12745,3,4,3);
INSERT INTO guesses VALUES (59629,'vhs',12,'','','vhs',1,12748,2,1,1);
INSERT INTO guesses VALUES (59630,'dvd-r',12,'','','dvd-r',1,12748,2,2,1);
INSERT INTO guesses VALUES (59631,'dvd',12,'','','dvd',1,12748,2,3,1);
INSERT INTO guesses VALUES (59632,'remote',12,'','','remote',1,12748,2,4,1);
INSERT INTO guesses VALUES (59633,'find a cd',12,'find','a cd','find a cd',1,12739,1,4,1);
INSERT INTO guesses VALUES (59634,'put the cd into your computer\'s cd-r tray',12,'put','the cd into your computer\'s cd-r tray','put the cd into your computer\'s cd-r tray',1,12739,1,5,1);
INSERT INTO guesses VALUES (59635,'find a cd-r',12,'find','a cd-r','find a cd-r',1,12739,1,6,1);
INSERT INTO guesses VALUES (59636,'find a blank cd-r',12,'find','a blank cd-r','find a blank cd-r',1,12739,1,7,1);
INSERT INTO guesses VALUES (59637,'find a blank cd-rw',12,'find','a blank cd-rw','find a blank cd-rw',1,12739,1,8,1);
INSERT INTO guesses VALUES (59638,'computer',12,'','','computer',4,12745,2,1,28);
INSERT INTO guesses VALUES (59639,'laptop',12,'','','laptop',1,12745,2,2,1);
INSERT INTO guesses VALUES (59640,'overhead projector',12,'overhead','projector','overhead projector',1,12745,2,3,1);
INSERT INTO guesses VALUES (59641,'slides',12,'','','slides',4,12745,2,4,28);
INSERT INTO guesses VALUES (59642,'presentation',12,'','','presentation',1,12745,2,5,1);
INSERT INTO guesses VALUES (59643,'props',12,'','','props',1,12745,2,6,1);
INSERT INTO guesses VALUES (59644,'microphone',12,'','','microphone',2,12745,2,7,10);
INSERT INTO guesses VALUES (59645,'laser pointer',12,'laser','pointer','laser pointer',1,12745,2,8,1);
INSERT INTO guesses VALUES (59646,'seconds-minutes',12,'','','seconds-minutes',2,12738,3,1,4);
INSERT INTO guesses VALUES (59647,'moments-seconds',12,'','','moments-seconds',2,12738,3,2,4);
INSERT INTO guesses VALUES (59648,'minutes-hours',12,'','','minutes-hours',3,12743,3,3,4);
INSERT INTO guesses VALUES (59649,'moments-seconds',12,'','','moments-seconds',2,12735,3,1,3);
INSERT INTO guesses VALUES (59650,'find a cd',12,'find','a cd','find a cd',1,12750,1,1,2);
INSERT INTO guesses VALUES (59651,'to play music',12,'play','music','play music',2,12735,0,1,11);
INSERT INTO guesses VALUES (59652,'to hear sound',12,'hear','sound','hear sound',3,12735,0,2,13);
INSERT INTO guesses VALUES (59653,'to hear the sound from a movie',12,'hear','the sound from a movie','hear the sound from a movie',1,12735,0,3,2);
INSERT INTO guesses VALUES (59654,'to hear the radio',12,'hear','the radio','hear the radio',1,12735,0,4,2);
INSERT INTO guesses VALUES (59655,'finger',12,'','','finger',1,12738,2,1,2);
INSERT INTO guesses VALUES (59656,'remote',12,'','','remote',2,12738,2,2,3);
INSERT INTO guesses VALUES (59657,'button',12,'','','button',1,12738,2,3,2);
INSERT INTO guesses VALUES (59658,'television',12,'','','television',1,12738,2,4,2);
INSERT INTO guesses VALUES (59659,'receiver',12,'','','receiver',1,12738,2,5,2);
INSERT INTO guesses VALUES (59660,'ipod',12,'','','ipod',1,12738,2,6,2);
INSERT INTO guesses VALUES (59661,'get a remote',12,'get','a remote','get a remote',1,12740,1,3,2);
INSERT INTO guesses VALUES (59662,'turn the knob',12,'turn','the knob','turn the knob',1,12740,1,4,2);
INSERT INTO guesses VALUES (59663,'get a vhs',12,'get','a vhs','get a vhs',1,12748,1,1,2);
INSERT INTO guesses VALUES (59664,'get a dvd',12,'get','a dvd','get a dvd',1,12748,1,2,2);
INSERT INTO guesses VALUES (59665,'set your vhs to record the show',12,'set','your vhs to record the show','set your vhs to record the show',1,12748,1,3,2);
INSERT INTO guesses VALUES (59666,'look up the show\'s time',12,'look','up the show\'s time','look up the show\'s time',1,12748,1,4,2);
INSERT INTO guesses VALUES (59667,'automobile',12,'','','automobile',1,12747,0,5,2);
INSERT INTO guesses VALUES (59668,'car',12,'','','car',1,12747,0,5,2);
INSERT INTO guesses VALUES (59669,'to get laid',12,'get','laid','get laid',1,12747,0,6,2);
INSERT INTO guesses VALUES (59670,'to get a laid',12,'get','a laid','get a laid',1,12747,0,6,2);
INSERT INTO guesses VALUES (59671,'watch televsion',12,'watch','televsion','watch televsion',1,12744,2,1,2);
INSERT INTO guesses VALUES (59672,'read a book',12,'read','a book','read a book',1,12744,2,2,2);
INSERT INTO guesses VALUES (59673,'take a bath',12,'take','a bath','take a bath',1,12744,2,3,2);
INSERT INTO guesses VALUES (59674,'seconds-minutes',12,'','','seconds-minutes',1,12739,3,1,2);
INSERT INTO guesses VALUES (59675,'get a blank cd',12,'get','a blank cd','get a blank cd',2,12750,1,2,3);
INSERT INTO guesses VALUES (59676,'find a computer',12,'find','a computer','find a computer',1,12750,1,3,2);
INSERT INTO guesses VALUES (59677,'put a cd into the computer',12,'put','a cd into the computer','put a cd into the computer',1,12750,1,4,2);
INSERT INTO guesses VALUES (59678,'find the remote',12,'find','the remote','find the remote',2,12734,1,1,12);
INSERT INTO guesses VALUES (59679,'turn the button',12,'turn','the button','turn the button',1,12734,1,2,2);
INSERT INTO guesses VALUES (59680,'hours-days',12,'','','hours-days',13,12744,3,1,115);
INSERT INTO guesses VALUES (59681,'minutes-hours',12,'','','minutes-hours',1,12748,3,3,2);
INSERT INTO guesses VALUES (59682,'moments-seconds',12,'','','moments-seconds',8,12734,3,1,43);
INSERT INTO guesses VALUES (59683,'buy food',12,'buy','food','buy food',1,12747,1,1,2);
INSERT INTO guesses VALUES (59684,'call your friends',12,'call','your friends','call your friends',1,12747,1,2,2);
INSERT INTO guesses VALUES (59685,'send out invitations',12,'send','out invitations','send out invitations',1,12747,1,3,2);
INSERT INTO guesses VALUES (59686,'seconds-minutes',12,'','','seconds-minutes',4,12736,3,1,34);
INSERT INTO guesses VALUES (59687,'headphones',12,'','','headphones',2,12743,2,1,2);
INSERT INTO guesses VALUES (59688,'speakers',12,'','','speakers',2,12743,2,2,2);
INSERT INTO guesses VALUES (59689,'cd-player',12,'','','cd-player',1,12743,2,3,1);
INSERT INTO guesses VALUES (59690,'mp3 player',12,'mp3','player','mp3 player',1,12743,2,4,1);
INSERT INTO guesses VALUES (59691,'power amp',12,'power','amp','power amp',1,12743,2,5,1);
INSERT INTO guesses VALUES (59692,'moments-seconds',12,'','','moments-seconds',1,12741,3,2,1);
INSERT INTO guesses VALUES (59693,'finger',12,'','','finger',1,12735,2,1,1);
INSERT INTO guesses VALUES (59694,'remote',12,'','','remote',1,12735,2,2,1);
INSERT INTO guesses VALUES (59695,'remote control',12,'remote','control','remote control',1,12735,2,3,1);
INSERT INTO guesses VALUES (59696,'stereo',12,'','','stereo',1,12735,2,4,1);
INSERT INTO guesses VALUES (59697,'to spread information',12,'spread','information','spread information',1,12745,0,1,1);
INSERT INTO guesses VALUES (59698,'to get paid',12,'get','paid','get paid',1,12745,0,2,1);
INSERT INTO guesses VALUES (59699,'to educate the next generation',12,'educate','the next generation','educate the next generation',1,12745,0,3,1);
INSERT INTO guesses VALUES (59700,'to educate your students',12,'educate','students','educate students',1,12745,0,4,1);
INSERT INTO guesses VALUES (59701,'get a cd-r',12,'get','a cd-r','get a cd-r',1,12750,1,5,1);
INSERT INTO guesses VALUES (59702,'get a cd',12,'get','a cd','get a cd',1,12750,1,6,1);
INSERT INTO guesses VALUES (59703,'vcr',12,'','','vcr',1,12748,2,5,1);
INSERT INTO guesses VALUES (59704,'dvr',12,'','','dvr',1,12748,2,6,1);
INSERT INTO guesses VALUES (59705,'to relax',12,'to','relax','to relax',2,12743,0,1,6);
INSERT INTO guesses VALUES (59706,'to enjoy the music',12,'enjoy','the music','enjoy the music',1,12743,0,2,1);
INSERT INTO guesses VALUES (59707,'to have fun',12,'have','fun','have fun',1,12743,0,3,1);
INSERT INTO guesses VALUES (59708,'to hear the music',12,'hear','the music','hear the music',1,12743,0,4,1);
INSERT INTO guesses VALUES (59709,'to hear it',12,'hear','it','hear it',1,12743,0,5,1);
INSERT INTO guesses VALUES (59710,'get a cd',12,'get','a cd','get a cd',2,12736,1,2,3);
INSERT INTO guesses VALUES (59711,'seconds-minutes',12,'','','seconds-minutes',2,12753,3,1,2);
INSERT INTO guesses VALUES (59712,'open up itunes',12,'open','up itunes','open up itunes',1,12751,1,1,1);
INSERT INTO guesses VALUES (59713,'test',12,'','','test',1,12753,2,1,1);
INSERT INTO guesses VALUES (59714,'finger',12,'','','finger',1,12750,2,1,1);
INSERT INTO guesses VALUES (59715,'button',12,'','','button',1,12750,2,2,1);
INSERT INTO guesses VALUES (59716,'you will miss it',12,'you','will miss it','you will miss it',1,12748,0,1,2);
INSERT INTO guesses VALUES (59717,'you like tv',12,'like','tv','like tv',1,12748,0,2,2);
INSERT INTO guesses VALUES (59718,'the show is duringthe day',12,'show','is duringthe day','show is duringthe day',1,12748,0,3,2);
INSERT INTO guesses VALUES (59719,'the show is awesome',12,'show','is awesome','show is awesome',1,12748,0,4,2);
INSERT INTO guesses VALUES (59720,'a phone',12,'a','phone','a phone',1,12746,2,1,2);
INSERT INTO guesses VALUES (59721,'a phone book',12,'a','phone book','a phone book',1,12746,2,2,2);
INSERT INTO guesses VALUES (59722,'the back of the packaging',12,'the','back of the packaging','the back of the packaging',1,12746,2,3,2);
INSERT INTO guesses VALUES (59723,'some information',12,'some','information','some information',1,12746,2,4,2);
INSERT INTO guesses VALUES (59724,'cds',12,'','','cds',2,12754,2,1,4);
INSERT INTO guesses VALUES (59725,'a cd holder',12,'a','cd holder','a cd holder',1,12754,2,2,2);
INSERT INTO guesses VALUES (59726,'some space',12,'some','space','some space',1,12754,2,3,2);
INSERT INTO guesses VALUES (59727,'a catelog',12,'a','catelog','a catelog',1,12754,2,4,2);
INSERT INTO guesses VALUES (59728,'a cd store',12,'a','cd store','a cd store',1,12754,2,5,2);
INSERT INTO guesses VALUES (59729,'convert tapes to cd',12,'convert','tapes to cd','convert tapes to cd',1,12754,2,6,2);
INSERT INTO guesses VALUES (59730,'to teach',12,'to','teach','to teach',1,12745,0,5,2);
INSERT INTO guesses VALUES (59731,'pots',12,'','','pots',4,12742,2,6,21);
INSERT INTO guesses VALUES (59732,'pans',12,'','','pans',4,12742,2,2,21);
INSERT INTO guesses VALUES (59733,'oven',12,'','','oven',3,12742,2,7,12);
INSERT INTO guesses VALUES (59734,'vegetabls',12,'','','vegetabls',1,12742,2,8,2);
INSERT INTO guesses VALUES (59735,'vegetables',12,'','','vegetables',1,12742,2,9,2);
INSERT INTO guesses VALUES (59736,'water',12,'','','water',1,12742,2,10,2);
INSERT INTO guesses VALUES (59737,'microwave',12,'','','microwave',2,12742,2,11,11);
INSERT INTO guesses VALUES (59738,'garlic press',12,'garlic','press','garlic press',1,12742,2,12,2);
INSERT INTO guesses VALUES (59739,'to feel the music',12,'feel','the music','feel the music',1,12740,0,1,2);
INSERT INTO guesses VALUES (59740,'to hear the bassline',12,'hear','the bassline','hear the bassline',1,12740,0,2,2);
INSERT INTO guesses VALUES (59741,'to annoy people',12,'annoy','people','annoy people',1,12740,0,3,2);
INSERT INTO guesses VALUES (59742,'to dance',12,'to','dance','to dance',1,12740,0,4,2);
INSERT INTO guesses VALUES (59743,'minutes-hours',12,'','','minutes-hours',9,12750,3,2,74);
INSERT INTO guesses VALUES (59744,'to eat',12,'to','eat','to eat',1,12742,0,4,2);
INSERT INTO guesses VALUES (59745,'for your children',12,'desire','your children','desire your children',1,12742,0,5,2);
INSERT INTO guesses VALUES (59746,'because its dinner time',12,'because','its dinner time','because its dinner time',1,12742,0,6,2);
INSERT INTO guesses VALUES (59747,'to be creative',12,'be','creative','be creative',1,12742,0,7,2);
INSERT INTO guesses VALUES (59748,'get a blank cd',12,'get','a blank cd','get a blank cd',1,12739,1,9,3);
INSERT INTO guesses VALUES (59749,'put the cd into the drive',12,'put','the cd into the drive','put the cd into the drive',1,12739,1,10,3);
INSERT INTO guesses VALUES (59750,'get a computer',12,'get','a computer','get a computer',1,12739,1,11,3);
INSERT INTO guesses VALUES (59751,'seconds-minutes',12,'','','seconds-minutes',6,12734,3,2,32);
INSERT INTO guesses VALUES (59752,'to hear more bass',12,'hear','more bass','hear more bass',1,12740,0,5,2);
INSERT INTO guesses VALUES (59753,'to relax',12,'to','relax','to relax',5,12755,0,1,29);
INSERT INTO guesses VALUES (59754,'to spend time with family',12,'spend','time with family','spend time with family',2,12755,0,2,8);
INSERT INTO guesses VALUES (59755,'to enjoy yourself',12,'enjoy','yourself','enjoy yourself',1,12755,0,3,1);
INSERT INTO guesses VALUES (59756,'to see a new part of the world',12,'see','a new part of the world','see a new part of the world',2,12755,0,4,8);
INSERT INTO guesses VALUES (59757,'shelves',12,'','','shelves',1,12754,2,7,2);
INSERT INTO guesses VALUES (59758,'cabinets',12,'','','cabinets',1,12754,2,8,2);
INSERT INTO guesses VALUES (59759,'search a torrent site',12,'search','a torrent site','search a torrent site',1,12751,1,2,3);
INSERT INTO guesses VALUES (59760,'access the internet',12,'access','the internet','access the internet',1,12751,1,3,3);
INSERT INTO guesses VALUES (59761,'download a torrent',12,'download','a torrent','download a torrent',1,12751,1,4,3);
INSERT INTO guesses VALUES (59762,'have a computer',12,'desire','computer','desire computer',1,12751,1,5,4);
INSERT INTO guesses VALUES (59763,'go to itunes',12,'go','to itunes','go to itunes',1,12751,1,6,4);
INSERT INTO guesses VALUES (59764,'open itunes',12,'open','itunes','open itunes',1,12751,1,1,4);
INSERT INTO guesses VALUES (59765,'buy a cd',12,'buy','a cd','buy a cd',1,12743,0,1,4);
INSERT INTO guesses VALUES (59766,'turn on the radio',12,'turn','on the radio','turn on the radio',1,12743,0,2,5);
INSERT INTO guesses VALUES (59767,'to rest',12,'to','rest','to rest',2,12743,0,4,10);
INSERT INTO guesses VALUES (59768,'to have a party',12,'have','a party','have a party',1,12743,0,5,5);
INSERT INTO guesses VALUES (59769,'to pass the time while jogging',12,'pass','the time while jogging','pass the time while jogging',1,12743,0,6,5);
INSERT INTO guesses VALUES (59770,'find a phone',12,'find','a phone','find a phone',1,12757,1,1,6);
INSERT INTO guesses VALUES (59771,'pick up the phone',12,'pick','up the phone','pick up the phone',2,12757,1,2,12);
INSERT INTO guesses VALUES (59772,'pick up a phone',12,'pick','up a phone','pick up a phone',1,12757,1,2,6);
INSERT INTO guesses VALUES (59773,'find a cellphone',12,'find','a cellphone','find a cellphone',1,12757,1,3,6);
INSERT INTO guesses VALUES (59774,'dial numbers',12,'dial','numbers','dial numbers',1,12757,1,4,6);
INSERT INTO guesses VALUES (59775,'dial a number',12,'dial','a number','dial a number',1,12757,1,4,6);
INSERT INTO guesses VALUES (59776,'catch the phone',12,'catch','the phone','catch the phone',1,12757,1,5,6);
INSERT INTO guesses VALUES (59777,'have the number',12,'desire','number','desire number',1,12757,1,6,6);
INSERT INTO guesses VALUES (59778,'dial the number',12,'dial','the number','dial the number',1,12757,1,4,6);
INSERT INTO guesses VALUES (59779,'get the phone',12,'get','the phone','get the phone',1,12757,1,7,6);
INSERT INTO guesses VALUES (59780,'remember a person\'s number',12,'remember','a person\'s number','remember a person\'s number',1,12757,1,8,6);
INSERT INTO guesses VALUES (59781,'have a phone',12,'desire','phone','desire phone',1,12757,1,9,6);
INSERT INTO guesses VALUES (59782,'find a number',12,'find','a number','find a number',1,12757,1,10,7);
INSERT INTO guesses VALUES (59783,'look up a phone number',12,'look','up a phone number','look up a phone number',1,12757,1,11,7);
INSERT INTO guesses VALUES (59784,'to rest',12,'to','rest','to rest',3,12755,0,2,21);
INSERT INTO guesses VALUES (59785,'to enjoy your time off',12,'enjoy','time off','enjoy time off',1,12755,0,3,7);
INSERT INTO guesses VALUES (59786,'to get away from work',12,'get','away from work','get away from work',1,12755,0,4,7);
INSERT INTO guesses VALUES (59787,'to have good time',12,'have','good time','have good time',1,12755,0,6,7);
INSERT INTO guesses VALUES (59788,'to have fun',12,'have','fun','have fun',1,12755,0,7,7);
INSERT INTO guesses VALUES (59789,'to see a new place',12,'see','a new place','see a new place',1,12755,0,9,7);
INSERT INTO guesses VALUES (59790,'to take a break',12,'take','a break','take a break',1,12755,0,2,7);
INSERT INTO guesses VALUES (59791,'to go to a remote location',12,'go','to a remote location','go to a remote location',1,12755,0,10,7);
INSERT INTO guesses VALUES (59792,'to know new places',12,'know','new places','know new places',2,12755,0,11,14);
INSERT INTO guesses VALUES (59793,'to meet new people',12,'meet','new people','meet new people',1,12755,0,12,7);
INSERT INTO guesses VALUES (59794,'minutes-hours',12,'','','minutes-hours',9,12758,3,1,72);
INSERT INTO guesses VALUES (59795,'seconds-minutes',12,'','','seconds-minutes',3,12758,3,2,24);
INSERT INTO guesses VALUES (59796,'tv',12,'','','tv',5,12737,2,1,40);
INSERT INTO guesses VALUES (59797,'movie',12,'','','movie',1,12737,2,2,8);
INSERT INTO guesses VALUES (59798,'television',12,'','','television',2,12737,2,1,16);
INSERT INTO guesses VALUES (59799,'vcr',12,'','','vcr',1,12737,2,3,8);
INSERT INTO guesses VALUES (59800,'popcorn',12,'','','popcorn',2,12737,2,4,16);
INSERT INTO guesses VALUES (59801,'dvd',12,'','','dvd',4,12737,2,5,32);
INSERT INTO guesses VALUES (59802,'dvd player',12,'dvd','player','dvd player',2,12737,2,6,16);
INSERT INTO guesses VALUES (59803,'movie tape',12,'movie','tape','movie tape',1,12737,2,7,8);
INSERT INTO guesses VALUES (59804,'computer',12,'','','computer',1,12737,2,8,8);
INSERT INTO guesses VALUES (59805,'monitor',12,'','','monitor',1,12737,2,9,8);
INSERT INTO guesses VALUES (59806,'remote controle',12,'remote','controle','remote controle',1,12737,2,10,8);
INSERT INTO guesses VALUES (59807,'a television',12,'a','television','a television',1,12737,2,1,8);
INSERT INTO guesses VALUES (59808,'a dvd player',12,'a','dvd player','a dvd player',1,12737,2,6,8);
INSERT INTO guesses VALUES (59809,'remote control',12,'remote','control','remote control',1,12737,2,11,8);
INSERT INTO guesses VALUES (59810,'sound system',12,'sound','system','sound system',1,12737,2,12,8);
INSERT INTO guesses VALUES (59811,'dvd disc',12,'dvd','disc','dvd disc',1,12737,2,13,8);
INSERT INTO guesses VALUES (59812,'go to the movies',12,'go','to the movies','go to the movies',1,12737,2,14,8);
INSERT INTO guesses VALUES (59813,'a videocassette player',12,'a','videocassette player','a videocassette player',1,12737,2,15,8);
INSERT INTO guesses VALUES (59814,'to hear music',12,'hear','music','hear music',1,12739,0,2,8);
INSERT INTO guesses VALUES (59815,'make a dvd',12,'make','a dvd','make a dvd',1,12739,0,3,8);
INSERT INTO guesses VALUES (59816,'save data',12,'save','data','save data',4,12739,0,4,32);
INSERT INTO guesses VALUES (59817,'record files',12,'record','files','record files',1,12739,0,5,8);
INSERT INTO guesses VALUES (59818,'to save some data',12,'save','some data','save some data',1,12739,0,4,8);
INSERT INTO guesses VALUES (59819,'to backup',12,'to','backup','to backup',1,12739,0,6,8);
INSERT INTO guesses VALUES (59820,'to make a movie',12,'make','a movie','make a movie',1,12739,0,7,8);
INSERT INTO guesses VALUES (59821,'save files',12,'save','files','save files',1,12739,0,8,8);
INSERT INTO guesses VALUES (59822,'to make a back up',12,'make','a back up','make a back up',1,12739,0,9,8);
INSERT INTO guesses VALUES (59823,'to make backups',12,'make','backups','make backups',1,12739,0,10,8);
INSERT INTO guesses VALUES (59824,'back up data',12,'back','up data','back up data',1,12739,0,11,8);
INSERT INTO guesses VALUES (59825,'save music',12,'save','music','save music',1,12739,0,12,8);
INSERT INTO guesses VALUES (59826,'carry data',12,'carry','data','carry data',1,12739,0,13,8);
INSERT INTO guesses VALUES (59827,'back up files',12,'back','up files','back up files',1,12739,0,14,8);
INSERT INTO guesses VALUES (59828,'to give files to someone else',12,'give','files to someone else','give files to someone else',1,12739,0,15,8);
INSERT INTO guesses VALUES (59829,'didn\'t liked',12,'t','liked','t liked',1,12739,0,16,8);
INSERT INTO guesses VALUES (59830,'make a cd with music',12,'make','a cd with music','make a cd with music',1,12739,0,17,8);
INSERT INTO guesses VALUES (59831,'to have a security copy',12,'have','a security copy','have a security copy',1,12739,0,18,8);
INSERT INTO guesses VALUES (59832,'to storage',12,'to','storage','to storage',1,12739,0,19,8);
INSERT INTO guesses VALUES (59833,'backup',12,'','','backup',1,12739,0,6,8);
INSERT INTO guesses VALUES (59834,'backup data',12,'backup','data','backup data',1,12739,0,20,8);
INSERT INTO guesses VALUES (59835,'for food for dinner',12,'desire','food for dinner','desire food for dinner',1,12756,0,1,8);
INSERT INTO guesses VALUES (59836,'to eat',12,'to','eat','to eat',3,12756,0,2,25);
INSERT INTO guesses VALUES (59837,'toeat',12,'','','toeat',1,12756,0,3,8);
INSERT INTO guesses VALUES (59838,'to get food',12,'get','food','get food',1,12756,0,4,8);
INSERT INTO guesses VALUES (59839,'because you are hungry',12,'you','are hungry','you are hungry',1,12756,0,5,8);
INSERT INTO guesses VALUES (59840,'to eat food',12,'eat','food','eat food',1,12756,0,6,8);
INSERT INTO guesses VALUES (59841,'to get fat',12,'get','fat','get fat',2,12756,0,7,17);
INSERT INTO guesses VALUES (59842,'to pick up food',12,'pick','up food','pick up food',1,12756,0,8,8);
INSERT INTO guesses VALUES (59843,'for lunch',12,'desire','lunch','desire lunch',1,12756,0,9,8);
INSERT INTO guesses VALUES (59844,'for breakfast',12,'desire','breakfast','desire breakfast',1,12756,0,10,8);
INSERT INTO guesses VALUES (59845,'to make dinner',12,'make','dinner','make dinner',1,12756,0,11,8);
INSERT INTO guesses VALUES (59846,'to buy',12,'to','buy','to buy',1,12756,0,12,8);
INSERT INTO guesses VALUES (59847,'because you need food',12,'because','you need food','because you need food',1,12756,0,13,8);
INSERT INTO guesses VALUES (59848,'to have some candies',12,'have','some candies','have some candies',1,12756,0,14,8);
INSERT INTO guesses VALUES (59849,'to make food',12,'make','food','make food',1,12756,0,15,8);
INSERT INTO guesses VALUES (59850,'because i\'m hungry',12,'because','i am hungry','because i am hungry',1,12756,0,16,9);
INSERT INTO guesses VALUES (59851,'to copy it',12,'copy','it','copy it',1,12749,0,1,9);
INSERT INTO guesses VALUES (59852,'to make a movie',12,'make','a movie','make a movie',1,12749,0,2,9);
INSERT INTO guesses VALUES (59853,'to own it',12,'own','it','own it',1,12749,0,3,9);
INSERT INTO guesses VALUES (59854,'to watch a movie',12,'watch','a movie','watch a movie',5,12749,0,4,47);
INSERT INTO guesses VALUES (59855,'backup',12,'','','backup',1,12749,0,5,9);
INSERT INTO guesses VALUES (59856,'to copy a movie',12,'copy','a movie','copy a movie',1,12749,0,6,9);
INSERT INTO guesses VALUES (59857,'to watch it again',12,'watch','it again','watch it again',1,12749,0,7,9);
INSERT INTO guesses VALUES (59858,'save',12,'','','save',1,12749,0,8,9);
INSERT INTO guesses VALUES (59859,'data',12,'','','data',1,12749,0,9,9);
INSERT INTO guesses VALUES (59860,'to save data',12,'save','data','save data',5,12749,0,10,47);
INSERT INTO guesses VALUES (59861,'to have a security copy',12,'have','a security copy','have a security copy',1,12749,0,11,9);
INSERT INTO guesses VALUES (59862,'to wacth a movie',12,'wacth','a movie','wacth a movie',1,12749,0,12,9);
INSERT INTO guesses VALUES (59863,'to give to a friend',12,'give','to a friend','give to a friend',1,12749,0,13,9);
INSERT INTO guesses VALUES (59864,'so you have your own copy',12,'have','your own copy','have your own copy',1,12749,0,14,9);
INSERT INTO guesses VALUES (59865,'to listening',12,'to','listening','to listening',2,12749,0,15,19);
INSERT INTO guesses VALUES (59866,'life',12,'','','life',1,12749,0,16,9);
INSERT INTO guesses VALUES (59867,'to backup a computer',12,'backup','a computer','backup a computer',1,12749,0,17,9);
INSERT INTO guesses VALUES (59868,'prepare notes',12,'prepare','notes','prepare notes',1,12745,1,1,8);
INSERT INTO guesses VALUES (59869,'prepare slides',12,'prepare','slides','prepare slides',3,12745,1,2,24);
INSERT INTO guesses VALUES (59870,'study',12,'','','study',2,12745,1,3,17);
INSERT INTO guesses VALUES (59871,'write a paper',12,'write','a paper','write a paper',1,12745,1,4,8);
INSERT INTO guesses VALUES (59872,'read',12,'','','read',1,12745,1,5,8);
INSERT INTO guesses VALUES (59873,'practice',12,'','','practice',1,12745,1,6,8);
INSERT INTO guesses VALUES (59874,'practice talk',12,'practice','talk','practice talk',1,12745,1,7,8);
INSERT INTO guesses VALUES (59875,'prepare some slides',12,'prepare','some slides','prepare some slides',1,12745,1,2,8);
INSERT INTO guesses VALUES (59876,'get your computer',12,'get','your computer','get your computer',1,12745,1,8,9);
INSERT INTO guesses VALUES (59877,'train',12,'','','train',1,12745,1,9,9);
INSERT INTO guesses VALUES (59878,'prepare yourself',12,'prepare','yourself','prepare yourself',1,12745,1,10,9);
INSERT INTO guesses VALUES (59879,'buy a book',12,'buy','a book','buy a book',1,12745,1,11,9);
INSERT INTO guesses VALUES (59880,'reserve a room',12,'reserve','a room','reserve a room',1,12745,1,12,9);
INSERT INTO guesses VALUES (59881,'have a room',12,'desire','room','desire room',1,12745,1,13,9);
INSERT INTO guesses VALUES (59882,'have a book',12,'desire','book','desire book',1,12745,1,14,9);
INSERT INTO guesses VALUES (59883,'plan',12,'','','plan',1,12745,1,15,9);
INSERT INTO guesses VALUES (59884,'minutes-hours',12,'','','minutes-hours',16,12744,3,1,150);
INSERT INTO guesses VALUES (59885,'seconds-minutes',12,'','','seconds-minutes',8,12744,3,3,75);
INSERT INTO guesses VALUES (59886,'volume knob',12,'volume','knob','volume knob',1,12740,2,1,10);
INSERT INTO guesses VALUES (59887,'stereo',12,'','','stereo',1,12740,2,2,10);
INSERT INTO guesses VALUES (59888,'volume buttons',12,'volume','buttons','volume buttons',1,12740,2,3,10);
INSERT INTO guesses VALUES (59889,'car stereo',12,'car','stereo','car stereo',1,12740,2,4,10);
INSERT INTO guesses VALUES (59890,'take the button',12,'take','the button','take the button',1,12740,2,5,10);
INSERT INTO guesses VALUES (59891,'control the volume',12,'control','the volume','control the volume',1,12740,2,6,10);
INSERT INTO guesses VALUES (59892,'an amplifier',12,'an','amplifier','an amplifier',1,12740,2,7,10);
INSERT INTO guesses VALUES (59893,'control',12,'','','control',1,12740,2,8,10);
INSERT INTO guesses VALUES (59894,'to plugin',12,'to','plugin','to plugin',1,12740,2,9,10);
INSERT INTO guesses VALUES (59895,'guitar',12,'','','guitar',1,12740,2,10,10);
INSERT INTO guesses VALUES (59896,'remote control',12,'remote','control','remote control',1,12740,2,11,10);
INSERT INTO guesses VALUES (59897,'my finger',12,'my','finger','my finger',1,12740,2,12,10);
INSERT INTO guesses VALUES (59898,'have a better sound',12,'desire','better sound','desire better sound',1,12740,2,13,10);
INSERT INTO guesses VALUES (59899,'to play',12,'to','play','to play',1,12740,2,15,10);
INSERT INTO guesses VALUES (59900,'on',12,'','','on',1,12740,2,16,10);
INSERT INTO guesses VALUES (59901,'minutes-hours',12,'','','minutes-hours',13,12746,3,1,112);
INSERT INTO guesses VALUES (59902,'seconds-minutes',12,'','','seconds-minutes',9,12746,3,2,81);
INSERT INTO guesses VALUES (59903,'moments-seconds',12,'','','moments-seconds',4,12746,3,3,31);
INSERT INTO guesses VALUES (59904,'hours-days',12,'','','hours-days',5,12746,3,4,33);
INSERT INTO guesses VALUES (59905,'minutes-hours',12,'','','minutes-hours',9,12736,3,1,99);
INSERT INTO guesses VALUES (59906,'moments-seconds',12,'','','moments-seconds',2,12736,3,3,22);
INSERT INTO guesses VALUES (59907,'hours-days',12,'','','hours-days',2,12736,3,4,22);
INSERT INTO guesses VALUES (59908,'months-years',12,'','','months-years',1,12736,3,5,11);
INSERT INTO guesses VALUES (59909,'to watch it',12,'watch','it','watch it',1,12748,0,1,11);
INSERT INTO guesses VALUES (59910,'to watch it later',12,'watch','it later','watch it later',3,12748,0,1,33);
INSERT INTO guesses VALUES (59911,'to see after',12,'see','after','see after',2,12748,0,2,22);
INSERT INTO guesses VALUES (59912,'to store',12,'to','store','to store',1,12748,0,3,11);
INSERT INTO guesses VALUES (59913,'to watch later',12,'watch','later','watch later',1,12748,0,1,11);
INSERT INTO guesses VALUES (59914,'because you were busy',12,'because','you were busy','because you were busy',1,12748,0,4,11);
INSERT INTO guesses VALUES (59915,'to give to a friend',12,'give','to a friend','give to a friend',1,12748,0,5,11);
INSERT INTO guesses VALUES (59916,'to see it again later',12,'see','it again later','see it again later',1,12748,0,6,11);
INSERT INTO guesses VALUES (59917,'because you couldn\'t watch it',12,'because','youn\'t watch it','because youn\'t watch it',1,12748,0,7,11);
INSERT INTO guesses VALUES (59918,'to watch the sexy parts',12,'watch','the sexy parts','watch the sexy parts',1,12748,0,8,11);
INSERT INTO guesses VALUES (59919,'see again',12,'see','again','see again',1,12748,0,6,11);
INSERT INTO guesses VALUES (59920,'because someone else was watching tv',12,'because','someone else was watching tv','because someone else was watching tv',1,12748,0,9,11);
INSERT INTO guesses VALUES (59921,'to show someone',12,'show','someone','show someone',1,12748,0,10,11);
INSERT INTO guesses VALUES (59922,'to see later',12,'see','later','see later',1,12748,0,6,11);
INSERT INTO guesses VALUES (59923,'moment',12,'','','moment',1,12748,0,11,11);
INSERT INTO guesses VALUES (59924,'to see it after',12,'see','it after','see it after',1,12748,0,2,11);
INSERT INTO guesses VALUES (59925,'because you were out',12,'because','you were out','because you were out',1,12748,0,12,11);
INSERT INTO guesses VALUES (59926,'liked',12,'','','liked',1,12748,0,13,11);
INSERT INTO guesses VALUES (59927,'to watch it after',12,'watch','it after','watch it after',1,12748,0,14,11);
INSERT INTO guesses VALUES (59928,'look for it',12,'look','for it','look for it',1,12752,1,1,10);
INSERT INTO guesses VALUES (59929,'look around',12,'look','around','look around',2,12752,1,1,20);
INSERT INTO guesses VALUES (59930,'look in the couch',12,'look','in the couch','look in the couch',2,12752,1,2,21);
INSERT INTO guesses VALUES (59931,'ask',12,'','','ask',1,12752,1,3,10);
INSERT INTO guesses VALUES (59932,'look under the cushions',12,'look','under the cushions','look under the cushions',1,12752,1,4,11);
INSERT INTO guesses VALUES (59933,'look for',12,'look','for','look for',1,12752,1,1,11);
INSERT INTO guesses VALUES (59934,'stay up',12,'stay','up','stay up',1,12752,1,5,11);
INSERT INTO guesses VALUES (59935,'ask wife',12,'ask','wife','ask wife',1,12752,1,6,11);
INSERT INTO guesses VALUES (59936,'ask for someone',12,'ask','for someone','ask for someone',1,12752,1,7,11);
INSERT INTO guesses VALUES (59937,'ask child',12,'ask','child','ask child',1,12752,1,8,11);
INSERT INTO guesses VALUES (59938,'ask someone',12,'ask','someone','ask someone',2,12752,1,7,22);
INSERT INTO guesses VALUES (59939,'look under a table',12,'look','under a table','look under a table',1,12752,1,9,11);
INSERT INTO guesses VALUES (59940,'looking for',12,'looking','for','looking for',1,12752,1,1,11);
INSERT INTO guesses VALUES (59941,'see inside the shelves',12,'see','inside the shelves','see inside the shelves',1,12752,1,10,11);
INSERT INTO guesses VALUES (59942,'look under the sofa',12,'look','under the sofa','look under the sofa',1,12752,1,2,11);
INSERT INTO guesses VALUES (59943,'look by the tv',12,'look','by the tv','look by the tv',1,12752,1,11,11);
INSERT INTO guesses VALUES (59944,'under sofa',12,'under','sofa','under sofa',1,12752,1,12,11);
INSERT INTO guesses VALUES (59945,'look for the sofa',12,'look','for the sofa','look for the sofa',1,12752,1,2,11);
INSERT INTO guesses VALUES (59946,'sit up',12,'sit','up','sit up',1,12752,1,13,11);
INSERT INTO guesses VALUES (59947,'drinks',12,'','','drinks',4,12747,2,1,40);
INSERT INTO guesses VALUES (59948,'invitation',12,'','','invitation',1,12747,2,2,11);
INSERT INTO guesses VALUES (59949,'food',12,'','','food',9,12747,2,3,93);
INSERT INTO guesses VALUES (59950,'phone',12,'','','phone',3,12747,2,4,31);
INSERT INTO guesses VALUES (59951,'guestlist',12,'','','guestlist',1,12747,2,5,11);
INSERT INTO guesses VALUES (59952,'beer',12,'','','beer',2,12747,2,6,20);
INSERT INTO guesses VALUES (59953,'a house',12,'a','house','a house',1,12747,2,7,11);
INSERT INTO guesses VALUES (59954,'drink',12,'','','drink',2,12747,2,1,20);
INSERT INTO guesses VALUES (59955,'chips',12,'','','chips',1,12747,2,8,11);
INSERT INTO guesses VALUES (59956,'cards',12,'','','cards',1,12747,2,9,11);
INSERT INTO guesses VALUES (59957,'a room',12,'a','room','a room',1,12747,2,10,11);
INSERT INTO guesses VALUES (59958,'house',12,'','','house',3,12747,2,7,29);
INSERT INTO guesses VALUES (59959,'glasses',12,'','','glasses',1,12747,2,11,11);
INSERT INTO guesses VALUES (59960,'a place',12,'a','place','a place',1,12747,2,12,11);
INSERT INTO guesses VALUES (59961,'e-mail',12,'','','e-mail',1,12747,2,13,11);
INSERT INTO guesses VALUES (59962,'buy some food',12,'buy','some food','buy some food',1,12747,2,14,11);
INSERT INTO guesses VALUES (59963,'band',12,'','','band',2,12747,2,15,20);
INSERT INTO guesses VALUES (59964,'a friendly host',12,'a','friendly host','a friendly host',1,12747,2,16,11);
INSERT INTO guesses VALUES (59965,'music',12,'','','music',3,12747,2,17,31);
INSERT INTO guesses VALUES (59966,'money',12,'','','money',2,12747,2,18,20);
INSERT INTO guesses VALUES (59967,'calls',12,'','','calls',1,12747,2,4,11);
INSERT INTO guesses VALUES (59968,'table',12,'','','table',1,12747,2,19,11);
INSERT INTO guesses VALUES (59969,'invite people',12,'invite','people','invite people',1,12747,2,20,11);
INSERT INTO guesses VALUES (59970,'cd recorder',12,'cd','recorder','cd recorder',2,12753,2,1,19);
INSERT INTO guesses VALUES (59971,'computer',12,'','','computer',5,12753,2,2,52);
INSERT INTO guesses VALUES (59972,'a computer',12,'a','computer','a computer',5,12753,2,2,49);
INSERT INTO guesses VALUES (59973,'cd',12,'','','cd',5,12753,2,3,49);
INSERT INTO guesses VALUES (59974,'dc recorder',12,'dc','recorder','dc recorder',1,12753,2,4,11);
INSERT INTO guesses VALUES (59975,'burner',12,'','','burner',1,12753,2,5,11);
INSERT INTO guesses VALUES (59976,'burn',12,'','','burn',2,12753,2,6,19);
INSERT INTO guesses VALUES (59977,'cd writer',12,'cd','writer','cd writer',2,12753,2,7,22);
INSERT INTO guesses VALUES (59978,'a cd player',12,'a','cd player','a cd player',1,12753,2,8,11);
INSERT INTO guesses VALUES (59979,'driver',12,'','','driver',1,12753,2,9,11);
INSERT INTO guesses VALUES (59980,'a cd',12,'a','cd','a cd',1,12753,2,3,11);
INSERT INTO guesses VALUES (59981,'cd player',12,'cd','player','cd player',2,12753,2,8,19);
INSERT INTO guesses VALUES (59982,'cd media',12,'cd','media','cd media',2,12753,2,10,19);
INSERT INTO guesses VALUES (59983,'electricity',12,'','','electricity',1,12753,2,11,11);
INSERT INTO guesses VALUES (59984,'original cd',12,'original','cd','original cd',1,12753,2,12,11);
INSERT INTO guesses VALUES (59985,'a recorder',12,'a','recorder','a recorder',1,12753,2,13,11);
INSERT INTO guesses VALUES (59986,'cd image',12,'cd','image','cd image',1,12753,2,14,11);
INSERT INTO guesses VALUES (59987,'cd rom',12,'cd','rom','cd rom',1,12753,2,15,11);
INSERT INTO guesses VALUES (59988,'media',12,'','','media',1,12753,2,16,11);
INSERT INTO guesses VALUES (59989,'a cd recorder',12,'a','cd recorder','a cd recorder',1,12753,2,1,11);
INSERT INTO guesses VALUES (59990,'a phone set',12,'a','phone set','a phone set',1,12753,2,17,11);
INSERT INTO guesses VALUES (59991,'grab the tv changer',12,'grab','the tv changer','grab the tv changer',1,12734,1,1,10);
INSERT INTO guesses VALUES (59992,'plug it in',12,'plug','it in','plug it in',1,12734,1,2,10);
INSERT INTO guesses VALUES (59993,'press the right button',12,'press','the right button','press the right button',1,12734,1,3,10);
INSERT INTO guesses VALUES (59994,'remote control',12,'remote','control','remote control',1,12734,1,4,10);
INSERT INTO guesses VALUES (59995,'press a button',12,'press','a button','press a button',1,12734,1,3,10);
INSERT INTO guesses VALUES (59996,'turn on the power',12,'turn','on the power','turn on the power',1,12734,1,6,10);
INSERT INTO guesses VALUES (59997,'press the button',12,'press','the button','press the button',1,12734,1,3,10);
INSERT INTO guesses VALUES (59998,'remote controller',12,'remote','controller','remote controller',1,12734,1,4,10);
INSERT INTO guesses VALUES (59999,'a remote control',12,'a','remote control','a remote control',1,12734,1,4,10);
INSERT INTO guesses VALUES (60000,'plug in',12,'plug','in','plug in',1,12734,1,2,10);
INSERT INTO guesses VALUES (60001,'push the botton',12,'push','the botton','push the botton',1,12734,1,7,10);
INSERT INTO guesses VALUES (60002,'button',12,'','','button',1,12734,1,8,10);
INSERT INTO guesses VALUES (60003,'get the remote control',12,'get','the remote control','get the remote control',1,12734,1,9,10);
INSERT INTO guesses VALUES (60004,'push the button',12,'push','the button','push the button',1,12734,1,10,10);
INSERT INTO guesses VALUES (60005,'use a remote control',12,'use','a remote control','use a remote control',1,12734,1,4,10);
INSERT INTO guesses VALUES (60006,'find the remote control',12,'find','the remote control','find the remote control',1,12734,1,11,10);
INSERT INTO guesses VALUES (60007,'plug it',12,'plug','it','plug it',1,12734,1,2,10);
INSERT INTO guesses VALUES (60008,'press button',12,'press','button','press button',1,12734,1,3,10);
INSERT INTO guesses VALUES (60009,'ask to wife',12,'ask','to wife','ask to wife',1,12734,1,12,10);
INSERT INTO guesses VALUES (60010,'ask your wife',12,'ask','your wife','ask your wife',1,12734,1,13,10);
INSERT INTO guesses VALUES (60011,'turn on the tv',12,'turn','on the tv','turn on the tv',1,12734,1,14,10);
INSERT INTO guesses VALUES (60012,'use a computer',12,'use','a computer','use a computer',1,12734,1,15,10);
INSERT INTO guesses VALUES (60013,'to hear music',12,'hear','music','hear music',8,12735,0,1,76);
INSERT INTO guesses VALUES (60014,'to listen to music',12,'listen','to music','listen to music',7,12735,0,2,58);
INSERT INTO guesses VALUES (60015,'the remote control',12,'the','remote control','the remote control',1,12735,0,3,9);
INSERT INTO guesses VALUES (60016,'to have fun',12,'have','fun','have fun',2,12735,0,4,18);
INSERT INTO guesses VALUES (60017,'to relax',12,'to','relax','to relax',2,12735,0,5,19);
INSERT INTO guesses VALUES (60018,'to listen to a cd',12,'listen','to a cd','listen to a cd',1,12735,0,6,9);
INSERT INTO guesses VALUES (60019,'a nice cd',12,'a','nice cd','a nice cd',2,12735,0,7,19);
INSERT INTO guesses VALUES (60020,'to listen',12,'to','listen','to listen',1,12735,0,8,9);
INSERT INTO guesses VALUES (60021,'press the button',12,'press','the button','press the button',1,12735,0,10,9);
INSERT INTO guesses VALUES (60022,'remote controller',12,'remote','controller','remote controller',2,12735,0,3,19);
INSERT INTO guesses VALUES (60023,'relax',12,'','','relax',2,12735,0,5,19);
INSERT INTO guesses VALUES (60024,'press de button',12,'press','de button','press de button',1,12735,0,11,9);
INSERT INTO guesses VALUES (60025,'listen news',12,'listen','news','listen news',1,12735,0,12,9);
INSERT INTO guesses VALUES (60026,'to listen to the radio',12,'listen','to the radio','listen to the radio',1,12735,0,13,9);
INSERT INTO guesses VALUES (60027,'press button',12,'press','button','press button',1,12735,0,10,9);
INSERT INTO guesses VALUES (60028,'to dance',12,'to','dance','to dance',3,12735,0,14,29);
INSERT INTO guesses VALUES (60029,'food',12,'','','food',8,12742,2,1,64);
INSERT INTO guesses VALUES (60030,'class',12,'','','class',1,12742,2,5,9);
INSERT INTO guesses VALUES (60031,'plates',12,'','','plates',1,12742,2,6,9);
INSERT INTO guesses VALUES (60032,'pot',12,'','','pot',1,12742,2,2,9);
INSERT INTO guesses VALUES (60033,'rice',12,'','','rice',1,12742,2,7,9);
INSERT INTO guesses VALUES (60034,'spatula',12,'','','spatula',1,12742,2,8,9);
INSERT INTO guesses VALUES (60035,'spices',12,'','','spices',2,12742,2,9,18);
INSERT INTO guesses VALUES (60036,'beans',12,'','','beans',1,12742,2,10,9);
INSERT INTO guesses VALUES (60037,'meat',12,'','','meat',3,12742,2,12,27);
INSERT INTO guesses VALUES (60038,'fire',12,'','','fire',2,12742,2,13,18);
INSERT INTO guesses VALUES (60039,'oil',12,'','','oil',2,12742,2,14,18);
INSERT INTO guesses VALUES (60040,'drink',12,'','','drink',1,12742,2,15,9);
INSERT INTO guesses VALUES (60041,'juice',12,'','','juice',1,12742,2,16,9);
INSERT INTO guesses VALUES (60042,'sugar',12,'','','sugar',1,12742,2,17,9);
INSERT INTO guesses VALUES (60043,'cans',12,'','','cans',1,12742,2,18,9);
INSERT INTO guesses VALUES (60044,'gas',12,'','','gas',1,12742,2,19,9);
INSERT INTO guesses VALUES (60045,'cook',12,'','','cook',1,12742,2,21,9);
INSERT INTO guesses VALUES (60046,'bread',12,'','','bread',1,12742,2,17,9);
INSERT INTO guesses VALUES (60047,'the music is too loud',12,'the','music is too loud','the music is too loud',1,12738,0,1,9);
INSERT INTO guesses VALUES (60048,'scream',12,'','','scream',1,12738,0,2,9);
INSERT INTO guesses VALUES (60049,'is loud',12,'is','loud','is loud',1,12738,0,3,9);
INSERT INTO guesses VALUES (60050,'to get calmer',12,'get','calmer','get calmer',1,12738,0,4,9);
INSERT INTO guesses VALUES (60051,'to sleep',12,'to','sleep','to sleep',4,12738,0,5,36);
INSERT INTO guesses VALUES (60052,'music is too loud',12,'music','is too loud','music is too loud',1,12738,0,1,9);
INSERT INTO guesses VALUES (60053,'to relax',12,'to','relax','to relax',2,12738,0,6,18);
INSERT INTO guesses VALUES (60054,'because the music is too loud',12,'because','the music is too loud','because the music is too loud',1,12738,0,1,9);
INSERT INTO guesses VALUES (60055,'to make less noise',12,'make','less noise','make less noise',1,12738,0,7,9);
INSERT INTO guesses VALUES (60056,'remote controller',12,'remote','controller','remote controller',1,12738,0,8,9);
INSERT INTO guesses VALUES (60057,'to save my hearing',12,'save','hearing','save hearing',1,12738,0,9,9);
INSERT INTO guesses VALUES (60058,'spin the button',12,'spin','the button','spin the button',1,12738,0,10,9);
INSERT INTO guesses VALUES (60059,'to hear a conversation',12,'hear','a conversation','hear a conversation',1,12738,0,11,9);
INSERT INTO guesses VALUES (60060,'to make everybody more comfortable',12,'make','everybody more comfortable','make everybody more comfortable',1,12738,0,12,9);
INSERT INTO guesses VALUES (60061,'to hear other things',12,'hear','other things','hear other things',1,12738,0,13,9);
INSERT INTO guesses VALUES (60062,'the telephone rings',12,'the','telephone rings','the telephone rings',1,12738,0,14,9);
INSERT INTO guesses VALUES (60063,'press button',12,'press','button','press button',1,12738,0,15,9);
INSERT INTO guesses VALUES (60064,'headache',12,'','','headache',1,12738,0,16,9);
INSERT INTO guesses VALUES (60065,'to talk at the phone',12,'talk','at the phone','talk at the phone',1,12738,0,17,9);
INSERT INTO guesses VALUES (60066,'to hear the violins',12,'hear','the violins','hear the violins',1,12741,0,1,9);
INSERT INTO guesses VALUES (60067,'to hear the trumpets',12,'hear','the trumpets','hear the trumpets',1,12741,0,2,9);
INSERT INTO guesses VALUES (60068,'to hear',12,'to','hear','to hear',1,12741,0,3,9);
INSERT INTO guesses VALUES (60069,'to hear a better sound',12,'hear','a better sound','hear a better sound',1,12741,0,4,9);
INSERT INTO guesses VALUES (60070,'remote controller',12,'remote','controller','remote controller',1,12741,0,5,9);
INSERT INTO guesses VALUES (60071,'to reduce the bass',12,'reduce','the bass','reduce the bass',1,12741,0,6,9);
INSERT INTO guesses VALUES (60072,'sleep',12,'','','sleep',1,12741,0,7,9);
INSERT INTO guesses VALUES (60073,'to fit the sound',12,'fit','the sound','fit the sound',1,12741,0,8,9);
INSERT INTO guesses VALUES (60074,'to have fun',12,'have','fun','have fun',1,12741,0,9,9);
INSERT INTO guesses VALUES (60075,'press button',12,'press','button','press button',1,12741,0,10,9);
INSERT INTO guesses VALUES (60076,'to quality',12,'to','quality','to quality',1,12741,0,11,9);
INSERT INTO guesses VALUES (60077,'to listen',12,'to','listen','to listen',1,12741,0,12,9);
INSERT INTO guesses VALUES (60078,'click button',12,'click','button','click button',1,12741,0,13,9);
INSERT INTO guesses VALUES (60079,'moments-seconds',12,'','','moments-seconds',2,12750,3,3,18);
INSERT INTO guesses VALUES (60080,'hours-days',12,'','','hours-days',3,12750,3,4,27);
INSERT INTO guesses VALUES (60081,'months-years',12,'','','months-years',1,12750,3,5,9);
INSERT INTO guesses VALUES (60082,'months-years',12,'','','months-years',2,12744,3,4,18);
INSERT INTO guesses VALUES (60083,'moments-seconds',12,'','','moments-seconds',2,12744,3,5,18);
INSERT INTO guesses VALUES (60084,'to study',12,'to','study','to study',1,12745,2,2,9);
INSERT INTO guesses VALUES (60085,'notes',12,'','','notes',1,12745,2,5,9);
INSERT INTO guesses VALUES (60086,'to prepare slides',12,'prepare','slides','prepare slides',1,12745,2,6,9);
INSERT INTO guesses VALUES (60087,'book',12,'','','book',2,12745,2,7,18);
INSERT INTO guesses VALUES (60088,'a laptop',12,'a','laptop','a laptop',1,12745,2,8,9);
INSERT INTO guesses VALUES (60089,'a pen',12,'a','pen','a pen',1,12745,2,9,9);
INSERT INTO guesses VALUES (60090,'make slides',12,'make','slides','make slides',1,12745,2,10,9);
INSERT INTO guesses VALUES (60091,'library',12,'','','library',1,12745,2,11,9);
INSERT INTO guesses VALUES (60092,'study',12,'','','study',1,12745,2,2,9);
INSERT INTO guesses VALUES (60093,'to plan',12,'to','plan','to plan',1,12745,2,12,9);
INSERT INTO guesses VALUES (60094,'laser pen',12,'laser','pen','laser pen',1,12745,2,13,9);
INSERT INTO guesses VALUES (60095,'a room',12,'a','room','a room',1,12745,2,14,9);
INSERT INTO guesses VALUES (60096,'a laser pointer',12,'a','laser pointer','a laser pointer',1,12745,2,15,9);
INSERT INTO guesses VALUES (60097,'light',12,'','','light',1,12745,2,16,9);
INSERT INTO guesses VALUES (60098,'paper',12,'','','paper',1,12745,2,17,9);
INSERT INTO guesses VALUES (60099,'university',12,'','','university',1,12745,2,18,9);
INSERT INTO guesses VALUES (60100,'a microfone',12,'a','microfone','a microfone',1,12745,2,19,9);
INSERT INTO guesses VALUES (60101,'my voice',12,'my','voice','my voice',1,12745,2,20,9);
INSERT INTO guesses VALUES (60102,'read book',12,'read','book','read book',1,12745,2,21,9);
INSERT INTO guesses VALUES (60103,'examples',12,'','','examples',1,12745,2,22,9);
INSERT INTO guesses VALUES (60104,'a remote control',12,'a','remote control','a remote control',1,12735,0,2,10);
INSERT INTO guesses VALUES (60105,'to rest',12,'to','rest','to rest',1,12735,0,4,10);
INSERT INTO guesses VALUES (60106,'toh hear better',12,'toh','hear better','toh hear better',1,12735,0,6,10);
INSERT INTO guesses VALUES (60107,'control',12,'','','control',1,12735,0,10,10);
INSERT INTO guesses VALUES (60108,'to sing',12,'to','sing','to sing',1,12735,0,11,10);
INSERT INTO guesses VALUES (60109,'phone set',12,'phone','set','phone set',1,12735,0,12,10);
INSERT INTO guesses VALUES (60110,'to play a cd',12,'play','a cd','play a cd',2,12735,0,13,20);
INSERT INTO guesses VALUES (60111,'to listening',12,'to','listening','to listening',1,12735,0,14,10);
INSERT INTO guesses VALUES (60112,'to hear better',12,'hear','better','hear better',1,12735,0,15,10);
INSERT INTO guesses VALUES (60113,'click a button',12,'click','a button','click a button',1,12735,0,16,10);
INSERT INTO guesses VALUES (60114,'to hear news',12,'hear','news','hear news',1,12735,0,17,10);
INSERT INTO guesses VALUES (60115,'a nice place to relax',12,'a','nice place to relax','a nice place to relax',1,12735,0,18,10);
INSERT INTO guesses VALUES (60116,'cd player',12,'cd','player','cd player',4,12736,2,1,40);
INSERT INTO guesses VALUES (60117,'a cd',12,'a','cd','a cd',2,12736,2,2,20);
INSERT INTO guesses VALUES (60118,'speakers',12,'','','speakers',2,12736,2,3,20);
INSERT INTO guesses VALUES (60119,'cd',12,'','','cd',2,12736,2,2,20);
INSERT INTO guesses VALUES (60120,'player',12,'','','player',1,12736,2,4,10);
INSERT INTO guesses VALUES (60121,'a cd player',12,'a','cd player','a cd player',2,12736,2,1,20);
INSERT INTO guesses VALUES (60122,'receiver',12,'','','receiver',1,12736,2,5,10);
INSERT INTO guesses VALUES (60123,'recorder',12,'','','recorder',1,12736,2,6,10);
INSERT INTO guesses VALUES (60124,'a computer',12,'a','computer','a computer',2,12736,2,7,20);
INSERT INTO guesses VALUES (60125,'stereo',12,'','','stereo',3,12736,2,8,30);
INSERT INTO guesses VALUES (60126,'power amp',12,'power','amp','power amp',1,12736,2,9,10);
INSERT INTO guesses VALUES (60127,'a play button',12,'a','play button','a play button',1,12736,2,10,10);
INSERT INTO guesses VALUES (60128,'a cd-player',12,'a','cd-player','a cd-player',1,12736,2,11,10);
INSERT INTO guesses VALUES (60129,'a stero set',12,'a','stero set','a stero set',1,12736,2,12,10);
INSERT INTO guesses VALUES (60130,'computer',12,'','','computer',2,12736,2,7,20);
INSERT INTO guesses VALUES (60131,'disk',12,'','','disk',1,12736,2,13,10);
INSERT INTO guesses VALUES (60132,'micro system',12,'micro','system','micro system',1,12736,2,14,10);
INSERT INTO guesses VALUES (60133,'an amplifier',12,'an','amplifier','an amplifier',1,12736,2,15,10);
INSERT INTO guesses VALUES (60134,'energy',12,'','','energy',1,12736,2,16,10);
INSERT INTO guesses VALUES (60135,'a remote control',12,'a','remote control','a remote control',1,12736,2,17,10);
INSERT INTO guesses VALUES (60136,'ipod',12,'','','ipod',1,12736,2,18,10);
INSERT INTO guesses VALUES (60137,'to hear better',12,'hear','better','hear better',1,12741,2,4,10);
INSERT INTO guesses VALUES (60138,'low',12,'','','low',1,12741,2,5,10);
INSERT INTO guesses VALUES (60139,'knob',12,'','','knob',1,12741,2,6,10);
INSERT INTO guesses VALUES (60140,'the hand',12,'the','hand','the hand',1,12741,2,7,10);
INSERT INTO guesses VALUES (60141,'high',12,'','','high',1,12741,2,8,10);
INSERT INTO guesses VALUES (60142,'press the button',12,'press','the button','press the button',1,12741,2,9,10);
INSERT INTO guesses VALUES (60143,'push the button',12,'push','the button','push the button',1,12741,2,10,10);
INSERT INTO guesses VALUES (60144,'turn on',12,'turn','on','turn on',1,12741,2,11,10);
INSERT INTO guesses VALUES (60145,'music',12,'','','music',1,12741,2,12,10);
INSERT INTO guesses VALUES (60146,'buttom',12,'','','buttom',1,12741,2,13,10);
INSERT INTO guesses VALUES (60147,'stereo',12,'','','stereo',1,12741,2,14,10);
INSERT INTO guesses VALUES (60148,'lever',12,'','','lever',1,12741,2,15,10);
INSERT INTO guesses VALUES (60149,'remote control',12,'remote','control','remote control',1,12741,2,16,10);
INSERT INTO guesses VALUES (60150,'dvd recorder',12,'dvd','recorder','dvd recorder',2,12749,0,1,20);
INSERT INTO guesses VALUES (60151,'computer',12,'','','computer',1,12749,0,3,10);
INSERT INTO guesses VALUES (60152,'burn',12,'','','burn',1,12749,0,5,10);
INSERT INTO guesses VALUES (60153,'recorder',12,'','','recorder',1,12749,0,7,10);
INSERT INTO guesses VALUES (60154,'disk',12,'','','disk',1,12749,0,8,10);
INSERT INTO guesses VALUES (60155,'to storage',12,'to','storage','to storage',1,12749,0,9,10);
INSERT INTO guesses VALUES (60156,'burner',12,'','','burner',1,12749,0,10,10);
INSERT INTO guesses VALUES (60157,'dvd burner',12,'dvd','burner','dvd burner',1,12749,0,11,10);
INSERT INTO guesses VALUES (60158,'save music',12,'save','music','save music',1,12749,0,12,10);
INSERT INTO guesses VALUES (60159,'to watch it',12,'watch','it','watch it',1,12749,0,13,10);
INSERT INTO guesses VALUES (60160,'to wacth later',12,'wacth','later','wacth later',1,12749,0,14,10);
INSERT INTO guesses VALUES (60161,'player',12,'','','player',1,12749,0,15,10);
INSERT INTO guesses VALUES (60162,'make a backup',12,'make','a backup','make a backup',1,12749,0,16,10);
INSERT INTO guesses VALUES (60163,'share it with a friend',12,'share','it with a friend','share it with a friend',1,12749,0,17,10);
INSERT INTO guesses VALUES (60164,'dvd rom',12,'dvd','rom','dvd rom',1,12749,0,18,10);
INSERT INTO guesses VALUES (60165,'liked',12,'','','liked',1,12749,0,19,10);
INSERT INTO guesses VALUES (60166,'to store',12,'to','store','to store',1,12749,0,9,10);
INSERT INTO guesses VALUES (60167,'sell it',12,'sell','it','sell it',1,12749,0,20,10);
INSERT INTO guesses VALUES (60168,'listen to music',12,'listen','to music','listen to music',1,12749,0,21,10);
INSERT INTO guesses VALUES (60169,'to have a copy',12,'have','a copy','have a copy',1,12749,0,22,10);
INSERT INTO guesses VALUES (60170,'make a bootleg',12,'make','a bootleg','make a bootleg',1,12749,0,23,10);
INSERT INTO guesses VALUES (60171,'to relax',12,'to','relax','to relax',1,12758,0,1,9);
INSERT INTO guesses VALUES (60172,'to fitness',12,'to','fitness','to fitness',1,12758,0,2,9);
INSERT INTO guesses VALUES (60173,'relax',12,'','','relax',1,12758,0,1,9);
INSERT INTO guesses VALUES (60174,'to fit',12,'to','fit','to fit',1,12758,0,3,9);
INSERT INTO guesses VALUES (60175,'to go out',12,'go','out','go out',1,12758,0,4,9);
INSERT INTO guesses VALUES (60176,'to walk',12,'to','walk','to walk',1,12758,0,5,9);
INSERT INTO guesses VALUES (60177,'it needs to make a pee',12,'it','needs to make a pee','it needs to make a pee',1,12758,0,6,9);
INSERT INTO guesses VALUES (60178,'exercise',12,'','','exercise',2,12758,0,7,18);
INSERT INTO guesses VALUES (60179,'to have a breath',12,'have','a breath','have a breath',1,12758,0,8,9);
INSERT INTO guesses VALUES (60180,'to trip',12,'to','trip','to trip',1,12758,0,9,9);
INSERT INTO guesses VALUES (60181,'to take abreak',12,'take','abreak','take abreak',1,12758,0,10,9);
INSERT INTO guesses VALUES (60182,'company',12,'','','company',1,12758,0,11,9);
INSERT INTO guesses VALUES (60183,'to happy',12,'to','happy','to happy',1,12758,0,12,9);
INSERT INTO guesses VALUES (60184,'to have a good health',12,'have','a good health','have a good health',1,12758,0,13,9);
INSERT INTO guesses VALUES (60185,'to waste time',12,'waste','time','waste time',1,12758,0,14,9);
INSERT INTO guesses VALUES (60186,'leisure',12,'','','leisure',1,12758,0,15,9);
INSERT INTO guesses VALUES (60187,'necessities',12,'','','necessities',1,12758,0,16,9);
INSERT INTO guesses VALUES (60188,'money',12,'','','money',1,12756,0,1,9);
INSERT INTO guesses VALUES (60189,'to make a dinner',12,'make','a dinner','make a dinner',1,12756,0,3,9);
INSERT INTO guesses VALUES (60190,'food',12,'','','food',2,12756,0,4,18);
INSERT INTO guesses VALUES (60191,'trader joe´s',12,'trader','joe´s','trader joe´s',1,12756,0,5,9);
INSERT INTO guesses VALUES (60192,'for eat',12,'desire','eat','desire eat',1,12756,0,2,9);
INSERT INTO guesses VALUES (60193,'buy',12,'','','buy',1,12756,0,6,9);
INSERT INTO guesses VALUES (60194,'to buy soft-drinks',12,'buy','soft-drinks','buy soft-drinks',1,12756,0,7,9);
INSERT INTO guesses VALUES (60195,'to stock the kitchen',12,'stock','the kitchen','stock the kitchen',1,12756,0,8,9);
INSERT INTO guesses VALUES (60196,'to have a party',12,'have','a party','have a party',1,12756,0,9,9);
INSERT INTO guesses VALUES (60197,'meat',12,'','','meat',1,12756,0,10,9);
INSERT INTO guesses VALUES (60198,'have fun',12,'need','fun','need fun',1,12756,0,11,9);
INSERT INTO guesses VALUES (60199,'to buy food',12,'buy','food','buy food',1,12756,0,12,9);
INSERT INTO guesses VALUES (60200,'a market place',12,'a','market place','a market place',1,12756,0,13,9);
INSERT INTO guesses VALUES (60201,'candy',12,'','','candy',1,12756,0,14,9);
INSERT INTO guesses VALUES (60202,'to be able to eat',12,'be','able to eat','be able to eat',1,12756,0,16,9);
INSERT INTO guesses VALUES (60203,'to buy goods',12,'buy','goods','buy goods',1,12756,0,17,9);
INSERT INTO guesses VALUES (60204,'just buy',12,'just','buy','just buy',1,12756,0,6,9);
INSERT INTO guesses VALUES (60205,'hunger',12,'','','hunger',1,12756,0,18,9);
INSERT INTO guesses VALUES (60206,'credit card',12,'credit','card','credit card',1,12756,0,19,9);
INSERT INTO guesses VALUES (60207,'seconds-minutes',12,'','','seconds-minutes',6,12752,3,1,47);
INSERT INTO guesses VALUES (60208,'moments-seconds',12,'','','moments-seconds',4,12752,3,2,36);
INSERT INTO guesses VALUES (60209,'minutes-hours',12,'','','minutes-hours',5,12752,3,3,45);
INSERT INTO guesses VALUES (60210,'hours-days',12,'','','hours-days',3,12752,3,4,27);
INSERT INTO guesses VALUES (60211,'decorations',12,'','','decorations',1,12747,2,5,9);
INSERT INTO guesses VALUES (60212,'sugar',12,'','','sugar',1,12747,2,7,9);
INSERT INTO guesses VALUES (60213,'a home',12,'a','home','a home',1,12747,2,8,9);
INSERT INTO guesses VALUES (60214,'friends',12,'','','friends',1,12747,2,9,9);
INSERT INTO guesses VALUES (60215,'greeting',12,'','','greeting',1,12747,2,12,9);
INSERT INTO guesses VALUES (60216,'soft drinks',12,'soft','drinks','soft drinks',1,12747,2,13,9);
INSERT INTO guesses VALUES (60217,'soft drink',12,'soft','drink','soft drink',1,12747,2,13,9);
INSERT INTO guesses VALUES (60218,'make a grocery list',12,'make','a grocery list','make a grocery list',1,12742,1,1,9);
INSERT INTO guesses VALUES (60219,'cook',12,'','','cook',1,12742,1,2,9);
INSERT INTO guesses VALUES (60220,'call friends',12,'call','friends','call friends',1,12742,1,3,9);
INSERT INTO guesses VALUES (60221,'sugar',12,'','','sugar',1,12742,1,4,10);
INSERT INTO guesses VALUES (60222,'buy food',12,'buy','food','buy food',3,12742,1,5,30);
INSERT INTO guesses VALUES (60223,'food',12,'','','food',3,12742,1,6,30);
INSERT INTO guesses VALUES (60224,'invete friends',12,'invete','friends','invete friends',1,12742,1,7,10);
INSERT INTO guesses VALUES (60225,'buy wine',12,'buy','wine','buy wine',1,12742,1,8,10);
INSERT INTO guesses VALUES (60226,'meat',12,'','','meat',2,12742,1,9,20);
INSERT INTO guesses VALUES (60227,'prepare dishes',12,'prepare','dishes','prepare dishes',1,12742,1,10,10);
INSERT INTO guesses VALUES (60228,'water',12,'','','water',1,12742,1,11,10);
INSERT INTO guesses VALUES (60229,'prepare food',12,'prepare','food','prepare food',1,12742,1,12,10);
INSERT INTO guesses VALUES (60230,'invite people',12,'invite','people','invite people',1,12742,1,13,10);
INSERT INTO guesses VALUES (60231,'drink',12,'','','drink',1,12742,1,14,10);
INSERT INTO guesses VALUES (60232,'go into the kitchen',12,'go','into the kitchen','go into the kitchen',1,12742,1,15,10);
INSERT INTO guesses VALUES (60233,'get the fire',12,'get','the fire','get the fire',1,12742,1,16,10);
INSERT INTO guesses VALUES (60234,'to save data',12,'save','data','save data',3,12750,0,1,27);
INSERT INTO guesses VALUES (60235,'to storage',12,'to','storage','to storage',1,12750,0,2,9);
INSERT INTO guesses VALUES (60236,'ah....cansou...............',12,'','','ah....cansou...............',1,12750,0,3,9);
INSERT INTO guesses VALUES (60237,'to backup',12,'to','backup','to backup',1,12750,0,4,9);
INSERT INTO guesses VALUES (60238,'recorder',12,'','','recorder',1,12750,0,5,9);
INSERT INTO guesses VALUES (60239,'to keep',12,'to','keep','to keep',1,12750,0,6,9);
INSERT INTO guesses VALUES (60240,'burner',12,'','','burner',1,12750,0,7,9);
INSERT INTO guesses VALUES (60241,'listen to music',12,'listen','to music','listen to music',1,12750,0,8,9);
INSERT INTO guesses VALUES (60242,'to have a security copy',12,'have','a security copy','have a security copy',1,12750,0,9,9);
INSERT INTO guesses VALUES (60243,'cd media',12,'cd','media','cd media',1,12750,0,10,9);
INSERT INTO guesses VALUES (60244,'backup',12,'','','backup',1,12750,0,4,9);
INSERT INTO guesses VALUES (60245,'to make a back up',12,'make','a back up','make a back up',1,12750,0,11,9);
INSERT INTO guesses VALUES (60246,'copy',12,'','','copy',1,12750,0,12,9);
INSERT INTO guesses VALUES (60247,'liked',12,'','','liked',1,12750,0,13,9);
INSERT INTO guesses VALUES (60248,'image',12,'','','image',1,12750,0,14,9);
INSERT INTO guesses VALUES (60249,'back up',12,'back','up','back up',1,12750,0,15,9);
INSERT INTO guesses VALUES (60250,'iso',12,'','','iso',1,12750,0,16,9);
INSERT INTO guesses VALUES (60251,'to carry',12,'to','carry','to carry',1,12750,0,17,9);
INSERT INTO guesses VALUES (60252,'have my own cd',12,'have','own cd','have own cd',1,12750,0,18,9);
INSERT INTO guesses VALUES (60253,'turn on the tv',12,'turn','on the tv','turn on the tv',1,12737,1,1,8);
INSERT INTO guesses VALUES (60254,'go to the cinema',12,'go','to the cinema','go to the cinema',2,12737,1,2,18);
INSERT INTO guesses VALUES (60255,'go to the movies',12,'go','to the movies','go to the movies',2,12737,1,3,18);
INSERT INTO guesses VALUES (60256,'rent a movie',12,'rent','a movie','rent a movie',1,12737,1,4,9);
INSERT INTO guesses VALUES (60257,'have a dvd player',12,'desire','dvd player','desire dvd player',1,12737,1,5,9);
INSERT INTO guesses VALUES (60258,'rent a video',12,'rent','a video','rent a video',1,12737,1,6,9);
INSERT INTO guesses VALUES (60259,'pay the ticket',12,'pay','the ticket','pay the ticket',1,12737,1,7,9);
INSERT INTO guesses VALUES (60260,'rent a dvd',12,'rent','a dvd','rent a dvd',2,12737,1,8,18);
INSERT INTO guesses VALUES (60261,'have a dvd',12,'desire','dvd','desire dvd',1,12737,1,9,9);
INSERT INTO guesses VALUES (60262,'popcorn',12,'','','popcorn',1,12737,1,10,9);
INSERT INTO guesses VALUES (60263,'go to ovies',12,'go','to ovies','go to ovies',1,12737,1,11,9);
INSERT INTO guesses VALUES (60264,'buy some popcorn',12,'buy','some popcorn','buy some popcorn',1,12737,1,12,9);
INSERT INTO guesses VALUES (60265,'have the movie',12,'desire','movie','desire movie',1,12737,1,13,9);
INSERT INTO guesses VALUES (60266,'minutes-hours',12,'','','minutes-hours',4,12734,3,3,25);
INSERT INTO guesses VALUES (60267,'hours-days',12,'','','hours-days',2,12734,3,4,9);
INSERT INTO guesses VALUES (60268,'image',12,'','','image',1,12753,2,4,8);
INSERT INTO guesses VALUES (60269,'recorder',12,'','','recorder',1,12753,2,6,8);
INSERT INTO guesses VALUES (60270,'record cd',12,'record','cd','record cd',1,12753,2,7,8);
INSERT INTO guesses VALUES (60271,'tape recorder',12,'tape','recorder','tape recorder',1,12753,2,9,8);
INSERT INTO guesses VALUES (60272,'me',12,'','','me',1,12751,0,1,5);
INSERT INTO guesses VALUES (60273,'to watch',12,'to','watch','to watch',1,12751,0,2,5);
INSERT INTO guesses VALUES (60274,'a person who wated to watch it',12,'a','person who wated to watch it','a person who wated to watch it',1,12751,0,3,5);
INSERT INTO guesses VALUES (60275,'to keep it',12,'keep','it','keep it',1,12751,0,4,5);
INSERT INTO guesses VALUES (60276,'a person who made dvds',12,'a','person who made dvds','a person who made dvds',1,12751,0,5,5);
INSERT INTO guesses VALUES (60277,'to see',12,'to','see','to see',1,12751,0,6,5);
INSERT INTO guesses VALUES (60278,'minutes-hours',12,'','','minutes-hours',1,12738,3,3,3);
INSERT INTO guesses VALUES (60279,'hours-days',12,'','','hours-days',1,12738,3,4,3);
INSERT INTO guesses VALUES (60280,'ask you boss',12,'ask','you boss','ask you boss',1,12755,1,1,2);
INSERT INTO guesses VALUES (60281,'quit job',12,'quit','job','quit job',1,12755,1,2,2);
INSERT INTO guesses VALUES (60282,'trip',12,'','','trip',1,12755,1,3,2);
INSERT INTO guesses VALUES (60283,'download manager',12,'download','manager','download manager',1,12751,2,1,2);
INSERT INTO guesses VALUES (60284,'computer',12,'','','computer',1,12751,2,2,2);
INSERT INTO guesses VALUES (60285,'internet',12,'','','internet',1,12751,2,3,2);
INSERT INTO guesses VALUES (60286,'have fun',12,'need','fun','need fun',1,12747,0,3,2);
INSERT INTO guesses VALUES (60287,'meet women',12,'meet','women','meet women',1,12747,0,7,2);
INSERT INTO guesses VALUES (60288,'drink',12,'','','drink',1,12747,0,8,2);
INSERT INTO guesses VALUES (60289,'be popular',12,'be','popular','be popular',1,12747,0,9,2);
INSERT INTO guesses VALUES (60290,'moments-seconds',12,'','','moments-seconds',1,12740,3,3,2);
INSERT INTO guesses VALUES (60291,'arrange my music',12,'arrange','my music','arrange my music',1,12754,0,1,2);
INSERT INTO guesses VALUES (60292,'easily find music',12,'easily','find music','easily find music',1,12754,0,2,2);
INSERT INTO guesses VALUES (60293,'clean up my room',12,'clean','up my room','clean up my room',1,12754,0,3,2);
INSERT INTO guesses VALUES (60294,'eat',12,'','','eat',1,12742,0,4,2);
INSERT INTO guesses VALUES (60295,'hang out',12,'hang','out','hang out',1,12742,0,8,2);
INSERT INTO guesses VALUES (60296,'make love after eating',12,'make','love after eating','make love after eating',1,12742,0,9,2);
INSERT INTO guesses VALUES (60297,'minutes-hours',12,'','','minutes-hours',1,12756,3,1,2);
INSERT INTO guesses VALUES (60298,'to make music portable',12,'make','music portable','make music portable',1,12750,0,19,2);
INSERT INTO guesses VALUES (60299,'listen in the car',12,'listen','in the car','listen in the car',1,12750,0,20,2);
INSERT INTO guesses VALUES (60300,'gift it',12,'gift','it','gift it',1,12750,0,21,2);
INSERT INTO guesses VALUES (60301,'seconds-minutes',12,'','','seconds-minutes',1,12757,3,1,1);
INSERT INTO guesses VALUES (60302,'minutes-hours',12,'','','minutes-hours',1,12742,3,3,2);
INSERT INTO guesses VALUES (60303,'a computer',12,'a','computer','a computer',1,12743,2,6,1);
INSERT INTO guesses VALUES (60304,'a stereo',12,'a','stereo','a stereo',1,12743,2,7,1);
INSERT INTO guesses VALUES (60305,'ears',12,'','','ears',1,12743,2,8,1);
INSERT INTO guesses VALUES (60306,'radio',12,'','','radio',1,12743,2,9,1);
INSERT INTO guesses VALUES (60307,'cd player',12,'cd','player','cd player',1,12743,2,10,1);
INSERT INTO guesses VALUES (60308,'airplane ticket',12,'airplane','ticket','airplane ticket',1,12755,2,1,1);
INSERT INTO guesses VALUES (60309,'money',12,'','','money',1,12755,2,2,1);
INSERT INTO guesses VALUES (60310,'sunblock',12,'','','sunblock',1,12755,2,3,1);
INSERT INTO guesses VALUES (60311,'suitcase',12,'','','suitcase',1,12755,2,4,1);
INSERT INTO guesses VALUES (60312,'car',12,'','','car',1,12755,2,5,1);
INSERT INTO guesses VALUES (60313,'family',12,'','','family',1,12755,2,6,1);
INSERT INTO guesses VALUES (60314,'phone',12,'','','phone',1,12746,2,1,1);
INSERT INTO guesses VALUES (60315,'upload cd',12,'upload','cd','upload cd',1,12753,1,1,1);
INSERT INTO guesses VALUES (60316,'burn cd',12,'burn','cd','burn cd',1,12753,1,2,1);
INSERT INTO guesses VALUES (60317,'store information',12,'store','information','store information',1,12753,1,3,1);
INSERT INTO guesses VALUES (60318,'spool cd',12,'spool','cd','spool cd',1,12753,1,4,1);
INSERT INTO guesses VALUES (60319,'to watch a program',12,'watch','a program','watch a program',1,12734,0,2,1);
INSERT INTO guesses VALUES (60320,'to see something',12,'see','something','see something',1,12734,0,3,1);
INSERT INTO guesses VALUES (60321,'to relax',12,'to','relax','to relax',1,12734,0,4,2);
INSERT INTO guesses VALUES (60322,'leash',12,'','','leash',1,12758,2,1,2);
INSERT INTO guesses VALUES (60323,'collar',12,'','','collar',1,12758,2,1,2);
INSERT INTO guesses VALUES (60324,'patience',12,'','','patience',1,12758,2,2,2);
INSERT INTO guesses VALUES (60325,'turn on the power',12,'turn','on the power','turn on the power',1,12736,1,3,2);
INSERT INTO guesses VALUES (60326,'dial',12,'','','dial',1,12738,2,7,1);
INSERT INTO guesses VALUES (60327,'hand',12,'','','hand',1,12738,2,8,1);
INSERT INTO guesses VALUES (60328,'to eliminate stress',12,'eliminate','stress','eliminate stress',1,12744,0,1,1);
INSERT INTO guesses VALUES (60329,'to distance yourself from workplace responsibilites',12,'distance','yourself from workplace responsibilites','distance yourself from workplace responsibilites',1,12744,0,2,1);
INSERT INTO guesses VALUES (60330,'utensils',12,'','','utensils',1,12742,2,21,1);
INSERT INTO guesses VALUES (60331,'heat',12,'','','heat',1,12742,2,22,1);
INSERT INTO guesses VALUES (60332,'ingredients',12,'','','ingredients',1,12742,2,23,1);
INSERT INTO guesses VALUES (60333,'measuring cups',12,'measuring','cups','measuring cups',1,12742,2,24,1);
INSERT INTO guesses VALUES (60334,'money',12,'','','money',1,12756,2,1,1);
INSERT INTO guesses VALUES (60335,'list',12,'','','list',1,12756,2,2,1);
INSERT INTO guesses VALUES (60336,'coupons',12,'','','coupons',1,12756,2,3,1);
INSERT INTO guesses VALUES (60337,'brochure',12,'','','brochure',1,12756,2,4,1);
INSERT INTO guesses VALUES (60338,'it is noisy',12,'it','is noisy','it is noisy',1,12738,0,3,2);
INSERT INTO guesses VALUES (60339,'i want to sleep',12,'i','want to sleep','i want to sleep',1,12738,0,18,2);
INSERT INTO guesses VALUES (60340,'fuck',12,'','','fuck',1,12738,0,19,2);
INSERT INTO guesses VALUES (60341,'months-years',12,'','','months-years',1,12746,3,5,1);
INSERT INTO guesses VALUES (60342,'sleep',12,'','','sleep',1,12744,2,4,1);
INSERT INTO guesses VALUES (60343,'to take a rest',12,'take','a rest','take a rest',1,12744,2,5,1);
INSERT INTO guesses VALUES (60344,'make a call',12,'make','a call','make a call',1,12757,1,12,1);
INSERT INTO guesses VALUES (60345,'to listen a music',12,'listen','a music','listen a music',1,12754,0,4,1);
INSERT INTO guesses VALUES (60346,'to live',12,'to','live','to live',1,12754,0,5,1);
INSERT INTO guesses VALUES (60347,'go to the computer',12,'go','to the computer','go to the computer',1,12749,1,1,1);
INSERT INTO guesses VALUES (60348,'get a dvd',12,'get','a dvd','get a dvd',1,12749,1,2,1);
INSERT INTO guesses VALUES (60349,'get the button',12,'get','the button','get the button',1,12738,1,6,2);
INSERT INTO guesses VALUES (60350,'turn the knob',12,'turn','the knob','turn the knob',2,12738,1,7,4);
INSERT INTO guesses VALUES (60351,'turn a knob',12,'turn','a knob','turn a knob',1,12738,1,7,2);
INSERT INTO guesses VALUES (60352,'call a travel agent',12,'call','a travel agent','call a travel agent',1,12755,1,4,2);
INSERT INTO guesses VALUES (60353,'fs',12,'','','fs',1,12756,1,1,2);
INSERT INTO guesses VALUES (60354,'dg',12,'','','dg',1,12756,1,2,2);
INSERT INTO guesses VALUES (60355,'gd',12,'','','gd',1,12756,1,3,2);
INSERT INTO guesses VALUES (60356,'fg',12,'','','fg',1,12756,1,4,2);
INSERT INTO guesses VALUES (60357,'sd',12,'','','sd',1,12735,1,2,2);
INSERT INTO guesses VALUES (60358,'put it in the drawer',12,'put','it in the drawer','put it in the drawer',1,12736,1,4,2);
INSERT INTO guesses VALUES (60359,'cut a record',12,'cut','a record','cut a record',1,12739,2,1,2);
INSERT INTO guesses VALUES (60360,'copy a cd',12,'copy','a cd','copy a cd',1,12739,2,2,2);
INSERT INTO guesses VALUES (60361,'push remocon',12,'push','remocon','push remocon',1,12735,1,3,1);
INSERT INTO guesses VALUES (60362,'turn off tv',12,'turn','off tv','turn off tv',1,12744,1,1,1);
INSERT INTO guesses VALUES (60363,'taking a shower',12,'taking','a shower','taking a shower',1,12744,1,2,1);
INSERT INTO guesses VALUES (60364,'to eat',12,'to','eat','to eat',1,12742,2,24,1);
INSERT INTO guesses VALUES (60365,'meat',12,'','','meat',1,12742,4,1,1);
INSERT INTO guesses VALUES (60366,'food',12,'','','food',1,12742,4,2,1);

--
-- Table structure for table `links`
--

CREATE TABLE links (
  draft_id int(11) NOT NULL default '0',
  page_id int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--


INSERT INTO links VALUES (23,4);
INSERT INTO links VALUES (24,4);
INSERT INTO links VALUES (25,4);
INSERT INTO links VALUES (26,4);
INSERT INTO links VALUES (27,4);
INSERT INTO links VALUES (28,4);
INSERT INTO links VALUES (29,4);
INSERT INTO links VALUES (30,4);
INSERT INTO links VALUES (43,6);
INSERT INTO links VALUES (46,6);
INSERT INTO links VALUES (47,6);
INSERT INTO links VALUES (48,6);
INSERT INTO links VALUES (49,6);
INSERT INTO links VALUES (51,6);
INSERT INTO links VALUES (55,6);
INSERT INTO links VALUES (55,7);
INSERT INTO links VALUES (55,8);
INSERT INTO links VALUES (55,9);
INSERT INTO links VALUES (56,4);
INSERT INTO links VALUES (57,4);
INSERT INTO links VALUES (59,6);
INSERT INTO links VALUES (59,7);
INSERT INTO links VALUES (59,8);
INSERT INTO links VALUES (59,9);
INSERT INTO links VALUES (60,6);
INSERT INTO links VALUES (60,7);
INSERT INTO links VALUES (60,8);
INSERT INTO links VALUES (60,9);
INSERT INTO links VALUES (61,6);
INSERT INTO links VALUES (61,7);
INSERT INTO links VALUES (61,8);
INSERT INTO links VALUES (61,9);
INSERT INTO links VALUES (62,6);
INSERT INTO links VALUES (62,7);
INSERT INTO links VALUES (62,8);
INSERT INTO links VALUES (62,9);
INSERT INTO links VALUES (64,6);
INSERT INTO links VALUES (64,10);
INSERT INTO links VALUES (66,6);
INSERT INTO links VALUES (66,11);
INSERT INTO links VALUES (68,6);
INSERT INTO links VALUES (68,12);
INSERT INTO links VALUES (69,7);
INSERT INTO links VALUES (69,8);
INSERT INTO links VALUES (69,9);
INSERT INTO links VALUES (70,7);
INSERT INTO links VALUES (70,8);
INSERT INTO links VALUES (70,9);
INSERT INTO links VALUES (78,6);
INSERT INTO links VALUES (78,12);
INSERT INTO links VALUES (79,6);
INSERT INTO links VALUES (79,12);
INSERT INTO links VALUES (80,6);
INSERT INTO links VALUES (80,12);
INSERT INTO links VALUES (81,6);
INSERT INTO links VALUES (81,12);
INSERT INTO links VALUES (82,6);
INSERT INTO links VALUES (82,12);
INSERT INTO links VALUES (85,13);
INSERT INTO links VALUES (85,6);
INSERT INTO links VALUES (85,12);
INSERT INTO links VALUES (86,13);
INSERT INTO links VALUES (86,6);
INSERT INTO links VALUES (86,12);
INSERT INTO links VALUES (87,13);
INSERT INTO links VALUES (87,6);
INSERT INTO links VALUES (87,12);
INSERT INTO links VALUES (88,13);
INSERT INTO links VALUES (88,6);
INSERT INTO links VALUES (88,12);

--
-- Table structure for table `pages`
--

CREATE TABLE pages (
  id int(10) unsigned NOT NULL auto_increment,
  created_at datetime NOT NULL default '0000-00-00 00:00:00',
  updated_at datetime NOT NULL default '0000-00-00 00:00:00',
  web_id int(11) NOT NULL default '0',
  locked_by varchar(60) default NULL,
  `name` varchar(60) default NULL,
  locked_at datetime default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--


INSERT INTO pages VALUES (1,'2005-11-30 20:27:00','2006-01-23 08:23:33',1,'Dustin','ProblemsWithOMCS',NULL);
INSERT INTO pages VALUES (2,'2005-11-30 11:54:57','2006-01-15 20:14:04',1,'AnonymousCoward','KnowledgeRepresentations',NULL);
INSERT INTO pages VALUES (3,'2005-11-30 11:55:45','2005-11-30 20:13:11',1,'Dustin','TaggerBugs',NULL);
INSERT INTO pages VALUES (4,'2005-12-11 19:09:51','2005-12-11 19:09:51',1,'Dustin','CommonsenseFeudGame',NULL);
INSERT INTO pages VALUES (5,'2005-11-30 20:50:26','2005-11-30 20:50:26',1,'dustin','FeudGame',NULL);
INSERT INTO pages VALUES (6,'2005-11-30 20:02:00','2006-01-22 18:30:24',1,'AnonymousCoward','RecentUpdates',NULL);
INSERT INTO pages VALUES (7,'2005-11-30 11:54:37','2006-01-15 21:08:41',1,'Dustin','BugTracking','2006-01-15 21:08:41');
INSERT INTO pages VALUES (8,'2005-11-30 11:53:58','2006-01-21 15:22:42',1,'Dustin','HomePage',NULL);
INSERT INTO pages VALUES (9,'2005-11-30 11:54:13','2006-02-06 00:06:24',1,'AnonymousCoward','ToDoList',NULL);
INSERT INTO pages VALUES (10,'2005-12-11 21:04:39','2006-01-15 13:11:57',1,'AnonymousCoward','UserFeedback',NULL);
INSERT INTO pages VALUES (11,'2006-01-13 08:47:28','2006-02-12 19:46:32',1,'AnonymousCoward','DomainsOfCommonsenseKnowledge','2006-02-12 19:46:32');
INSERT INTO pages VALUES (12,'2006-01-13 15:49:37','2006-01-13 15:49:37',1,NULL,'Dustin',NULL);
INSERT INTO pages VALUES (13,'2006-01-15 20:16:42','2006-01-15 22:20:59',1,'Dustin','SemanticParser',NULL);
INSERT INTO pages VALUES (14,'2006-01-21 15:23:19','2006-01-21 15:23:59',1,'Dustin','EpsilonEclipseSVN',NULL);
INSERT INTO pages VALUES (15,'2006-01-21 15:38:39','2006-01-21 15:38:39',1,NULL,'BootStrapping',NULL);

--
-- Table structure for table `quotes`
--

CREATE TABLE quotes (
  id int(11) NOT NULL auto_increment,
  author text,
  quote text,
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotes`
--


INSERT INTO quotes VALUES (1,'Oscar Wilde','The truth is rarely pure and never simple.');
INSERT INTO quotes VALUES (2,'Oscar Wilde','Only dull people are brilliant at breakfast.\r\n   ');
INSERT INTO quotes VALUES (3,'Andrew Tanenbaum','The nice thing about standards is that you have so many to choose from.');
INSERT INTO quotes VALUES (4,'Socrates','The only good is knowledge and the only evil is ignorance.');
INSERT INTO quotes VALUES (5,'Benjamin Disraeli','To be conscious that you are ignorant is a great step to knowledge.');
INSERT INTO quotes VALUES (6,'Bertrand Russell','There is much pleasure to be gained from useless knowledge.');
INSERT INTO quotes VALUES (7,'William Butler Yeats','Think like a wise man but communicate in the language of the people.');
INSERT INTO quotes VALUES (8,'Friedrich Nietzsche','Insanity in individuals is something rare - but in groups, parties, nations and epochs, it is the rule.');
INSERT INTO quotes VALUES (9,'Friedrich Nietzsche','Plato is Boring.');
INSERT INTO quotes VALUES (10,'George Carlin','There\'s no present. There\'s only the immediate future and the recent past.');
INSERT INTO quotes VALUES (12,'Bertrand Russell','Patriotism is the willingness to kill and be killed for trivial reasons.');
INSERT INTO quotes VALUES (13,'Bertrand Russell','The time you enjoy wasting is not wasted time.');
INSERT INTO quotes VALUES (14,'Woody Allen','Eighty percent of success is showing up.');
INSERT INTO quotes VALUES (15,'Woody Allen','Organized crime in America takes in over forty billion dollars a year and spends very little on office supplies.');
INSERT INTO quotes VALUES (16,'Woody Allen','You can live to be a hundred if you give up all the things that make you want to live to be a hundred.');

--
-- Table structure for table `revisions`
--

CREATE TABLE revisions (
  id int(10) unsigned NOT NULL auto_increment,
  created_at datetime NOT NULL default '0000-00-00 00:00:00',
  updated_at datetime NOT NULL default '0000-00-00 00:00:00',
  revised_at datetime NOT NULL default '0000-00-00 00:00:00',
  page_id int(11) NOT NULL default '0',
  content text NOT NULL,
  author varchar(60) default NULL,
  ip varchar(60) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `revisions`
--


INSERT INTO revisions VALUES (1,'2005-11-30 20:27:00','2006-01-23 08:12:56','2005-11-30 20:27:00',1,'Talk about the potential problems of commonsense knowledge representation so we can improve on this iteration.','AnonymousCoward','18.250.6.38');
INSERT INTO revisions VALUES (2,'2005-11-30 11:54:57','2005-11-30 11:54:57','2005-11-30 11:54:57',2,'Minsky lists a few realms of knowledge in \"EM-6.1\":http://web.media.mit.edu/~minsky/E6/eb6.html\n\n\n\nh3. Spatial\n\n\n\nDefine which entities can be found in each *setting*?\n\n\n\nh3. Social\n\n\n\nPeople, agents, and inanimate objects -- how to threat them, what to expect from them, etc.\n\n\n\nh3. Dominion\n\n\n\nIs this really a subset of Social?  Minsky explains the \"social\" relam as a kind-of self-extension, not so much in terms of multiple people.   Dominion expresses ownership of objects, who owns what, how pocession is transferred.\n\n\n\nh3.  Procedural\n\n\n\nI see our goal system as working toward this -- a \"script\" with the opportunity to branch.\n\n# what to do\n\n# what not to do\n\n# what to do when things go wrong\n\n\n\n\n\nh3.  Conversational Language\n\n\n\nA database of colloquialisms may be helpful.\n\n\n\n\n\nh3. Cognitive\n\n\n\nh3. Self-Knowledge\n\n------------\n\nh3. Adjective Clarification .\n\nWhen users\' entries have an adjective in their description (tagged as *JJ*), we can issue a question asking them to classify their description. ','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (3,'2005-11-30 20:25:48','2006-01-13 08:47:21','2005-11-30 20:25:48',2,'Minsky lists a few realms of knowledge in \"EM-6.1\":http://web.media.mit.edu/~minsky/E6/eb6.html\n\n# ProblemsWithOMCS\n\nh3. Spatial\n\n\n\nDefine which entities can be found in each *setting*?\n\n\n\nh3. Social\n\n\n\nPeople, agents, and inanimate objects -- how to threat them, what to expect from them, etc.\n\n\n\nh3. Dominion\n\n\n\nIs this really a subset of Social?  Minsky explains the \"social\" relam as a kind-of self-extension, not so much in terms of multiple people.   Dominion expresses ownership of objects, who owns what, how pocession is transferred.\n\n\n\nh3.  Procedural\n\n\n\nI see our goal system as working toward this -- a \"script\" with the opportunity to branch.\n\n# what to do\n\n# what not to do\n\n# what to do when things go wrong\n\n\n\n\n\nh3.  Conversational Language\n\n\n\nA database of colloquialisms may be helpful.\n\n\n\n\n\nh3. Cognitive\n\n\n\nh3. Self-Knowledge\n\n------------\n\nh3. Adjective Clarification .\n\nWhen users\' entries have an adjective in their description (tagged as *JJ*), we can issue a question asking them to classify their description. ','AnonymousCoward','18.250.6.38');
INSERT INTO revisions VALUES (4,'2005-11-30 11:55:45','2005-11-30 11:55:45','2005-11-30 11:55:45',3,'This tagger is somewhat of a POS :P  If you catch any errors, please post them here.\n\n|_tagger_|_flour the pan_|\n|*%{color:blue}Tree%*| VV DT VV |\n|*%{color:blue}Brill (WSJ)%*| NN NN NN |\n|*%{color:blue}Brill (BWN)%*| NN DT VBG |\n\n\n\n\np. *the/DT dog/NN bit/NN the/DT cat/NN*\n\n|_tagger_|_The dog bit the cat_|\n|*%{color:blue}Tree%*| DT NN NN DT NN |\n|*%{color:blue}Brill (WSJ)%*| JJ NN NN NN NN |\n|*%{color:blue}Brill (BWN)%*| DT NN NN DT NN |\n\n\nlook into Monty Lingua\'s correction for this\n\n\n|_tagger_|_I went to the Rolling Stones concert with Bob today_|\n|*%{color:blue}Tree%*| PP VVD TO DT NP NPS NN IN NP NN |\n|*%{color:blue}Brill (WSJ)%*| JJ NN NN NN VBG NNS VBP VBG NN NN |\n|*%{color:blue}Brill (BWN)%*| PRP VBD TO DT VBG NNS NN IN NN NN |\n\np.\n\n\n|_tagger_|_This is a test of the emergency tagging system_|\n|*%{color:blue}Tree%*| DT VBZ DT NN IN DT NN VVG NN |\n|*%{color:blue}Brill (WSJ)%*| JJ NN VBG JJS NN NN NN VBG NN |\n|*%{color:blue}Brill (BWN)%*| DT VBZ DT NN IN DT NN VBG NN |\n\n\nThe word tagging is part of a compound noun phrase and should not be lemmatized.','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (5,'2005-11-30 20:13:11','2005-11-30 20:13:11','2005-11-30 20:13:11',3,'I\'m still trying to decide which tagging method to use. The task is to reliably tag short, simple sentences -- given some goal/action expression, like \"meet the pope\", I want to identify verbs, modifiers, and nouns.  So far, I haven\'t been impressed by what the POS market has to offer.  Still to try are the LinkParse (CMU\'s) tagger built for Ruby and Hugo\'s MontyLingua.\n\n|_tagger_|_flour the pan_|\n|*%{color:blue}Tree%*| VV DT VV |\n|*%{color:blue}Brill (WSJ)%*| NN NN NN |\n|*%{color:blue}Brill (BWN)%*| NN DT VBG |\n\n\n\n\np. *the/DT dog/NN bit/NN the/DT cat/NN*\n\n|_tagger_|_The dog bit the cat_|\n|*%{color:blue}Tree%*| DT NN NN DT NN |\n|*%{color:blue}Brill (WSJ)%*| JJ NN NN NN NN |\n|*%{color:blue}Brill (BWN)%*| DT NN NN DT NN |\n\n\nlook into Monty Lingua\'s correction for this\n\n\n|_tagger_|_I went to the Rolling Stones concert with Bob today_|\n|*%{color:blue}Tree%*| PP VVD TO DT NP NPS NN IN NP NN |\n|*%{color:blue}Brill (WSJ)%*| JJ NN NN NN VBG NNS VBP VBG NN NN |\n|*%{color:blue}Brill (BWN)%*| PRP VBD TO DT VBG NNS NN IN NN NN |\n\np.\n\n\n|_tagger_|_This is a test of the emergency tagging system_|\n|*%{color:blue}Tree%*| DT VBZ DT NN IN DT NN VVG NN |\n|*%{color:blue}Brill (WSJ)%*| JJ NN VBG JJS NN NN NN VBG NN |\n|*%{color:blue}Brill (BWN)%*| DT VBZ DT NN IN DT NN VBG NN |\n\n\nThe word tagging is part of a compound noun phrase and should not be lemmatized.','Dustin','18.250.6.38');
INSERT INTO revisions VALUES (6,'2005-12-11 19:09:51','2005-12-11 19:09:51','2005-12-11 19:09:51',4,'*Why am I not getting any points?*\n\nIf there are not enough players and you something different that parses to the same result, the game will \"double count\" the entry without giving you any points.\n\n\nThis is not a bug.  We are saving your multiple inputs because it is good to know many different ways to say the same thing.\n\n*Why does it hurt?*\n\nThis is a temporary bug that we are working on.','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (7,'2005-11-30 20:50:26','2005-11-30 20:50:26','2005-11-30 20:50:26',5,'Variations of the FeudGame:\n\nh3. Original\n\nThree states:\n# Rules of play\n# Display a goal and a template (random?) and users fill out their information\n# Display the scores:\n## Users who picked the most common concepts (after some lexical/semantic spreading) get more points than those who did not.\n\n\nh3. Analogies\n\nTry to force the users to create analogies, being a relationship between four parts:\n\n    a:b :: c:d   : = \"is to\"\n                 :: = \"as\"\n\nFor example\n\n    *table* is-to *eat dinner* as ____ is-to *go swimming*\n\nTo avoid bad prompts, we will only use the analogies we collected in the Original game.  That is, we\'ll bootstrap.\n\nh3. Metaphors\n\nAs mentioned in George Lakoff\'s essay, metaphors may be how people internally represent complex concepts.  By mapping an abstraction to a more concrete domain in a realm of spatial / geogmetric knowledge, you can use the same thought processes to think and talk about these abstract concepts that are otherwise hard to articulate.\n\nExamples of these spatial structures are: containers, paths, obstacles and passages.\n\nWhen people talk of plans, they usually talk of progress as a continuous line between them and their goal, sometimes beset with obstacles.  \n\nPeople talk about love, using metaphors of physical structure: \"I don\'t think we will ever _split up_\", \"Our relationship was _going nowhere_\",  etc. ','dustin','18.250.6.38');
INSERT INTO revisions VALUES (8,'2005-11-30 20:02:00','2005-11-30 20:02:00','2005-11-30 20:02:00',6,'\nh3. 11.30.05\n\n* Finally got the Feudgame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\n* Moved site to http://epsilon.media.mit.edu:3000\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\n* Muliple users can join FeudGame and the player list reflects the current players.\n\nh3. 11.28.05\n\n* *Added* sub-goals can be re-ordered or deleted before they are added.\n* *Fixed* sub-goals are displayed in proper order.','AnonymousCoward','18.250.6.38');
INSERT INTO revisions VALUES (9,'2005-11-30 20:02:09','2005-11-30 20:02:09','2005-11-30 20:02:09',6,'h3. 11.30.05\n\n* Finally got the Feudgame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\n* Moved site to http://epsilon.media.mit.edu:3000\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\n* Muliple users can join FeudGame and the player list reflects the current players.\n\nh3. 11.28.05\n\n* *Added* sub-goals can be re-ordered or deleted before they are added.\n* *Fixed* sub-goals are displayed in proper order.','Dustin','18.250.6.38');
INSERT INTO revisions VALUES (10,'2005-11-30 20:34:52','2005-11-30 20:34:52','2005-11-30 20:34:52',6,'h3. 11.30.05\n\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\n* Moved site to http://epsilon.media.mit.edu:3000\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\n* Muliple users can join FeudGame and the player list reflects the current players.\n\nh3. 11.28.05\n\n* *Added* sub-goals can be re-ordered or deleted before they are added.\n* *Fixed* sub-goals are displayed in proper order.','dustin','18.250.6.38');
INSERT INTO revisions VALUES (11,'2005-12-11 19:03:47','2005-12-11 19:03:47','2005-12-11 19:03:47',6,'h3. 12.11.05\n\n* User scoring (save scores, rank)\n* Storing data to database\n* Fix IE javascript\n\n\nh3. 11.30.05\n\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\n* Moved site to http://epsilon.media.mit.edu:3000\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\n* Muliple users can join FeudGame and the player list reflects the current players.\n\nh3. 11.28.05\n\n* *Added* sub-goals can be re-ordered or deleted before they are added.\n* *Fixed* sub-goals are displayed in proper order.','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (12,'2005-12-11 22:49:05','2005-12-11 22:49:05','2005-12-11 22:49:05',6,'h3. 12.11.05\n\n* User scoring (save scores, rank)\n* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  \n* Fixed Javascript in IE (html body=\"onload\")\n* Rounded start timer as default during page appearance.\n* Added META REFRESH for redundancy (seems to have stopped the white page problem)\n\n\nh3. 11.30.05\n\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\n* Moved site to http://epsilon.media.mit.edu:3000\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\n* Muliple users can join FeudGame and the player list reflects the current players.\n\nh3. 11.28.05\n\n* *Added* sub-goals can be re-ordered or deleted before they are added.\n* *Fixed* sub-goals are displayed in proper order.','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (13,'2005-12-13 15:43:15','2005-12-13 15:43:15','2005-12-13 15:43:15',6,'h3. 12.13.05\n\n* Fixed Parser Bug with \"having%\" statements.\n* Updated premature \"Time\'s up\" Bug.\n* Revising color sheme.\n\nh3. 12.12.05\n\n* Got rid of first \"display rules\" interval\n* Created waiting page (/feud/startup) that is only loaded when you first start game.\n\n\nh3. 12.11.05\n\n* User scoring (save scores, rank)\n* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  \n* Fixed Javascript in IE (html body=\"onload\")\n* Rounded start timer as default during page appearance.\n* Added META REFRESH for redundancy (seems to have stopped the white page problem)\n\n\nh3. 11.30.05\n\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\n* Moved site to http://epsilon.media.mit.edu:3000\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\n* Muliple users can join FeudGame and the player list reflects the current players.\n\nh3. 11.28.05\n\n* *Added* sub-goals can be re-ordered or deleted before they are added.\n* *Fixed* sub-goals are displayed in proper order.','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (14,'2005-12-13 20:40:16','2005-12-13 20:40:16','2005-12-13 20:40:16',6,'h3. 12.13.05\n\n* Fixed Parser Bug with \"having%\" statements.\n* Fixed premature \"Time\'s up\" Bug.\n* Revising color sheme.\n\nh3. 12.12.05\n\n* Got rid of first \"display rules\" interval\n* Created waiting page (/feud/startup) that is only loaded when you first start game.\n\n\nh3. 12.11.05\n\n* User scoring (save scores, rank)\n* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  \n* Fixed Javascript in IE (html body=\"onload\")\n* Rounded start timer as default during page appearance.\n* Added META REFRESH for redundancy (seems to have stopped the white page problem)\n\n\nh3. 11.30.05\n\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\n* Moved site to http://epsilon.media.mit.edu:3000\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\n* Muliple users can join FeudGame and the player list reflects the current players.\n\nh3. 11.28.05\n\n* *Added* sub-goals can be re-ordered or deleted before they are added.\n* *Fixed* sub-goals are displayed in proper order.','AnonymousCoward','18.250.5.125');
INSERT INTO revisions VALUES (15,'2005-12-30 16:56:03','2006-01-12 16:12:10','2005-12-30 16:56:03',6,'h3. 12.30.05\n\n* Moved site to http://epsilon.media.mit.edu:3000\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\n* SQL bug fixed with MySQL upgrade (Mako)\n\nh3. 12.13.05\n\n* Fixed Parser Bug with \"having%\" statements.\n* Fixed premature \"Time\'s up\" Bug.\n* Revising color sheme.\n\nh3. 12.12.05\n\n* Got rid of first \"display rules\" interval\n* Created waiting page (/feud/startup) that is only loaded when you first start game.\n\n\nh3. 12.11.05\n\n* User scoring (save scores, rank)\n* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  \n* Fixed Javascript in IE (html body=\"onload\")\n* Rounded start timer as default during page appearance.\n* Added META REFRESH for redundancy (seems to have stopped the white page problem)\n\n\nh3. 11.30.05\n\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\n* Muliple users can join FeudGame and the player list reflects the current players.\n\nh3. 11.28.05\n\n* *Added* sub-goals can be re-ordered or deleted before they are added.\n* *Fixed* sub-goals are displayed in proper order.','AnonymousCoward','69.120.115.225');
INSERT INTO revisions VALUES (16,'2005-11-30 11:54:37','2005-11-30 11:54:37','2005-11-30 11:54:37',7,'h3. Introduction\n\n\n\n\nh3. Components\n\n# TaggerBugs','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (17,'2005-11-30 11:53:58','2005-11-30 11:53:58','2005-11-30 11:53:58',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\n\nh2. Links\n\n# ToDoList\n# KnowledgeRepresentations\n# RecentUpdates\n# BugTracking\n\n\nh2. \"Main Page\":http://epsilon.media.mit.edu:3000/','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (18,'2005-11-30 20:06:46','2005-11-30 20:06:46','2005-11-30 20:06:46',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\n\nh2. Links\n\n# ToDoList what needs to be done\n# RecentUpdates what has been done\n# TaggerBugs oh that tagger\n# KnowledgeRepresentations\n\nh2. \"Main Page\":http://epsilon.media.mit.edu:3000/','Dustin','18.250.6.38');
INSERT INTO revisions VALUES (19,'2005-11-30 20:30:52','2005-11-30 20:30:52','2005-11-30 20:30:52',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\n\nh2. Links\n\n# ToDoList what needs to be done\n# RecentUpdates what has been done\n# TaggerBugs oh that tagger\n# KnowledgeRepresentations\n\nh2. \"Main Page\":http://epsilon.media.mit.edu:3000/ <-- clink there to get back to the game','AnonymousCoward','18.250.6.38');
INSERT INTO revisions VALUES (20,'2005-12-11 19:18:44','2005-12-11 19:18:44','2005-12-11 19:18:44',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\n\nh2. Links\n\n# ToDoList what needs to be done\n# RecentUpdates what has been done\n# TaggerBugs oh that tagger\n# KnowledgeRepresentations\n# CommonsenseFeudGame\n\nh2. \"Main Page\":http://18.85.16.168/Goals/ <-- clink there to get back to the game','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (21,'2005-12-11 21:04:20','2005-12-11 21:04:20','2005-12-11 21:04:20',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\n\nh2. Links\n\n# ToDoList what needs to be done\n# RecentUpdates what has been done\n# TaggerBugs oh that tagger\n# KnowledgeRepresentations\n# CommonsenseFeudGame\n# UserFeedback\n\nh2. \"Main Page\":http://18.85.16.168/Goals/ <-- clink there to get back to the game','AnonymousCoward','18.85.16.168');
INSERT INTO revisions VALUES (22,'2005-12-27 21:02:58','2006-01-15 20:35:56','2005-12-27 21:02:58',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\n\nh2. Links\n\n# ToDoList what needs to be done\n# RecentUpdates what has been done\n# TaggerBugs oh that tagger\n# KnowledgeRepresentations\n# CommonsenseFeudGame\n# UserFeedback\n\nh2. \"Main Page\":http://epsilon.media.mit.edu:3000 <-- clink to get back to the game','AnonymousCoward','69.120.115.225');
INSERT INTO revisions VALUES (23,'2005-11-30 11:54:13','2005-11-30 11:54:13','2005-11-30 11:54:13',9,'h2. Technical\n\n# BUGS\n## fix sub-goal ordering\n# fix unique form naming (appearance in IE?)\n# put site on XNet\n# svn control ?\n# make PARSE into method/helper\n# actually save data!\n# get smtp server up / mailing features working\n# -sort / delete sub-goals-\n\nh2. Technical::Feud\n\n# JavaScript counter in IE/ect\n# JavaScript counter - make default rounded.\n# Make game \n# lemmatizer - plural/past/etc.\n# [one two three] status indicator\n# spark graphs\n\nACTIONS = goals that have no alternative method of solving.\nh2. Structure and StoryQuestions\n\n# -distinguish betwixt goals and actions-  instead of 0/1, use 1+ and only hide goals that are greater than a threshold.\n# KnowledgeRealms\n\nProjects:  Tap, Commonsense Taboo,\n\nh2. Gaming\n\n# view other users\'s stats\n# implement scoring stystem\n# user photos\n# user editing, \n\n\n\"main page\":http://18.85.16.150:3000/goals\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (24,'2005-11-30 19:59:19','2005-11-30 19:59:19','2005-11-30 19:59:19',9,'h3. %{color:red}To do!%\n\n* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)\n* Create a helper function that returns the right sysnet/hyponyms based on the word choice.\n* Modulize the form listing:\n## Avoid using the same name multiple times (IE bug)\n## Fix AJAX selections, lessen pause if possible.\n## Permit substitution of other tenses\n\n* Find out what\'s making it so slow!\n* Create a scheme to _save the data_ and implement\n* get smtp server up / mailing features working\n* Feud Goals: JavaScript counter in IE/ect\n* Feud Goals JavaScript counter - make default rounded.\n* Interface [one two three] status indicator\n\n\nACTIONS = goals that have no alternative method of solving.\nh2. Structure and StoryQuestions\n\n# -distinguish betwixt goals and actions-  instead of 0/1, use 1+ and only hide goals that are greater than a threshold.\n# KnowledgeRealms\n\nProjects:  Tap, Commonsense Taboo,\n\nh2. Gaming\n\n# view other users\'s stats\n# implement scoring stystem\n# user photos\n# user editing, \n\n\n\"main page\":http://18.85.16.150:3000/goals\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','AnonymousCoward','18.250.6.38');
INSERT INTO revisions VALUES (25,'2005-11-30 20:05:43','2005-11-30 20:05:43','2005-11-30 20:05:43',9,'h3. %{color:red}To do!%\n\n* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)\n* Create a helper function that returns the right sysnet/hyponyms based on the word choice.\n* Modulize the form listing:\n## Avoid using the same name multiple times (IE bug)\n## Fix AJAX selections, lessen pause if possible.\n## Permit substitution of other tenses\n\n* Find out what\'s making it so slow:  Move to Lighttpd or Apache.\n* Create a scheme to _save the data_ and implement\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n## get rid of the validation memo upon signup\n* Feud Goals: JavaScript counter in IE/ect\n* Feud Goals JavaScript counter - make default rounded.\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n* POS tagger: Linknet or existing taggers?\n\nh2. Testing\n\n* Security Issues\n* Multiple logins (same account) to feud game\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Future Possibilities\n\n# view other users\'s stats\n# implement scoring stystem\n# user photos\n# user editing\n\n\n\"main page\":http://18.85.16.150:3000/goals\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.250.6.38');
INSERT INTO revisions VALUES (26,'2005-11-30 20:30:30','2005-11-30 20:30:30','2005-11-30 20:30:30',9,'h3. %{color:red}To do!%\n\n* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)\n* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n* Saving the goals, spilting trees of subgoals or meging them?\n* Create a way to _contextualize_ the prompts users recieve\n* Create a helper function that returns the right sysnet/hyponyms based on the word choice.\n* Modulize the form listing:\n## Avoid using the same name multiple times (IE bug)\n## Fix AJAX selections, lessen pause if possible.\n## Permit substitution of other tenses\n\n* Find out what\'s making it so slow:  Move to Lighttpd or Apache.\n* Create a scheme to _save the data_ and implement\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n## get rid of the validation memo upon signup\n* Feud Goals: JavaScript counter in IE/ect\n* Feud Goals JavaScript counter - make default rounded.\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n* POS tagger: Linknet or existing taggers?\n\nh2. Testing\n\n* Security Issues\n* Multiple logins (same account) to feud game\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Future Possibilities\n\n# view other users\'s stats\n# implement scoring stystem\n# user photos\n# user editing\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','AnonymousCoward','18.250.6.38');
INSERT INTO revisions VALUES (27,'2005-11-30 20:33:41','2005-11-30 20:33:41','2005-11-30 20:33:41',9,'h3. %{color:red}To do!%\n\n* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)\n* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n* Saving the goals, spilting trees of subgoals or meging them?\n* Create a way to _contextualize_ the prompts users recieve\n* Create a helper function that returns the right sysnet/hyponyms based on the word choice.\n* Modulize the form listing:\n## Avoid using the same name multiple times (IE bug)\n## Fix AJAX selections, lessen pause if possible.\n## Permit substitution of other tenses\n\n* Find out what\'s making it so slow:  Move to Lighttpd or Apache.\n* Create a scheme to _save the data_ and implement\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n## get rid of the validation memo upon signup\n* Feud Goals: JavaScript counter in IE/ect\n* Feud Goals JavaScript counter - make default rounded.\n* A way to keep track of temporary submissions into the database (create a temp table?)\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n* POS tagger: Linknet or existing taggers?\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n* view other users\'s stats\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','dustin','18.250.6.38');
INSERT INTO revisions VALUES (28,'2005-12-03 12:32:55','2005-12-03 12:32:55','2005-12-03 12:32:55',9,'h3. %{color:red}To do!%\n\n* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)\n* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n* Saving the goals, spilting trees of subgoals or meging them?\n* Create a way to _contextualize_ the prompts users recieve\n* Create a helper function that returns the right sysnet/hyponyms based on the word choice.\n* Modulize the form listing:\n## Avoid using the same name multiple times (IE bug)\n## Fix AJAX selections, lessen pause if possible.\n## Permit substitution of other tenses\n\n* Find out what\'s making it so slow:  Move to Lighttpd or Apache.\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n## get rid of the validation memo upon signup\n* Feud Goals: JavaScript counter in IE/ect\n* Feud Goals JavaScript counter - make default rounded.\n* A way to keep track of temporary submissions into the database (create a temp table?)\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n* POS tagger: Linknet or existing taggers?\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n* view other users\'s stats\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (29,'2005-12-05 14:02:16','2005-12-05 14:02:16','2005-12-05 14:02:16',9,'h3. %{color:red}To do!%\n\nh2. For Tues 12/6\n\n* User scoring (save scores, rank)\n* Storing data to database\n* Fix IE javascript\n* Reasons for/against (alternating?)\n* Ajax the input for rapidfire listing\n\nh2. more\n\n* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)\n* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n* Saving the goals, spilting trees of subgoals or meging them?\n* Create a way to _contextualize_ the prompts users recieve\n* Create a helper function that returns the right sysnet/hyponyms based on the word choice.\n* Modulize the form listing:\n## Avoid using the same name multiple times (IE bug)\n## Fix AJAX selections, lessen pause if possible.\n## Permit substitution of other tenses\n\n* Find out what\'s making it so slow:  Move to Lighttpd or Apache.\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n## get rid of the validation memo upon signup\n* Feud Goals: JavaScript counter in IE/ect\n* Feud Goals JavaScript counter - make default rounded.\n* A way to keep track of temporary submissions into the database (create a temp table?)\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n* POS tagger: Linknet or existing taggers?\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n* view other users\'s stats\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','AnonymousCoward','18.85.18.128');
INSERT INTO revisions VALUES (30,'2005-12-11 19:03:24','2005-12-11 19:03:24','2005-12-11 19:03:24',9,'h3. %{color:red}To do!%\n\nh2. For Tues 12/6\n\n\n* Reasons for/against (alternating?)\n* Ajax the input for rapidfire listing\n\nh2. more\n\n* Create a global, more efficent way of changing goal expressions into different forms (present, past, future)\n* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n* Saving the goals, spilting trees of subgoals or meging them?\n* Create a way to _contextualize_ the prompts users recieve\n* Create a helper function that returns the right sysnet/hyponyms based on the word choice.\n* Modulize the form listing:\n## Avoid using the same name multiple times (IE bug)\n## Fix AJAX selections, lessen pause if possible.\n## Permit substitution of other tenses\n\n* Find out what\'s making it so slow:  Move to Lighttpd or Apache.\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n## get rid of the validation memo upon signup\n* Feud Goals: JavaScript counter in IE/ect\n* Feud Goals JavaScript counter - make default rounded.\n* A way to keep track of temporary submissions into the database (create a temp table?)\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n* POS tagger: Linknet or existing taggers?\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n* view other users\'s stats\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (31,'2005-12-11 19:09:11','2005-12-11 19:09:11','2005-12-11 19:09:11',9,'h3. %{color:red}To do!%\n\n* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n\n* Reasons for/against (alternating?)\n\nh2. goals\n\n* Saving the goals, spilting trees of subgoals or meging them?\n* Create a way to _contextualize_ the prompts users recieve\n* Create a helper function that returns the right sysnet/hyponyms based on the word choice.\n* Find out what\'s making it so slow:  Move to Lighttpd or Apache.\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n## get rid of the validation memo upon signup\n* Feud Goals: JavaScript counter in IE/ect\n* Feud Goals JavaScript counter - make default rounded.\n* A way to keep track of temporary submissions into the database (create a temp table?)\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n* POS tagger: Linknet or existing taggers?\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n* view other users\'s stats\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','AnonymousCoward','18.85.18.68');
INSERT INTO revisions VALUES (32,'2005-12-11 21:59:45','2005-12-11 21:59:45','2005-12-11 21:59:45',9,'h3. %{color:red}To do!%\n\n* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n\n* Reasons for/against (alternating?)\n\n* Better Scoring\n# Make sure it scores against old results\n# Show which users guessed what\n# Show which users scored points\n# Paginate scores / Limit results?\n\n\nh2. goals\n\n* Saving the goals, spilting trees of subgoals or meging them?\n* Create a way to _contextualize_ the prompts users recieve\n* Create a helper function that returns the right sysnet/hyponyms based on the word choice.\n* Find out what\'s making it so slow:  Move to Lighttpd or Apache.\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n\n* Feud Goals: JavaScript counter in IE/ect\n* Feud Goals JavaScript counter - make default rounded.\n* A way to keep track of temporary submissions into the database (create a temp table?)\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n* POS tagger: Linknet or existing taggers?\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n\n* view other users\'s contributions\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (33,'2005-12-11 22:57:36','2005-12-11 22:57:36','2005-12-11 22:57:36',9,'\n\n\nh2. %{color:red}To Do%\n\n* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n\n* Migrate to Epsilon\n\n* Change really bad words to poor words.\n\n* Quotes, comics, pictures during loading.\n\n* Better interface: graphics, bars, colours, sensations \n# Sparkgraphs!\n\n* Better Scoring\n# Make sure it scores against old results\n# Show which users guessed what\n# Show which users scored points\n\n\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n\nh2. Open Questions (please comment)\n\n* Should we ask for user\'s email? Age? SSN?\n* How should we represent many results (just the top, !=1, etc)\n* Ask for negative expertise?\n\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game -- how should we handle this?\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n\n* view other users\'s contributions\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (34,'2005-12-12 21:08:50','2005-12-12 21:08:50','2005-12-12 21:08:50',9,'\n\nh2. %{color:red}To Do%\n\n* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n\n* Migrate to Epsilon\n\n* Change really bad words to poor words.\n\n* Quotes, comics, pictures during loading.\n\n* Better interface: graphics, bars, colours, sensations \n# Sparkgraphs!\n\n* Better Scoring\n# Make sure it scores against old results\n# Show which users guessed what\n# Show which users scored points\n\n\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\n\n\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n\nh2. Open Questions (please comment)\n\n* Should we ask for user\'s email? Age? SSN?\n* How should we represent many results (just the top, !=1, etc)\n* Ask for negative expertise?\n\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game -- how should we handle this?\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n\n* view other users\'s contributions\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (35,'2005-12-13 11:37:28','2005-12-13 11:37:28','2005-12-13 11:37:28',9,'h2. %{color:red}To Do%\n\n\n* I think that the \"Application Error (rails) \" error was triggered by someone\'s input that crashed on the parser.  The reason the error was not specific is that it is running in Production mode.\n\n\n\n* Fix time\'s up error(from class, after enter one)\n\n* scoring Rails App error\n\n* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n\n* Migrate to Epsilon\n\n* Change really bad words to poor words.\n\n* Quotes, comics, pictures during loading.\n\n* Better interface: graphics, bars, colours, sensations \n# Sparkgraphs!\n\n* Better Scoring\n# Make sure it scores against old results\n# Show which users guessed what\n# Show which users scored points\n\n\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\n\n\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n\nh2. Open Questions (please comment)\n\n* Should we ask for user\'s email? Age? SSN?\n* How should we represent many results (just the top, !=1, etc)\n* Ask for negative expertise?\n\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game -- how should we handle this?\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n\n* view other users\'s contributions\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','AnonymousCoward','18.85.19.35');
INSERT INTO revisions VALUES (36,'2005-12-13 15:40:41','2005-12-13 15:40:41','2005-12-13 15:40:41',9,'h2. %{color:red}To Do%\n\n\n\n\n* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n\n* Migrate to Epsilon\n\n* Change really bad words to poor words.\n\n* Quotes, comics, pictures during loading.\n\n* Better interface: graphics, bars, colours, sensations \n# Sparkgraphs!\n\n* Better Scoring\n# Make sure it scores against old results\n# Show which users guessed what\n# Show which users scored points\n\n\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\n\n\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n\nh2. Open Questions (please comment)\n\n* Should we ask for user\'s email? Age? SSN?\n* How should we represent many results (just the top, !=1, etc)\n* Ask for negative expertise?\n\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game -- how should we handle this?\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n\n* view other users\'s contributions\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (37,'2005-12-30 16:56:53','2006-01-12 17:34:01','2005-12-30 16:56:53',9,'h2. %{color:red}To Do%\n\n\n* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\n\n* Change really bad words to poor words.\n\n* Add more quotes to \'holding page\'\n\n* Better interface: graphics, bars, colours, sensations \n# Sparkgraphs!\n\n* Better Scoring\n# Make sure it scores against old results\n# Show which users guessed what\n# Show which users scored points\n\n\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\n\n\n* get smtp server up / mailing features working\n## send welcome letter\n## \"forgot your pass\"\n\n* statistics to display the results, sparklines, etc\n* Interface [one two three] status indicator\n* Better documentation and instructions for users\n\nh2. Open Questions (please comment)\n\n* Should we ask for user\'s email? Age? SSN?\n* How should we represent many results (just the top, !=1, etc)\n* Ask for negative expertise?\n\n\nh2. Testing\n\n* Security Issues, ip logging\n* Multiple logins (same account) to feud game -- how should we handle this?\n* Entering/leaving in the middle of the game\n* Session expiry\n\n\nh2. Feature Requests\n\n\n* view other users\'s contributions\n* categories of users\n* user photos\n* integrate (somehow) with other networks\n* user editing\n* integrate Wiki with main site\n* localization, other languages\n\n\n\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','AnonymousCoward','69.120.115.225');
INSERT INTO revisions VALUES (38,'2005-12-11 21:04:39','2005-12-11 21:04:39','2005-12-11 21:04:39',10,'*What did you think of the game?*','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (39,'2005-12-11 22:46:09','2005-12-11 22:46:09','2005-12-11 22:46:09',10,'*What did you think of the game?*\n\nI would like to see quotes during the page loading sequence - Dustin','Dustin','18.85.16.168');
INSERT INTO revisions VALUES (40,'2005-12-11 23:57:53','2005-12-11 23:57:53','2005-12-11 23:57:53',10,'h3. *What did you think of the game?*\n\nIf you have any comments about the game, please post them on the wiki, send me an email, or drop by my office.  In particular, we\'re interested in finding out:\n\n\nh3. 1. which parts you found entertaining, and which detracted\n\nh3. 2. the durations of the game\'s intervals -- too short or long?  was the timer annoying?\n\n\nh3. 3. are the instructions and interface intuitive?\n\nh3. 4. bugs??\n\nh3. 5. How can we make this more entertaining?\n\nThanks for your help!\n\n-- Dustin & Alea','Dustin','18.250.5.125');
INSERT INTO revisions VALUES (41,'2005-12-18 21:26:52','2006-01-15 13:11:57','2005-12-18 21:26:52',10,'h3. *What did you think of the game?*\n\nIf you have any comments about the game, please post them on the wiki, send me an email, or drop by my office.  In particular, we\'re interested in finding out:\n\n\nh3. 1. which parts you found entertaining, and which detracted\n\nh3. 2. the durations of the game\'s intervals -- too short or long?  was the timer annoying?\n\n\nh3. 3. are the instructions and interface intuitive?\n\nh3. 4. bugs??\n\nh3. 5. How can we make this more entertaining?\n\nThanks for your help!\n\n-- Dustin & Alea\n\nAmazing!','AnonymousCoward','18.85.16.150');
INSERT INTO revisions VALUES (42,'2006-01-12 16:12:10','2006-01-13 14:52:34','2006-01-12 16:12:51',6,'h3. 01.12.06\r\n\r\n* Fixed problem with Instiki not finding pages.  Upgraded version and used new modified \"controller.\":http://dev.instiki.org/file/instiki/branches/instiki-ar/app/controllers/wiki_controller.rb?rev=405 \r\n* New header, but still bad color scheme.\r\n\r\nh3. 12.30.05\r\n\r\n* Moved site to http://epsilon.media.mit.edu:3000\r\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\r\n* SQL bug fixed with MySQL upgrade (Mako)\r\n\r\nh3. 12.13.05\r\n\r\n* Fixed Parser Bug with \"having%\" statements.\r\n* Fixed premature \"Time\'s up\" Bug.\r\n* Revising color sheme.\r\n\r\nh3. 12.12.05\r\n\r\n* Got rid of first \"display rules\" interval\r\n* Created waiting page (/feud/startup) that is only loaded when you first start game.\r\n\r\n\r\nh3. 12.11.05\r\n\r\n* User scoring (save scores, rank)\r\n* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  \r\n* Fixed Javascript in IE (html body=\"onload\")\r\n* Rounded start timer as default during page appearance.\r\n* Added META REFRESH for redundancy (seems to have stopped the white page problem)\r\n\r\n\r\nh3. 11.30.05\r\n\r\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\r\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\r\n* Muliple users can join FeudGame and the player list reflects the current players.\r\n\r\nh3. 11.28.05\r\n\r\n* *Added* sub-goals can be re-ordered or deleted before they are added.\r\n* *Fixed* sub-goals are displayed in proper order.','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (43,'2006-01-12 17:34:01','2006-01-13 09:04:03','2006-01-12 17:34:00',9,'h2. %{color:red}To Do%\r\n\r\n* Improve Interface\r\n\r\n* Setup SVN (and Trax for online management?)\r\n\r\n* Work on state -- auto-run script??\r\n\r\n* Better parsing - match answers! Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)\r\n\r\n* Add more quotes to \'holding page\'\r\n\r\n* Better interface: graphics, bars, colours, sensations \r\n# Sparkgraphs!\r\n\r\n* Better Scoring\r\n# Make sure it scores against old results\r\n# Show which users guessed what\r\n# Show which users scored points\r\n\r\n\r\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\r\n\r\n\r\n* get smtp server up / mailing features working\r\n## send welcome letter\r\n## \"forgot your pass\"\r\n\r\n* statistics to display the results, sparklines, etc\r\n* Interface [one two three] status indicator\r\n* Better documentation and instructions for users\r\n\r\nh2. Open Questions (please comment)\r\n\r\n* Should we ask for user\'s email? Age? SSN?\r\n* How should we represent many results (just the top, !=1, etc)\r\n* Ask for negative expertise?\r\n\r\n\r\nh2. Testing\r\n\r\n* Security Issues, ip logging\r\n* Multiple logins (same account) to feud game -- how should we handle this?\r\n* Entering/leaving in the middle of the game\r\n* Session expiry\r\n\r\n\r\nh2. Feature Requests\r\n\r\n\r\n* view other users\'s contributions\r\n* categories of users\r\n* user photos\r\n* integrate (somehow) with other networks\r\n* user editing\r\n* integrate Wiki with main site\r\n* localization, other languages\r\n\r\n\r\n\r\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (44,'2006-01-13 08:47:20','2006-01-15 20:14:04','2006-01-13 08:47:20',2,'Minsky lists a few realms of knowledge in \"EM-6.1\":http://web.media.mit.edu/~minsky/E6/eb6.html\r\n\r\n# ProblemsWithOMCS\r\n# DomainsOfCommonsenseKnowledge\r\n\r\n------------\r\n\r\nh3. Adjective Clarification .\r\n\r\nWhen users\' entries have an adjective in their description (tagged as *JJ*), we can issue a question asking them to classify their description. ','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (45,'2006-01-13 08:47:28','2006-01-15 20:14:31','2006-01-13 08:47:28',11,'h3. Spatial\r\n\r\n\r\n\r\nDefine which entities can be found in each *setting*?\r\n\r\n\r\n\r\nh3. Social\r\n\r\n\r\n\r\nPeople, agents, and inanimate objects -- how to threat them, what to expect from them, etc.\r\n\r\n\r\n\r\nh3. Dominion\r\n\r\n\r\n\r\nIs this really a subset of Social?  Minsky explains the \"social\" relam as a kind-of self-extension, not so much in terms of multiple people.   Dominion expresses ownership of objects, who owns what, how pocession is transferred.\r\n\r\n\r\n\r\nh3.  Procedural\r\n\r\n\r\n\r\nI see our goal system as working toward this -- a \"script\" with the opportunity to branch.\r\n\r\n# what to do\r\n\r\n# what not to do\r\n\r\n# what to do when things go wrong\r\n\r\n\r\n\r\n\r\n\r\nh3.  Conversational Language\r\n\r\n\r\n\r\nA database of colloquialisms may be helpful.\r\n\r\n\r\n\r\n\r\n\r\nh3. Cognitive\r\n\r\n\r\n\r\nh3. Self-Knowledge\r\n','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (46,'2006-01-13 09:04:03','2006-01-13 14:53:55','2006-01-13 09:04:02',9,'h2. %{color:red}To Do%\r\n\r\n* Better parsing - match answers! The answer matching is really not good enough... e.g., birthday, birthday cake, etc. should all match. A simple keyword approach would be better than wha you have right now.\r\n\r\n* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)* Improve Interface\r\n\r\n* Setup SVN (and Trax for online management?)\r\n\r\n* Work on state -- auto-run script??\r\n\r\n* Add more quotes to \'holding page\'\r\n\r\n* Better interface: graphics, bars, colours, sensations \r\n# Sparkgraphs!\r\n\r\n* Better Scoring\r\n# Make sure it scores against old results\r\n# Show which users guessed what\r\n# Show which users scored points\r\n\r\n\r\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\r\n\r\n\r\n* get smtp server up / mailing features working\r\n## send welcome letter\r\n## \"forgot your pass\"\r\n\r\n* statistics to display the results, sparklines, etc\r\n* Interface [one two three] status indicator\r\n* Better documentation and instructions for users\r\n\r\nh2. Open Questions (please comment)\r\n\r\n* Should we ask for user\'s email? Age? SSN?\r\n* How should we represent many results (just the top, !=1, etc)\r\n* Ask for negative expertise?\r\n\r\n\r\nh2. Testing\r\n\r\n* Security Issues, ip logging\r\n* Multiple logins (same account) to feud game -- how should we handle this?\r\n* Entering/leaving in the middle of the game\r\n* Session expiry\r\n\r\n\r\nh2. Feature Requests\r\n\r\n\r\n* view other users\'s contributions\r\n* categories of users\r\n* user photos\r\n* integrate (somehow) with other networks\r\n* user editing\r\n* integrate Wiki with main site\r\n* localization, other languages\r\n\r\n\r\n\r\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','walter','18.85.18.114');
INSERT INTO revisions VALUES (47,'2006-01-13 14:52:34','2006-01-21 13:14:05','2006-01-13 14:57:45',6,'h3. 01.13.06\r\n\r\n* Narrate now under SVN control.  Repository is located at: file://home/dustin/svn/Narrate/\r\n* *startupscript.sh*  loads:\r\n# Rails server (port 3000)\r\n# Instiki (port 7070)\r\n# Clock incrementer ruby script\r\n\r\n* Statistics page added. Installed \"CSSGraphs\":http://nubyonrails.topfunky.com/pages/css_graphs\r\n\r\nh3. 01.12.06\r\n\r\n* Fixed problem with Instiki not finding pages.  Upgraded version and used new modified \"controller.\":http://dev.instiki.org/file/instiki/branches/instiki-ar/app/controllers/wiki_controller.rb?rev=405 \r\n* New header, but still bad color scheme.\r\n\r\nh3. 12.30.05\r\n\r\n* Moved site to http://epsilon.media.mit.edu:3000\r\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\r\n* SQL bug fixed with MySQL upgrade (Mako)\r\n\r\nh3. 12.13.05\r\n\r\n* Fixed Parser Bug with \"having%\" statements.\r\n* Fixed premature \"Time\'s up\" Bug.\r\n* Revising color sheme.\r\n\r\nh3. 12.12.05\r\n\r\n* Got rid of first \"display rules\" interval\r\n* Created waiting page (/feud/startup) that is only loaded when you first start game.\r\n\r\n\r\nh3. 12.11.05\r\n\r\n* User scoring (save scores, rank)\r\n* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  \r\n* Fixed Javascript in IE (html body=\"onload\")\r\n* Rounded start timer as default during page appearance.\r\n* Added META REFRESH for redundancy (seems to have stopped the white page problem)\r\n\r\n\r\nh3. 11.30.05\r\n\r\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\r\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\r\n* Muliple users can join FeudGame and the player list reflects the current players.\r\n\r\nh3. 11.28.05\r\n\r\n* *Added* sub-goals can be re-ordered or deleted before they are added.\r\n* *Fixed* sub-goals are displayed in proper order.','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (48,'2006-01-13 14:53:55','2006-01-15 20:16:03','2006-01-13 14:53:55',9,'h2. %{color:red}To Do%\r\n\r\n* Better parsing - match answers! The answer matching is really not good enough... e.g., birthday, birthday cake, etc. should all match. A simple keyword approach would be better than wha you have right now.\r\n\r\n* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)* Improve Interface\r\n\r\n* Hosting Issues:\r\n# Put on Apache or Lighttpd\r\n# Virtual host with domain \r\n# Trax for SVN online management?\r\n# Subdomain for managment\r\n\r\n\r\n* Work on state -- auto-run script??\r\n\r\n* Add more quotes to \'holding page\'\r\n\r\n* Better interface: graphics, bars, colours, sensations \r\n# Sparkgraphs!\r\n\r\n* Better Scoring\r\n# Make sure it scores against old results\r\n# Show which users guessed what\r\n# Show which users scored points\r\n\r\n\r\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\r\n\r\n\r\n* get smtp server up / mailing features working\r\n## send welcome letter\r\n## \"forgot your pass\"\r\n\r\n* statistics to display the results, sparklines, etc\r\n* Interface [one two three] status indicator\r\n* Better documentation and instructions for users\r\n\r\nh2. Open Questions (please comment)\r\n\r\n* Should we ask for user\'s email? Age? SSN?\r\n* How should we represent many results (just the top, !=1, etc)\r\n* Ask for negative expertise?\r\n\r\n\r\nh2. Testing\r\n\r\n* Security Issues, ip logging\r\n* Multiple logins (same account) to feud game -- how should we handle this?\r\n* Entering/leaving in the middle of the game\r\n* Session expiry\r\n\r\n\r\nh2. Feature Requests\r\n\r\n\r\n* view other users\'s contributions\r\n* categories of users\r\n* user photos\r\n* integrate (somehow) with other networks\r\n* user editing\r\n* integrate Wiki with main site\r\n* localization, other languages\r\n\r\n\r\n\r\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (49,'2006-01-13 15:49:37','2006-01-13 15:49:37','2006-01-13 15:49:37',12,'dsmit@ mit','AnonymousCoward','18.250.6.108');
INSERT INTO revisions VALUES (50,'2006-01-15 13:11:57','2006-01-15 13:11:57','2006-01-15 13:11:57',10,'h3. *What did you think of the game?*\r\n\r\nIf you have any comments about the game, please post them on the wiki, send me an email, or drop by my office.  In particular, we\'re interested in finding out:\r\n\r\n\r\nh3. 1. which parts you found entertaining, and which detracted\r\n\r\nh3. 2. the durations of the game\'s intervals -- too short or long?  was the timer annoying?\r\n\r\n\r\nh3. 3. are the instructions and interface intuitive?\r\n\r\nh3. 4. bugs??\r\n\r\nh3. 5. How can we make this more entertaining?\r\n\r\nThanks for your help!\r\n\r\n-- Dustin & Alea','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (51,'2006-01-15 20:14:04','2006-01-15 20:14:04','2006-01-15 20:14:03',2,'Ultimately we are trying to collect a large number of stories about commonsense knowledge.\r\n\r\n\r\n\r\n# ProblemsWithOMCS\r\n# DomainsOfCommonsenseKnowledge\r\n\r\n------------\r\n\r\nh3. Adjective Clarification .\r\n\r\nWhen users\' entries have an adjective in their description (tagged as *JJ*), we can issue a question asking them to classify their description. ','Dustin','18.250.5.158');
INSERT INTO revisions VALUES (52,'2006-01-15 20:14:31','2006-01-15 20:14:31','2006-01-15 20:14:31',11,'Minsky lists a few realms of knowledge in \"EM-6.1\":http://web.media.mit.edu/~minsky/E6/eb6.html\r\n\r\n\r\n\r\nh3. Spatial\r\n\r\n\r\n\r\nDefine which entities can be found in each *setting*?\r\n\r\n\r\n\r\nh3. Social\r\n\r\n\r\n\r\nPeople, agents, and inanimate objects -- how to threat them, what to expect from them, etc.\r\n\r\n\r\n\r\nh3. Dominion\r\n\r\n\r\n\r\nIs this really a subset of Social?  Minsky explains the \"social\" relam as a kind-of self-extension, not so much in terms of multiple people.   Dominion expresses ownership of objects, who owns what, how pocession is transferred.\r\n\r\n\r\n\r\nh3.  Procedural\r\n\r\n\r\n\r\nI see our goal system as working toward this -- a \"script\" with the opportunity to branch.\r\n\r\n# what to do\r\n\r\n# what not to do\r\n\r\n# what to do when things go wrong\r\n\r\n\r\n\r\n\r\n\r\nh3.  Conversational Language\r\n\r\n\r\n\r\nA database of colloquialisms may be helpful.\r\n\r\n\r\n\r\n\r\n\r\nh3. Cognitive\r\n\r\n\r\n\r\nh3. Self-Knowledge\r\n','Dustin','18.250.5.158');
INSERT INTO revisions VALUES (53,'2006-01-15 20:16:03','2006-01-21 15:34:36','2006-01-15 20:16:03',9,'h2. %{color:red}To Do%\r\n\r\n* SemanticParser\r\n\r\n* Come up with classifications with the different types of linguistic tenses of goals and what problems we may run into (dealing with modifiers, articles, and other wild beasts)* Improve Interface\r\n\r\n* Hosting Issues:\r\n# Put on Apache or Lighttpd\r\n# Virtual host with domain \r\n# Trax for SVN online management?\r\n# Subdomain for managment\r\n\r\n\r\n* Work on state -- auto-run script??\r\n\r\n* Add more quotes to \'holding page\'\r\n\r\n* Better interface: graphics, bars, colours, sensations \r\n# Sparkgraphs!\r\n\r\n* Better Scoring\r\n# Make sure it scores against old results\r\n# Show which users guessed what\r\n# Show which users scored points\r\n\r\n\r\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\r\n\r\n\r\n* get smtp server up / mailing features working\r\n## send welcome letter\r\n## \"forgot your pass\"\r\n\r\n* statistics to display the results, sparklines, etc\r\n* Interface [one two three] status indicator\r\n* Better documentation and instructions for users\r\n\r\nh2. Open Questions (please comment)\r\n\r\n* Should we ask for user\'s email? Age? SSN?\r\n* How should we represent many results (just the top, !=1, etc)\r\n* Ask for negative expertise?\r\n\r\n\r\nh2. Testing\r\n\r\n* Security Issues, ip logging\r\n* Multiple logins (same account) to feud game -- how should we handle this?\r\n* Entering/leaving in the middle of the game\r\n* Session expiry\r\n\r\n\r\nh2. Feature Requests\r\n\r\n\r\n* view other users\'s contributions\r\n* categories of users\r\n* user photos\r\n* integrate (somehow) with other networks\r\n* user editing\r\n* integrate Wiki with main site\r\n* localization, other languages\r\n\r\n\r\n\r\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.250.5.158');
INSERT INTO revisions VALUES (54,'2006-01-15 20:16:42','2006-01-15 21:55:00','2006-01-15 20:18:11',13,'When users submit responses, answers that mean the same thing need to be lumped together. \r\n\r\nBetter parsing - match answers! The answer matching is really not good enough... e.g., birthday, birthday cake, etc. should all match. A simple keyword approach would be better than wha you have right now.\r\n\r\n\r\n\r\n\r\n\r\n\"WordNet\":http://www.wordnet.org\r\nGlueNet','Dustin','18.250.5.158');
INSERT INTO revisions VALUES (55,'2006-01-15 20:35:56','2006-01-15 21:17:14','2006-01-15 20:35:55',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\r\n[[!include ToDoList]]\r\nh2. Links\r\n\r\n# ToDoList what needs to be done\r\n# RecentUpdates what has been done\r\n# TaggerBugs oh that tagger\r\n# KnowledgeRepresentations\r\n# CommonsenseFeudGame\r\n# UserFeedback\r\n\r\nh2. \"Main Page\":http://epsilon.media.mit.edu:3000 <-- clink to get back to the game','Dustin','18.250.5.158');
INSERT INTO revisions VALUES (56,'2006-01-15 21:17:14','2006-01-15 22:17:21','2006-01-15 21:19:13',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\r\n\r\nLinks\r\n-----\r\n\r\n# ToDoList what needs to be done\r\n# RecentUpdates what has been done\r\n# TaggerBugs oh that tagger\r\n# KnowledgeRepresentations\r\n# CommonsenseFeudGame\r\n# UserFeedback\r\n\r\nh2. \"Main Page\":http://epsilon.media.mit.edu:3000 <-- clink to get back to the game','Dustin','18.250.5.158');
INSERT INTO revisions VALUES (57,'2006-01-15 21:55:00','2006-01-15 22:20:59','2006-01-15 22:20:58',13,'Problem\r\n--------\r\n\r\nWhen users submit responses, answers that mean the same thing need to be lumped together.  Any automated system will not do this perfectly, but we\'ll settle for 99%.\r\n\r\nThe system right now does not account for semantics.  It parses words using a bunch of regular expressions (and gets a lot of useful information from them, but doesn\'t combine them).\r\n\r\nThe state of part of speech tagging isn\'t very good, but maybe they\'ll work better with fragments?\r\n\r\nSolution: Semantic Parser\r\n-------\r\n\r\nWith some help from WordNet, users\' answers can be assimilated for better scoring. Wordnet only works for 1:1 word/phrase correspondance.  Something like this may help to see if the words match.\r\n\r\n# Strip the syntatic sugar (filter stop words)\r\n# Elminate or discount adjectives and other modifiers\r\n# Compare what\'s left (hopefully nouns), using hyper/hyponym structures in WordNet.\r\n\r\n\r\n\r\nCop/Policeman/Bobby/Pig/Law Enforcement Agent\r\n\r\nCar/Automobile/Truck/\r\n\r\nPerhaps we should have different options that expand or restrict the degree of generality?\r\n\r\nResources\r\n----\r\n\"WordNet\":http://www.wordnet.org\r\n\r\nGlueNet -- where is it??','Dustin','18.250.5.158');
INSERT INTO revisions VALUES (58,'2006-01-15 22:17:20','2006-01-21 15:22:42','2006-01-15 22:17:20',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\r\n\r\nLinks\r\n-----\r\n\r\n# *ToDoList* what needs to be done\r\n# RecentUpdates what has been done\r\n# KnowledgeRepresentations\r\n# CommonsenseFeudGame\r\n# UserFeedback\r\n','Dustin','18.250.5.158');
INSERT INTO revisions VALUES (59,'2006-01-21 13:14:05','2006-01-21 15:47:41','2006-01-21 13:14:04',6,'h3. 01.21.06\r\n\r\n* Created *auto svn update* post-commit hook that updates the live repository each time a user commits their changes.  Changes can be committed remotely.  \r\n\r\nRepository: svn+ssh://user@epsilon.media.mit.edu:/home/dustin/narrate/\r\n\r\n\r\n\r\nh3. 01.13.06\r\n\r\n* Narrate now under SVN control.  Repository is located at: file://home/dustin/svn/Narrate/\r\n* *startupscript.sh*  loads:\r\n# Rails server (port 3000)\r\n# Instiki (port 7070)\r\n# Clock incrementer ruby script\r\n\r\n* Statistics page added. Installed \"CSSGraphs\":http://nubyonrails.topfunky.com/pages/css_graphs\r\n\r\nh3. 01.12.06\r\n\r\n* Fixed problem with Instiki not finding pages.  Upgraded version and used new modified \"controller.\":http://dev.instiki.org/file/instiki/branches/instiki-ar/app/controllers/wiki_controller.rb?rev=405 \r\n* New header, but still bad color scheme.\r\n\r\nh3. 12.30.05\r\n\r\n* Moved site to http://epsilon.media.mit.edu:3000\r\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\r\n* SQL bug fixed with MySQL upgrade (Mako)\r\n\r\nh3. 12.13.05\r\n\r\n* Fixed Parser Bug with \"having%\" statements.\r\n* Fixed premature \"Time\'s up\" Bug.\r\n* Revising color sheme.\r\n\r\nh3. 12.12.05\r\n\r\n* Got rid of first \"display rules\" interval\r\n* Created waiting page (/feud/startup) that is only loaded when you first start game.\r\n\r\n\r\nh3. 12.11.05\r\n\r\n* User scoring (save scores, rank)\r\n* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  \r\n* Fixed Javascript in IE (html body=\"onload\")\r\n* Rounded start timer as default during page appearance.\r\n* Added META REFRESH for redundancy (seems to have stopped the white page problem)\r\n\r\n\r\nh3. 11.30.05\r\n\r\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\r\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\r\n* Muliple users can join FeudGame and the player list reflects the current players.\r\n\r\nh3. 11.28.05\r\n\r\n* *Added* sub-goals can be re-ordered or deleted before they are added.\r\n* *Fixed* sub-goals are displayed in proper order.','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (60,'2006-01-21 15:22:42','2006-01-21 15:22:42','2006-01-21 15:22:42',8,'This is the new Wiki for the Narrate Game.  Here\'s all the to-do stuff:\r\n\r\nLinks\r\n-----\r\n\r\n# *ToDoList* what needs to be done\r\n# RecentUpdates what has been done\r\n# KnowledgeRepresentations\r\n# CommonsenseFeudGame\r\n# EpsilonEclipseSVN\r\n# UserFeedback','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (61,'2006-01-21 15:23:19','2006-01-21 15:23:59','2006-01-21 15:23:59',14,'I got my Eclipse working with the RadRails and SubVersion plug-ins.   It\'s a really nice development environment.  Here\'s how to:\r\n\r\n* Install the SVN plugin by adding this as a remote \'update site\':\r\n       - http://subclipse.tigris.org/update_1.0.x\r\n\r\n*  Restart, change Perspective to SVN and add a new \"Repository Location\":\r\n\r\n    <pre>   svn+ssh://USERNAME@epsilon.media.mit.edu/home/dustin/svn/Narrate\r\n    </pre>\r\n\r\n*  If everything\'s setup right, it will copy (checkout) all of the files locally.    Change to the Rails Perspective and start a new project.   It will give you the option to use an SVN repository as a source.\r\n\r\n \r\nFor development, you can either run the server locally on your own computer, or just edit directly from the other site.    When you want the changes you have made to be updated on the live development site,\r\n      \r\nhttp://epsilon.media.mit.edu:3000\r\n\r\nRight-click on the folder tree and select \"Team => Commit\".   Enter in a message of your changes and hit OK.\r\n\r\nI wrote a script that instantly re-updates the live SVN development repository after each Commit -- so your changes will appear instantly on the development site.','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (62,'2006-01-21 15:34:36','2006-01-23 08:11:24','2006-01-21 15:40:46',9,'h2. %{color:red}To Do%\r\n\r\n* SemanticParser\r\n\r\n* Hosting Issues:\r\n# Put on Apache or Lighttpd (tell to ignore .SVN dirs!)\r\n# Get Domain and Sub-Domains:\r\n## dev.x.org => development site, internal access only\r\n## x.org => live site\r\n## wiki.x.org => this wiki\r\n# Launch sites in *init* file.\r\n\r\n\r\n* BootStrapping Knowledge (closing the loop) \r\n\r\n\r\n* Work on state -- auto-run script??\r\n\r\n* Add more quotes to \'holding page\'\r\n\r\n* Better interface: graphics, bars, colours, sensations \r\n# Sparkgraphs!\r\n\r\n* Better Scoring\r\n# Make sure it scores against old results\r\n# Show which users guessed what\r\n# Show which users scored points\r\n\r\n\r\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\r\n\r\n\r\n* get smtp server up / mailing features working\r\n## send welcome letter\r\n## \"forgot your pass\"\r\n\r\n* statistics to display the results, sparklines, etc\r\n* Interface [one two three] status indicator\r\n* Better documentation and instructions for users\r\n\r\nh2. Open Questions (please comment)\r\n\r\n* Should we ask for user\'s email? Age? SSN?\r\n* How should we represent many results (just the top, !=1, etc)\r\n* Ask for negative expertise?\r\n\r\n\r\nh2. Testing\r\n\r\n* Security Issues, ip logging\r\n* Multiple logins (same account) to feud game -- how should we handle this?\r\n* Entering/leaving in the middle of the game\r\n* Session expiry\r\n\r\n\r\nh2. Feature Requests\r\n\r\n\r\n* view other users\'s contributions\r\n* categories of users\r\n* user photos\r\n* integrate (somehow) with other networks\r\n* user editing\r\n* integrate Wiki with main site\r\n* localization, other languages\r\n\r\n\r\n\r\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (63,'2006-01-21 15:38:39','2006-01-21 15:38:39','2006-01-21 15:38:39',15,'In the first step of filling out a goal tree, users entries can be used to bootstrap the process.  Super-goals that people enter can be filled back into the database and then can become questions.\r\n\r\n\r\nSome ideas about automatically re-cycling the data:\r\n\r\n* Infinative forms \"TO [action]\" can just be added as \"action\".   \r\n\r\n* Entries that have coreferences need to be removed -- look for entries that have (it,the(m|y|ir)).  Maybe we can automatically figure this out using the sub-goal that prompted the question... probably too much trouble.','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (64,'2006-01-21 15:47:41','2006-01-22 18:30:24','2006-01-21 15:47:41',6,'h3. 01.21.06\r\n\r\n* Created *auto svn update* post-commit hook that updates the live repository each time a user commits their changes.  Changes can be committed remotely.  Setup \"information\":http://epsilon.media.mit.edu:7070/narrate/show/EpsilonEclipseSVN  \r\nhere.\r\n\r\n\r\nh3. 01.13.06\r\n\r\n* Narrate now under SVN control.  Repository is located at: file://home/dustin/svn/Narrate/\r\n* *startupscript.sh*  loads:\r\n# Rails server (port 3000)\r\n# Instiki (port 7070)\r\n# Clock incrementer ruby script\r\n\r\n* Statistics page added. Installed \"CSSGraphs\":http://nubyonrails.topfunky.com/pages/css_graphs\r\n\r\nh3. 01.12.06\r\n\r\n* Fixed problem with Instiki not finding pages.  Upgraded version and used new modified \"controller.\":http://dev.instiki.org/file/instiki/branches/instiki-ar/app/controllers/wiki_controller.rb?rev=405 \r\n* New header, but still bad color scheme.\r\n\r\nh3. 12.30.05\r\n\r\n* Moved site to http://epsilon.media.mit.edu:3000\r\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\r\n* SQL bug fixed with MySQL upgrade (Mako)\r\n\r\nh3. 12.13.05\r\n\r\n* Fixed Parser Bug with \"having%\" statements.\r\n* Fixed premature \"Time\'s up\" Bug.\r\n* Revising color sheme.\r\n\r\nh3. 12.12.05\r\n\r\n* Got rid of first \"display rules\" interval\r\n* Created waiting page (/feud/startup) that is only loaded when you first start game.\r\n\r\n\r\nh3. 12.11.05\r\n\r\n* User scoring (save scores, rank)\r\n* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  \r\n* Fixed Javascript in IE (html body=\"onload\")\r\n* Rounded start timer as default during page appearance.\r\n* Added META REFRESH for redundancy (seems to have stopped the white page problem)\r\n\r\n\r\nh3. 11.30.05\r\n\r\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\r\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\r\n* Muliple users can join FeudGame and the player list reflects the current players.\r\n\r\nh3. 11.28.05\r\n\r\n* *Added* sub-goals can be re-ordered or deleted before they are added.\r\n* *Fixed* sub-goals are displayed in proper order.','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (65,'2006-01-22 18:30:24','2006-01-22 18:30:24','2006-01-22 18:30:24',6,'h3. 01.22.06\r\n\r\n* WordNet integration (without merging yet)\r\n* 3 different game categories: subgoal, parentgoal, and environments.\r\n* Statistics Page\r\n* New JavaScript to stop hammering the site.\r\n\r\nh3. 01.21.06\r\n\r\n* Created *auto svn update* post-commit hook that updates the live repository each time a user commits their changes.  Changes can be committed remotely.  Setup \"information\":http://epsilon.media.mit.edu:7070/narrate/show/EpsilonEclipseSVN  \r\nhere.\r\n\r\n\r\nh3. 01.13.06\r\n\r\n* Narrate now under SVN control.  Repository is located at: file://home/dustin/svn/Narrate/\r\n* *startupscript.sh*  loads:\r\n# Rails server (port 3000)\r\n# Instiki (port 7070)\r\n# Clock incrementer ruby script\r\n\r\n* Statistics page added. Installed \"CSSGraphs\":http://nubyonrails.topfunky.com/pages/css_graphs\r\n\r\nh3. 01.12.06\r\n\r\n* Fixed problem with Instiki not finding pages.  Upgraded version and used new modified \"controller.\":http://dev.instiki.org/file/instiki/branches/instiki-ar/app/controllers/wiki_controller.rb?rev=405 \r\n* New header, but still bad color scheme.\r\n\r\nh3. 12.30.05\r\n\r\n* Moved site to http://epsilon.media.mit.edu:3000\r\n* Moved wiki (this) to http://epsilon.media.mit.edu:2500\r\n* SQL bug fixed with MySQL upgrade (Mako)\r\n\r\nh3. 12.13.05\r\n\r\n* Fixed Parser Bug with \"having%\" statements.\r\n* Fixed premature \"Time\'s up\" Bug.\r\n* Revising color sheme.\r\n\r\nh3. 12.12.05\r\n\r\n* Got rid of first \"display rules\" interval\r\n* Created waiting page (/feud/startup) that is only loaded when you first start game.\r\n\r\n\r\nh3. 12.11.05\r\n\r\n* User scoring (save scores, rank)\r\n* Guesses are stored into two databases *temp_guesses* and *guesses*.  The former\'s entries are migrated to *guesses* after each game.  \r\n* Fixed Javascript in IE (html body=\"onload\")\r\n* Rounded start timer as default during page appearance.\r\n* Added META REFRESH for redundancy (seems to have stopped the white page problem)\r\n\r\n\r\nh3. 11.30.05\r\n\r\n* Finally got the FeudGame to be stateful (without threading) using an additional table *controls* with the first row containing global data that is reset after each game.\r\n* WordNet, Sparklines, Linguistic tools are all installed, thanks to Mako\'s help.\r\n* Muliple users can join FeudGame and the player list reflects the current players.\r\n\r\nh3. 11.28.05\r\n\r\n* *Added* sub-goals can be re-ordered or deleted before they are added.\r\n* *Fixed* sub-goals are displayed in proper order.','dustin','18.250.7.200');
INSERT INTO revisions VALUES (66,'2006-01-23 08:11:24','2006-02-03 17:51:21','2006-01-23 08:11:23',9,'h2. %{color:red}To Do%\r\n\r\n* SemanticParser\r\n\r\n* Hosting Issues:\r\n# Put on Apache or Lighttpd (tell to ignore .SVN dirs!)\r\n# Get Domain and Sub-Domains:\r\n## dev.x.org => development site, internal access only\r\n## x.org => live site\r\n## wiki.x.org => this wiki\r\n# Launch sites in *init* file.\r\n\r\n\r\n* BootStrapping Knowledge (closing the loop) \r\n\r\n\r\n* Work on state -- auto-run script??\r\n\r\n* Add more quotes to \'holding page\'\r\n\r\n* Better interface: graphics, bars, colours, sensations \r\n# Sparkgraphs!\r\n\r\n* Better Scoring\r\n# Make sure it scores against old results\r\n# Show which users guessed what\r\n# Show which users scored points\r\n# What if top scores 3 and 4 are the same???\r\n\r\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\r\n\r\n\r\n* get smtp server up / mailing features working\r\n## send welcome letter\r\n## \"forgot your pass\"\r\n\r\n* statistics to display the results, sparklines, etc\r\n* Interface [one two three] status indicator\r\n* Better documentation and instructions for users\r\n\r\nh2. Open Questions (please comment)\r\n\r\n* Should we ask for user\'s email? Age? SSN?\r\n* How should we represent many results (just the top, !=1, etc)\r\n* Ask for negative expertise?\r\n\r\n\r\nh2. Testing\r\n\r\n* Security Issues, ip logging\r\n* Multiple logins (same account) to feud game -- how should we handle this?\r\n* Entering/leaving in the middle of the game\r\n* Session expiry\r\n\r\n\r\nh2. Feature Requests\r\n\r\n\r\n* view other users\'s contributions\r\n* categories of users\r\n* user photos\r\n* integrate (somehow) with other networks\r\n* user editing\r\n* integrate Wiki with main site\r\n* localization, other languages\r\n\r\n\r\n\r\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (67,'2006-01-23 08:12:56','2006-01-23 08:23:33','2006-01-23 08:23:33',1,'\r\nThe OMCS/Learner approach prompts the users with templates, which they fill in with some word or phrase. It’s the mad-lib style of collecting commonsense knowledge. \r\n\r\n\r\nh3. 1. Post-Processing Problems\r\n\r\nDuring post-processing (at the back-end), the data’s fidelity to its structure is important. In the case of OMCS, during the generation of conceptnet, concepts that had modifiers were split into multiple concepts.\r\n\r\n   Gun [isA] Dangerous and deadly weapon\r\n\r\nwould muliply to:\r\n\r\n   Gun [isA] Dangerous and deadly weapon\r\n   Gun [isA] Dangerous weapon\r\n   Gun [isA] Deadly weapon\r\n   Gun [isA] weapon\r\n\r\nWhen this works, it does a good job of light ‘inference’: generalization. But when the data is bad, it magnifies the problem (by multiplying the noise). For example:\r\n\r\n   Marathon [CapableOf] Remind person about ancient Greece.\r\n\r\nAdds the following:\r\n\r\n   Marathon [CapableOf] Remind\r\n   Marathon [CapableOf] Remind person\r\n   Marathon [CapableOf] Remind person about Greece\r\n\r\nIn fact, for something that lacks agency, like a marathon, there should not be any “CapableOf�? relationships to begin with. There is human subject to this semantic knowledge that ConceptNet? is unaware of. Thus, we have relationships like:\r\n\r\n   Boat [MoativationOf] Not Sink\r\n\r\nWhere it is the people on the boat that have this motivation, not the boat itself. \r\n\r\nh3. 2. Representational Limitations\r\n\r\nOMCS\'s twenty relationships are grouped into 8 (?) sub-types like Affective, Agents, Spatial, and so forth.  Despite this, the concepts within the groups do not always have the data they claim to and often both the nodes and the relations range in granularity.  \r\n\r\n\r\n    Person CapableOf Eat Food\r\n    Person CapalbeOf Having a Seven Course Meal on a Cruise Ship\r\n\r\n\r\nh3. 3. Utility of Corpus\r\n\r\nThe knowledge in OMCS is not encapsulated, so it is unable to isolate context. \r\n \r\nAdditionally, the knowledge cannot be used to reason by analogy, because the inner structures between concepts do not exist.\r\n\r\nh4. 3.1 Analogy Deficiency \r\n\r\nh4. 3.2 Encapsulation\r\n\r\nSpreading activation (one of the main approaches for inference over a large semantic corpus) is problematic for ConceptNet, because at each hop the nodes get (conceptually) further from the original node with no consitstant metric.','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (68,'2006-02-03 17:51:20','2006-02-06 00:06:24','2006-02-03 17:57:21',9,'h2. %{color:red}To Do%\r\n\r\n* count == number of items in category.  score should refelect the number of unique users who guessed.\r\n\r\n* strip rubbish from input\r\n\r\n\r\n* SemanticParser: POS tagging?\r\n\r\n* Hosting Issues:\r\n# Put on Apache or Lighttpd (tell to ignore .SVN dirs!)\r\n# Get Domain and Sub-Domains:\r\n## dev.x.org => development site, internal access only\r\n## x.org => live site\r\n## wiki.x.org => this wiki\r\n# Launch sites in *init* file.\r\n\r\n\r\n* BootStrapping Knowledge (closing the loop) \r\n\r\n* Better interface: graphics, bars, colours, sensations \r\n# Sparkgraphs!\r\n\r\n* Better Scoring\r\n# Make sure it scores against old results\r\n# Show which users guessed what\r\n# Show which users scored points\r\n# What if top scores 3 and 4 are the same???\r\n\r\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\r\n\r\n\r\n* get smtp server up / mailing features working\r\n## send welcome letter\r\n## \"forgot your pass\"\r\n\r\n* statistics to display the results, sparklines, etc\r\n* Interface [one two three] status indicator\r\n* Better documentation and instructions for users\r\n\r\nh2. Open Questions (please comment)\r\n\r\n* Should we ask for user\'s email? Age? SSN?\r\n* How should we represent many results (just the top, !=1, etc)\r\n* Ask for negative expertise?\r\n\r\n\r\nh2. Testing\r\n\r\n* Security Issues, ip logging\r\n* Multiple logins (same account) to feud game -- how should we handle this?\r\n* Entering/leaving in the middle of the game\r\n* Session expiry\r\n\r\n\r\nh2. Feature Requests\r\n\r\n\r\n* view other users\'s contributions\r\n* categories of users\r\n* user photos\r\n* integrate (somehow) with other networks\r\n* user editing\r\n* integrate Wiki with main site\r\n* localization, other languages\r\n\r\n\r\n\r\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','Dustin','18.85.16.150');
INSERT INTO revisions VALUES (69,'2006-02-06 00:06:24','2006-02-06 00:06:24','2006-02-06 00:06:23',9,'h2. %{color:red}To Do%\r\n\r\n* count == number of items in category.  score should refelect the number of unique users who guessed.\r\n\r\n* SemanticParser: POS tagging?\r\n\r\n* Hosting Issues:\r\n# Put on Apache or Lighttpd (tell to ignore .SVN dirs!)\r\n# Get Domain and Sub-Domains:\r\n## dev.x.org => development site, internal access only\r\n## x.org => live site\r\n## wiki.x.org => this wiki\r\n# Launch sites in *init* file.\r\n\r\n\r\n* BootStrapping Knowledge (closing the loop) \r\n\r\n* Better interface: graphics, bars, colours, sensations \r\n# Sparkgraphs!\r\n\r\n* Better Scoring\r\n# Show which users guessed what\r\n# Show which users scored points\r\n# What if top scores 3 and 4 are the same???\r\n\r\n* Reset Goals::goal_used to 0 for all goals each time anew goal is added.\r\n\r\n\r\n* get smtp server up / mailing features working\r\n## send welcome letter\r\n## \"forgot your pass\"\r\n\r\n* statistics to display the results, sparklines, etc\r\n* Interface [one two three] status indicator\r\n* Better documentation and instructions for users\r\n\r\nh2. Open Questions (please comment)\r\n\r\n* Should we ask for user\'s email? Age? SSN?\r\n* How should we represent many results (just the top, !=1, etc)\r\n* Ask for negative expertise?\r\n\r\n\r\nh2. Testing\r\n\r\n* Security Issues, ip logging\r\n* Multiple logins (same account) to feud game -- how should we handle this?\r\n* Entering/leaving in the middle of the game\r\n* Session expiry\r\n\r\n\r\nh2. Feature Requests\r\n\r\n\r\n* view other users\'s contributions\r\n* categories of users\r\n* user photos\r\n* integrate (somehow) with other networks\r\n* user editing\r\n* integrate Wiki with main site\r\n* localization, other languages\r\n\r\n\r\n\r\n\"textile reference\":http://hobix.com/textile/ -- wiki formatting guide','AnonymousCoward','18.250.6.141');

--
-- Table structure for table `structures`
--

CREATE TABLE structures (
  id int(11) NOT NULL auto_increment,
  stype int(11) default '0',
  `name` varchar(255) default NULL,
  expression text,
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `structures`
--


INSERT INTO structures VALUES (1,1,'plan_env','I was in f::place and had to s::goal');
INSERT INTO structures VALUES (2,0,'cause_effect_1','I had to s::goal because f::prequisite');
INSERT INTO structures VALUES (3,0,'cause_effect_2','If I did not s::goal then I would f::consequencee');
INSERT INTO structures VALUES (4,2,'social_1','Most people think you should f::action when you want to s::goal');
INSERT INTO structures VALUES (5,2,'social_2','However some people disagree and think that you should f::action');
INSERT INTO structures VALUES (6,3,'places_1','f::place is a good place to s::goal');
INSERT INTO structures VALUES (7,3,'places_2','s::place is a part of f::thing');
INSERT INTO structures VALUES (8,4,'places_b_1','f::place is a bad place to s::goal');
INSERT INTO structures VALUES (9,4,'places_b_2','This place is a part of f::thing');
INSERT INTO structures VALUES (10,5,'negative','If you wanted to s::goal you would never f::action');
INSERT INTO structures VALUES (11,6,'who','A f::person knows how to s::goal');
INSERT INTO structures VALUES (12,7,'cause_effect_3','If I s::goal then I might f::occurance');
INSERT INTO structures VALUES (13,8,'where_1','I might s::goal in f::place');
INSERT INTO structures VALUES (14,9,'where_2','I might s::goal at f::place');
INSERT INTO structures VALUES (15,10,'alternative_1','I was going to s::goal but instead I could f::goal');
INSERT INTO structures VALUES (16,11,'conditional_1','I prefer to s::goal when it is f::condition');
INSERT INTO structures VALUES (17,12,'conditional_2','I don\'t like to s::goal when it is f::condition');
INSERT INTO structures VALUES (18,13,'metaphor_1','A f::person_place_thing can s::goal');
INSERT INTO structures VALUES (19,14,'goal_association','When I s::goal I think about how I want to f::action');
INSERT INTO structures VALUES (20,16,'object_goal','If I were to s::goal I would want a f::thing');
INSERT INTO structures VALUES (21,15,'thing_location','My s::thing is lost!  I think a left it at the f::place');
INSERT INTO structures VALUES (22,17,'findout_1','I could find out how to s::goal from f::person_place_thing');
INSERT INTO structures VALUES (23,18,'verb_analogy','To s::verb is like to f::verb');
INSERT INTO structures VALUES (24,19,'analogy_1','If I were to teach somebody to s::goal I could help them understand by telling them it is like when they f::action');

--
-- Table structure for table `system`
--

CREATE TABLE system (
  id int(10) unsigned NOT NULL auto_increment,
  `password` varchar(60) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system`
--



--
-- Table structure for table `system_settings`
--

CREATE TABLE system_settings (
  id int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  label varchar(255) default NULL,
  `value` text,
  `type` varchar(255) default NULL,
  position int(11) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_settings`
--



--
-- Table structure for table `temp_guesses`
--

CREATE TABLE temp_guesses (
  id int(11) NOT NULL auto_increment,
  g_string varchar(255) default NULL,
  g_type int(11) default NULL,
  g_verb varchar(255) default NULL,
  g_noun varchar(255) default NULL,
  g_both varchar(255) default NULL,
  num int(11) default NULL,
  goal_id int(11) default NULL,
  game_type int(11) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_guesses`
--


INSERT INTO temp_guesses VALUES (1,'dog',11,'dog','','dog',1,116,3);

--
-- Table structure for table `temp_users`
--

CREATE TABLE temp_users (
  id int(11) NOT NULL auto_increment,
  player_id int(11) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_users`
--



--
-- Table structure for table `tmp_guesses`
--

CREATE TABLE tmp_guesses (
  id int(11) NOT NULL auto_increment,
  guess varchar(255) default NULL,
  t int(11) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_guesses`
--



--
-- Table structure for table `tmp_users`
--

CREATE TABLE tmp_users (
  id int(11) NOT NULL auto_increment,
  user_id varchar(255) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_users`
--



--
-- Table structure for table `users`
--

CREATE TABLE users (
  id int(11) NOT NULL auto_increment,
  login varchar(80) default NULL,
  email varchar(100) NOT NULL default '',
  newemail varchar(100) default NULL,
  score int(11) default '0',
  firstname varchar(40) default NULL,
  lastname varchar(40) default NULL,
  ipaddr varchar(15) NOT NULL default '',
  created_at datetime NOT NULL default '0000-00-00 00:00:00',
  updated_at datetime NOT NULL default '0000-00-00 00:00:00',
  verified tinyint(1) NOT NULL default '1',
  image text,
  role varchar(40) default NULL,
  security_token varchar(40) default NULL,
  token_expiry datetime default '0000-00-00 00:00:00',
  logged_in_at datetime default '0000-00-00 00:00:00',
  deleted int(11) default '0',
  delete_after datetime default '0000-00-00 00:00:00',
  `password` varchar(40) default NULL,
  PRIMARY KEY  (id)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--


INSERT INTO users VALUES (9,'dustin','',NULL,2072,NULL,NULL,'','2005-12-11 18:16:22','2006-09-22 13:04:05',1,NULL,'1',NULL,NULL,NULL,0,NULL,'0daed55524b59e3a142459620f7b1f1f05271ba0');
INSERT INTO users VALUES (10,'alea','',NULL,88,NULL,NULL,'','2005-12-11 18:16:41','2006-02-22 18:53:51',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'5b4826490bc529285fd564392b3a8bfa14e4d4fc');
INSERT INTO users VALUES (13,'chris','',NULL,0,NULL,NULL,'','2005-12-12 00:34:56','2005-12-12 00:34:56',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'ab03fa612baf71eed117088c0f15cb5c17f06d4b');
INSERT INTO users VALUES (11,'mako','',NULL,0,NULL,NULL,'','2005-12-11 18:39:04','2005-12-11 18:39:04',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'4f54fc9a7ac15932071d0ec5de3a833697d2741f');
INSERT INTO users VALUES (12,'cinderella','',NULL,18,NULL,NULL,'','2005-12-11 22:45:59','2005-12-12 01:35:27',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'9f3785211f31132c68b4e747a00cdfa10856870f');
INSERT INTO users VALUES (14,'rehtaeh','',NULL,8,NULL,NULL,'','2005-12-12 00:39:29','2005-12-12 00:40:55',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'1df56d3a28bfb8ed895c50c6df664b9b2175a51d');
INSERT INTO users VALUES (15,'spappala','',NULL,14,NULL,NULL,'','2005-12-12 01:18:49','2005-12-12 01:35:28',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'32f58a1f2a4833f64240e8c524c27cd9aa9041dc');
INSERT INTO users VALUES (16,'orkan','',NULL,0,NULL,NULL,'','2005-12-12 01:57:09','2005-12-12 01:57:09',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'95a295ddf37aba9147ffc0f2ddeefceea43032ec');
INSERT INTO users VALUES (17,'wicked','',NULL,0,NULL,NULL,'','2005-12-12 02:39:41','2005-12-12 02:39:41',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'ebc11ae9ad0b1df7d60df31df0e377a2167cbb90');
INSERT INTO users VALUES (18,'pushsingh','',NULL,48,NULL,NULL,'','2005-12-12 11:01:45','2005-12-13 15:17:04',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'24e72ca3308bdb898ca1ebd16b71691f17d110ca');
INSERT INTO users VALUES (19,'harold','',NULL,4,NULL,NULL,'','2005-12-12 15:55:21','2005-12-12 15:59:06',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'5f50a3b67c39dbb67ca4dbb39c82dcdbebb3fde4');
INSERT INTO users VALUES (20,'markan','',NULL,94,NULL,NULL,'','2005-12-12 17:26:55','2006-09-14 17:17:55',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'c3fcae6a4394a8fa014effebab8c77ef6b3c1e14');
INSERT INTO users VALUES (21,'scotty','',NULL,0,NULL,NULL,'','2005-12-12 18:03:42','2005-12-12 18:03:42',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'eadd28ed9fc2f850b16c6b7bdd37979cd3d996e7');
INSERT INTO users VALUES (22,'ence','',NULL,0,NULL,NULL,'','2005-12-12 18:32:16','2005-12-12 18:32:16',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'5282a1b335f054cd9c54a876230f44d6061d828e');
INSERT INTO users VALUES (23,'topeson','',NULL,38,NULL,NULL,'','2005-12-12 21:28:17','2005-12-13 15:17:06',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'432157abb074bc65c01b88d5fa18c0700d32605e');
INSERT INTO users VALUES (24,'K - Man 69','',NULL,0,NULL,NULL,'','2005-12-13 01:12:53','2005-12-13 01:12:53',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'d17242d93887d27eb6ddd93744ff26a738497700');
INSERT INTO users VALUES (25,'jose','',NULL,0,NULL,NULL,'','2005-12-13 12:01:22','2005-12-13 12:01:22',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'0152c76ac06052a071daeb0088022497128abe4f');
INSERT INTO users VALUES (26,'hockendougal','',NULL,44,NULL,NULL,'','2005-12-13 15:11:43','2005-12-13 15:17:04',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'efc47ae3f3d857673a4143b00598b4b7fa061968');
INSERT INTO users VALUES (27,'hugo','',NULL,104,NULL,NULL,'','2005-12-13 15:11:51','2005-12-13 15:23:16',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'9edacd73a20b9a998df494784d7ae5cd959c2362');
INSERT INTO users VALUES (28,'meyers','',NULL,36,NULL,NULL,'','2005-12-13 15:11:57','2005-12-13 15:17:04',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'956970e525329e9ac7086f8472ea119524e6c375');
INSERT INTO users VALUES (29,'davidb','',NULL,0,NULL,NULL,'','2005-12-13 15:12:15','2005-12-13 15:12:15',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'91bf0109047df4e301ec57f281292013b17b1100');
INSERT INTO users VALUES (30,'pantswagon','',NULL,12,NULL,NULL,'','2005-12-13 15:13:10','2005-12-13 15:17:06',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'19ee0eef8dfb721ba96811d74088e7450dbaab31');
INSERT INTO users VALUES (31,'aniki1225','',NULL,16,NULL,NULL,'','2005-12-13 15:14:20','2005-12-13 15:21:46',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'ab2338c9d26289471b7ec6727dd00b7e67a3ad72');
INSERT INTO users VALUES (32,'flanneltron','',NULL,20,NULL,NULL,'','2005-12-13 15:14:33','2005-12-13 15:21:48',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'942ccc853198ceb5afe48097f39e5637b32a78eb');
INSERT INTO users VALUES (33,'russly','',NULL,112,NULL,NULL,'','2005-12-16 23:51:04','2006-02-20 15:51:21',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'1564953234f18086eb8b4667c79e2ebe2553ec05');
INSERT INTO users VALUES (34,'you','',NULL,12,NULL,NULL,'','2006-01-11 12:49:48','2006-01-11 12:59:48',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'d54e6aa9c1cea83f8ec2944dc84023eb0a854e4d');
INSERT INTO users VALUES (35,'walter','',NULL,4,NULL,NULL,'','2006-01-13 08:57:53','2006-01-13 08:58:51',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'c17244935ffe2f76ea504e4b56d17bebc34f8597');
INSERT INTO users VALUES (36,'foo','',NULL,0,NULL,NULL,'','2006-01-22 16:03:32','2006-04-11 20:59:37',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'d54e6aa9c1cea83f8ec2944dc84023eb0a854e4d');
INSERT INTO users VALUES (37,'bubbles','',NULL,0,NULL,NULL,'','2006-01-22 16:40:41','2006-01-22 16:40:41',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'d78c019bcf2254a590ee931b089282f6b1dbb830');
INSERT INTO users VALUES (38,'pushsingh2','',NULL,0,NULL,NULL,'','2006-01-22 18:05:24','2006-01-22 18:05:24',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'ac8334bbb08b90ab44ebf3ca41e45046dc965634');
INSERT INTO users VALUES (39,'glover5577','',NULL,0,NULL,NULL,'','2006-01-22 20:28:55','2006-03-08 22:34:41',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'2fedcde02db65d80d544e97a993a1805087145a1');
INSERT INTO users VALUES (40,'eas13','',NULL,80,NULL,NULL,'','2006-01-24 12:03:39','2006-09-14 17:13:31',1,NULL,'1',NULL,NULL,NULL,0,NULL,'7397a477fa696235fc11e8362423b56fdb6af7ca');
INSERT INTO users VALUES (41,'ds2','',NULL,4,NULL,NULL,'','2006-01-24 15:41:54','2006-01-24 15:43:15',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'2fedcde02db65d80d544e97a993a1805087145a1');
INSERT INTO users VALUES (42,'newuser','',NULL,0,NULL,NULL,'','2006-01-26 18:08:36','2006-01-26 18:08:36',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'308b28ff808f9f50f01f69b852a3e14bc8edf556');
INSERT INTO users VALUES (43,'test','',NULL,0,NULL,NULL,'','2006-02-01 21:12:48','2006-02-01 21:12:48',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'a8b5fcc52457a5a8d349f1c01d255a3a46420fad');
INSERT INTO users VALUES (44,'automojo','',NULL,2404,NULL,NULL,'','2006-02-03 16:22:37','2006-09-22 13:04:05',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'03095d80bb1698630ef204ace68f46dbbf9dd818');
INSERT INTO users VALUES (45,'testuser','',NULL,132,NULL,NULL,'','2006-02-05 20:48:24','2006-09-20 14:13:49',1,NULL,'1',NULL,NULL,NULL,0,NULL,'a8b5fcc52457a5a8d349f1c01d255a3a46420fad');
INSERT INTO users VALUES (46,'extremes101','',NULL,8,NULL,NULL,'','2006-02-10 01:17:40','2006-02-10 01:19:58',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'653dd5a2c6e20df60b3fec2c83211d380c80e669');
INSERT INTO users VALUES (47,'arikan','',NULL,84,NULL,NULL,'','2006-02-12 19:33:54','2006-02-15 19:55:17',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'0067447495120875016115dfb16c3346b56242da');
INSERT INTO users VALUES (48,'barbara','',NULL,28,NULL,NULL,'','2006-05-01 14:47:35','2006-05-01 14:52:45',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'24f7631ca120ee468c0bb3dcf93cbbdee5f6284d');
INSERT INTO users VALUES (49,'ianeslick','',NULL,0,NULL,NULL,'','2006-05-22 14:17:56','2006-05-22 14:17:56',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'09914faf6de69ea11dd3a815c760b6c3e6a144e6');
INSERT INTO users VALUES (50,'demodustin','',NULL,68,NULL,NULL,'','2006-05-23 09:08:53','2006-05-25 16:32:47',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'7397a477fa696235fc11e8362423b56fdb6af7ca');
INSERT INTO users VALUES (51,'amelia','',NULL,102,NULL,NULL,'','2006-06-19 11:40:33','2006-08-04 15:36:01',1,NULL,'1',NULL,NULL,NULL,0,NULL,'8ed4e6e5cd7169c7d41dda51cbf35186f63ffeca');
INSERT INTO users VALUES (52,'beabea','',NULL,0,NULL,NULL,'','2006-07-06 12:36:29','2006-07-06 12:36:29',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'78dbcbdaf3ec1474f408eb75f590de36b3bc2b2f');
INSERT INTO users VALUES (53,'lieber','',NULL,306,NULL,NULL,'','2006-07-11 11:37:34','2006-09-14 17:56:08',1,NULL,'1',NULL,NULL,NULL,0,NULL,'e9dff2346a062e8519a4088bbcc2d6ba56f92dbc');
INSERT INTO users VALUES (54,'danjared','',NULL,30,NULL,NULL,'','2006-08-04 12:21:44','2006-08-04 15:04:14',1,NULL,'1',NULL,NULL,NULL,0,NULL,'298a83187903b3be53c099d34013b1539bc1fc94');
INSERT INTO users VALUES (55,'amelia2','',NULL,12,NULL,NULL,'','2006-08-04 12:46:40','2006-08-04 13:25:08',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'40670bfb0b4c4d31a1260b52d26da9bbd67d1d27');
INSERT INTO users VALUES (56,'amelia3','',NULL,36,NULL,NULL,'','2006-08-04 12:57:58','2006-08-04 15:36:01',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'e8383fb3f53e0e68fd1566005d53d3baaea8acf4');
INSERT INTO users VALUES (57,'testtesttest','',NULL,36,NULL,NULL,'','2006-09-13 17:54:52','2006-09-14 16:52:17',1,NULL,'1',NULL,NULL,NULL,0,NULL,'a8b5fcc52457a5a8d349f1c01d255a3a46420fad');
INSERT INTO users VALUES (58,'fabianopinatti','',NULL,434,NULL,NULL,'','2006-09-14 15:04:48','2006-09-14 17:54:34',1,NULL,'1',NULL,NULL,NULL,0,NULL,'97319daf0ba80f2d620c004eb1aa08e3a7879eb6');
INSERT INTO users VALUES (59,'murielgodoi','',NULL,316,NULL,NULL,'','2006-09-14 15:06:56','2006-09-14 17:59:28',1,NULL,'1',NULL,NULL,NULL,0,NULL,'191f1193467e7796bfc480e57b1552c574cf3171');
INSERT INTO users VALUES (60,'and4hitch','',NULL,0,NULL,NULL,'','2006-09-14 15:07:17','2006-09-14 15:07:17',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'4ca898a76df80077059fe9cc2547b5dfad2c4018');
INSERT INTO users VALUES (61,'cinneidesean','',NULL,0,NULL,NULL,'','2006-09-14 15:12:47','2006-09-14 15:12:47',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'1f60192b2ec38e8cd6993eefb2eca46d3f6ba594');
INSERT INTO users VALUES (62,'Brionius','',NULL,4,NULL,NULL,'','2006-09-14 16:18:38','2006-09-14 16:20:23',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'35bf20f4b0fa487aa56f78637731f6a02d3a451d');
INSERT INTO users VALUES (63,'patricia','',NULL,356,NULL,NULL,'','2006-09-14 16:28:36','2006-09-14 17:41:19',1,NULL,'1',NULL,NULL,NULL,0,NULL,'df6b94cfaa244f236db8b301dd6f6652c921c074');
INSERT INTO users VALUES (64,'americo','',NULL,306,NULL,NULL,'','2006-09-14 16:56:43','2006-09-14 17:34:04',1,NULL,'1',NULL,NULL,NULL,0,NULL,'3d513809585694cb2442f72861670ecd0a85dd6a');
INSERT INTO users VALUES (65,'vania','',NULL,494,NULL,NULL,'','2006-09-14 17:02:14','2006-09-14 17:40:43',1,NULL,'1',NULL,NULL,NULL,0,NULL,'2fea3b2a72f8754dbc80ad4da96eb18df398a19a');
INSERT INTO users VALUES (66,'André','',NULL,376,NULL,NULL,'','2006-09-14 17:09:57','2006-09-14 17:48:10',1,NULL,'1',NULL,NULL,NULL,0,NULL,'4ca898a76df80077059fe9cc2547b5dfad2c4018');
INSERT INTO users VALUES (67,'junia','',NULL,166,NULL,NULL,'','2006-09-14 17:11:19','2006-09-14 18:48:21',1,NULL,'1',NULL,NULL,NULL,0,NULL,'6d4bfc5b53b518214b054c0e34ed3fa355620c37');
INSERT INTO users VALUES (68,'frogday','',NULL,78,NULL,NULL,'','2006-09-14 17:15:38','2006-09-14 17:33:05',1,NULL,'1',NULL,NULL,NULL,0,NULL,'f69211ad8601d839b02dd11ca975b82101660d66');
INSERT INTO users VALUES (69,'Kawika','',NULL,16,NULL,NULL,'','2006-09-14 17:36:54','2006-09-14 17:39:11',1,NULL,'1',NULL,NULL,NULL,0,NULL,'1dddc076b8284967193f569bc879a5c4065d66ce');
INSERT INTO users VALUES (70,'moin','',NULL,8,NULL,NULL,'','2006-09-14 18:02:33','2006-09-14 18:06:27',1,NULL,'1',NULL,NULL,NULL,0,NULL,'65a2649841e1d79b7c86c79cef8a0329b6776912');
INSERT INTO users VALUES (71,'slowb','',NULL,48,NULL,NULL,'','2006-09-16 10:34:02','2006-09-16 10:43:17',1,NULL,'1',NULL,NULL,NULL,0,NULL,'0fe05f51e91f06f505d4a9fa0bbe39fe22c205f9');
INSERT INTO users VALUES (72,'enth','',NULL,0,NULL,NULL,'','2006-09-16 10:37:38','2006-09-16 10:37:38',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'8ac1986df65d7be2f0ed8ee3497502f56e20830a');
INSERT INTO users VALUES (73,'sinji2','',NULL,16,NULL,NULL,'','2006-09-17 23:08:56','2006-09-17 23:11:06',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'2270be342f77e11c25877c8d71b46ab43666a3eb');
INSERT INTO users VALUES (74,'enthusia','',NULL,0,NULL,NULL,'','2006-09-21 21:14:34','2006-09-21 21:14:34',1,NULL,NULL,NULL,NULL,NULL,0,NULL,'f67b4e7e533f42c14cf715ca167a8ae64c13ca2b');

--
-- Table structure for table `webs`
--

CREATE TABLE webs (
  id int(10) unsigned NOT NULL auto_increment,
  created_at datetime NOT NULL default '0000-00-00 00:00:00',
  updated_at datetime NOT NULL default '0000-00-00 00:00:00',
  `name` varchar(60) NOT NULL default '',
  address varchar(60) NOT NULL default '',
  `password` varchar(60) default NULL,
  additional_style varchar(255) default NULL,
  allow_uploads tinyint(4) default '1',
  published tinyint(4) default '0',
  count_pages tinyint(4) default '0',
  markup varchar(50) default 'textile',
  color varchar(6) default '008B26',
  max_upload_size int(11) default '100',
  safe_mode tinyint(4) default '0',
  brackets_only tinyint(4) default '0',
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webs`
--


INSERT INTO webs VALUES (1,'2005-11-30 11:53:58','2006-01-15 22:15:30','NarrateGame','narrate',NULL,'#main { margin: 30px; \r\n text-align: left; vertical-align: middle; margin: 0px auto; padding:\r\n 20px; width: 80%; background-color: #ffffff; border: 1px solid #8080FF;\r\n }\r\n \r\nbody {\r\nbackground:  #ddc;\r\n}\r\n\r\n',0,1,1,'mixed','008B26',NULL,1,0);

--
-- Table structure for table `wiki_references`
--

CREATE TABLE wiki_references (
  id int(10) unsigned NOT NULL auto_increment,
  created_at datetime NOT NULL default '0000-00-00 00:00:00',
  updated_at datetime NOT NULL default '0000-00-00 00:00:00',
  page_id int(11) NOT NULL default '0',
  referenced_name varchar(60) NOT NULL default '',
  link_type char(1) NOT NULL default '',
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wiki_references`
--


INSERT INTO wiki_references VALUES (24,'2006-01-15 20:14:04','2006-01-15 20:14:04',2,'ProblemsWithOMCS','L');
INSERT INTO wiki_references VALUES (25,'2006-01-15 20:14:04','2006-01-15 20:14:04',2,'DomainsOfCommonsenseKnowledge','L');
INSERT INTO wiki_references VALUES (44,'2006-01-15 22:20:59','2006-01-15 22:20:59',13,'WordNet','W');
INSERT INTO wiki_references VALUES (45,'2006-01-15 22:20:59','2006-01-15 22:20:59',13,'GlueNet','W');
INSERT INTO wiki_references VALUES (49,'2006-01-21 15:22:42','2006-01-21 15:22:42',8,'ToDoList','L');
INSERT INTO wiki_references VALUES (50,'2006-01-21 15:22:42','2006-01-21 15:22:42',8,'RecentUpdates','L');
INSERT INTO wiki_references VALUES (51,'2006-01-21 15:22:42','2006-01-21 15:22:42',8,'KnowledgeRepresentations','L');
INSERT INTO wiki_references VALUES (52,'2006-01-21 15:22:42','2006-01-21 15:22:42',8,'CommonsenseFeudGame','L');
INSERT INTO wiki_references VALUES (53,'2006-01-21 15:22:42','2006-01-21 15:22:42',8,'EpsilonEclipseSVN','L');
INSERT INTO wiki_references VALUES (54,'2006-01-21 15:22:42','2006-01-21 15:22:42',8,'UserFeedback','L');
INSERT INTO wiki_references VALUES (59,'2006-01-21 15:23:59','2006-01-21 15:23:59',14,'RadRails','W');
INSERT INTO wiki_references VALUES (60,'2006-01-21 15:23:59','2006-01-21 15:23:59',14,'SubVersion','W');
INSERT INTO wiki_references VALUES (68,'2006-01-22 18:30:24','2006-01-22 18:30:24',6,'WordNet','W');
INSERT INTO wiki_references VALUES (69,'2006-01-22 18:30:24','2006-01-22 18:30:24',6,'JavaScript','W');
INSERT INTO wiki_references VALUES (70,'2006-01-22 18:30:24','2006-01-22 18:30:24',6,'MySQL','W');
INSERT INTO wiki_references VALUES (71,'2006-01-22 18:30:24','2006-01-22 18:30:24',6,'FeudGame','L');
INSERT INTO wiki_references VALUES (82,'2006-01-23 08:23:33','2006-01-23 08:23:33',1,'CapableOf�?','W');
INSERT INTO wiki_references VALUES (83,'2006-01-23 08:23:33','2006-01-23 08:23:33',1,'ConceptNet','W');
INSERT INTO wiki_references VALUES (88,'2006-02-06 00:06:24','2006-02-06 00:06:24',9,'SemanticParser','L');
INSERT INTO wiki_references VALUES (89,'2006-02-06 00:06:24','2006-02-06 00:06:24',9,'BootStrapping','L');

