use WordNet::QueryData;

my $wn = WordNet::QueryData->new;

  print "Synset: ", join(", ", $wn->querySense("cat#n#7", "syns")),
  "\n";
    print "Hyponyms: ", join(", ", $wn->querySense("cat#n#1", "hypo")),
    "\n";
      print "Parts of Speech: ", join(", ", $wn->querySense("run")),
      "\n";
        print "Senses: ", join(", ", $wn->querySense("run#v")), "\n";
	  print "Forms: ", join(", ", $wn->validForms("lay down#v")),
	  "\n";
	    print "Noun count: ", scalar($wn->listAllWords("noun")),
	    "\n";
	      print "Antonyms: ", join(", ", $wn->queryWord("dark#n#1",
	      "ants")), "\n";
