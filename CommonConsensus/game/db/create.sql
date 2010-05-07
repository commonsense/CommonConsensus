drop table if exists goals;
drop table if exists stories;
drop table if exists users;
drop table if exists contents;
drop table if exists structures;
drop table if exists concepts;


create table concepts (
	id				int			not null auto_increment,
	relation		varchar(255)	not null,
	node_a		varchar(255)	not null,
	node_b		varchar(255)   not null,
	primary key(id)
);


LOAD DATA LOCAL INFILE 'db/out.csv'
INTO TABLE concepts
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(relation,node_a,node_b);



create table goals (
	id					int 				not null auto_increment,
	name				varchar(255)	not null,
	created_by		int default 0,
	goal_used		int default 0,
	order_num  		int default 0,
	parent_id		int default 0,
	goals_count  int(11) DEFAULT 0,
	is_leaf			int(5) default 0,
	date_created	date,
	constraint fk_goal	foreign key (parent_id) references goals(id),
	primary key(id)
	
);


/*
LOAD DATA LOCAL INFILE 'db/sorted_goals.csv'
INTO TABLE goals
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(name,goal_used);
*/



create table stories (
	id			int 	not null auto_increment,
	user_id 	int 	not null,
	goal_id			int 	not null,
	date_created	date,
	constraint fk_stories_goals	foreign key (goal_id)	references goals(id),
	constraint fk_stories_users	foreign key (user_id) references users(id),
	primary key(id)
);

create table contents (
	
	id		int		not null auto_increment,
	story_id		int	not null,
	pos			int 	not null default 0,
	structure_id	int	not null,
	content		text	not null,
	constraint fk_content_story 	foreign key (story_id) references stories(id),
	constraint fk_content_structure	foreign key (structure_id) references structures(id),
	primary key(id)
);

create table structures (
	id			int not null auto_increment,
	stype		int default 0,
	name		varchar(255),
	expression text,
	primary key(id)
);

CREATE TABLE users (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(80) default NULL,
  `salted_password` varchar(40) default NULL,
  `email` varchar(100) NOT NULL default '',
  `newemail` varchar(100) default NULL,
  salt CHAR(40) NOT NULL,
   score int default 0,
  firstname VARCHAR(40) default NULL,
  lastname VARCHAR(40) default NULL,
  `ipaddr` varchar(15) NOT NULL default '',
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `verified` tinyint(1) NOT NULL default '1',
  `image` text,
  role VARCHAR(40) default NULL,
  security_token CHAR(40) default NULL,
  token_expiry datetime  default '0000-00-00 00:00:00',
  logged_in_at datetime default '0000-00-00 00:00:00',
  deleted INT default 0,
  delete_after datetime default '0000-00-00 00:00:00',
  primary key (id)
);


--
-- Table structure for table 'pages'
--         These are just the headers (page names); the text is in
--         the draft identified by "current_draft_id"
--
/*
CREATE TABLE pages (
  id int(10) unsigned NOT NULL auto_increment,
  type varchar(80) NOT NULL default '',
  created_on datetime default NULL,
  updated_on datetime default NULL,
  lock_version int(11) default '0',
  current_draft_id int(11) NOT NULL default '0',
  title varchar(80) NOT NULL default '',
  created_by int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Table structure for table 'drafts'
--         These are were the text is stored.  Note that drafts make
--         a tree, since each derived-draft knows which draft it was
--         based on.
--

CREATE TABLE drafts (
  id int(10) unsigned NOT NULL auto_increment,
  type varchar(80) NOT NULL default '',
  created_on datetime default NULL,
  draft_of_page_id int(11) default '0',
  based_on_draft_id int(11) default '0',
  body text NOT NULL,
  created_by int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

--
-- Table structure for table 'links'
--         These just keep track of which drafts refer to which pages;
--         that is, whenever a draft of one page contains a WikiWord that
--         generates a link to another page, that fact is noted here.
--

CREATE TABLE links (
  draft_id int(11) NOT NULL default '0',
  page_id int(11) NOT NULL default '0'
) TYPE=MyISAM;

*/

insert into structures(name,stype,expression) values ("plan_env",1,"I was at the f::place and had to go to the f::place");
insert into structures(name,stype,expression) values ("cause_effect_1",0,"I had to s::goal because s::prequisite.");
insert into structures(name,stype,expression) values ("cause_effect_2",0,"If I did not s::goal then I would f::consequencee");

insert into structures(name,stype,expression) values ("social_1",2,"Most people think that f::belief is a good way to s::goal");
insert into structures(name,stype,expression) values ("social_2",2,"However some people disagree and think that f::belief");

insert into structures(name,stype,expression) values ("places_1",3,"f::place is a good place to s::goal");
insert into structures(name,stype,expression) values ("places_2",3,"f::place is a part of f::place");

insert into structures(name,stype,expression) values ("places_b_1",4,"f::place is a bad place to s::goal");
insert into structures(name,stype,expression) values ("places_b_2",4,"f::place is a part of f::place");

insert into structures(name,stype,expression) values ("negative",5,"If you wanted to s::goal you would never f::action with f::noun");



insert into goals(name) value ('play tennis');
insert into goals(name) value ('go swimming');
insert into goals(name) value ('travel to new york');
insert into goals(name) value ('eat dinner');
insert into goals(name) value ('be happy');
insert into goals(name) value ('go to work');
insert into goals(name) value ('go to work when it is raining');


/* add dustin and alea */
insert into users(login,email, salted_password,salt,firstname,lastname) values ('dustin','dsmit@mit.edu','8a756edf68d6fa1b93685056840151358da2ee32','8e30b9cd60dc7b7cf3fa991e5632a03a33adba1c','Dustin','Smith');

/* pass = thealley */
insert into users(login,email,salted_password,salt,firstname,lastname) values
('alea','alea@mit.edu','41f5dd5e0da4a6d1e4074949c3604b8fbacfa8cd','296837ddf2cd4dd8a1fc11c6568393da8d45ebcc', 'Alea', 'Teeters');

insert into users(login,email,salted_password,salt,firstname,lastname) values
('pushsingh','push@mit.edu','f5b0f90238f12a8350fe6a470522899c84eed37e','3b2f9df2a582159a4b6323e1a227618c5b0a6d03','Push','Singh');

insert into users(login,email,salted_password,salt,firstname,lastname) values
('ianeslick', 'eslick@media.mit.edu','6aaf32db9b8e42ecf2cdc43a8c59f7589b559d4a','4915d909a5f262326094ffa4a7f85727de98ccd7','Ian','Eslick');