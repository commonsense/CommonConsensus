
make: CommonConsensus.mxml commonconsenus/*/*.mxml commonconsenus/**/*.as
	mxmlc CommonConsensus.mxml
	mv CommonConsensus.swf ../server/static/

debug: CommonConsensus.mxml commonconsenus/*/*.mxml commonconsenus/**/*.as
	mxmlc $(LICENSE_ARG) -debug=true -external-library-path=libs/ CommonConsensus.mxml
	mv CommonConsensus.swf ../server/server/game/
