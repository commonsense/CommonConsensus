# Make file for Common Consenus 
# requires mxmlc to be in path  ( type 'locate mxmlc')
#

MXML_DIR = "/Applications/Adobe Flash Builder 4.7/sdks/3.6.0/bin/"
LICENSE_ARG = #"-license=flexbuilder3,0000000000000000000000"

make: CommonConsensus.mxml commonconsenus/*/*.mxml commonconsenus/**/*.as
	mxmlc $(LICENSE_ARG) CommonConsensus.mxml -external-library-path=libs/
	mv CommonConsensus.swf ../server/server/game/

debug: CommonConsensus.mxml commonconsenus/*/*.mxml commonconsenus/**/*.as
	mxmlc $(LICENSE_ARG) -debug=true -external-library-path=libs/ CommonConsensus.mxml
	mv CommonConsensus.swf ../server/server/game/
