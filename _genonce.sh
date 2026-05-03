#!/bin/bash
publisher_jar=publisher.jar
input_cache_path=./input-cache/
echo Checking local terminology server...
if curl -sSf http://localhost:3000/metadata > /dev/null 2>&1; then
	echo "Using local TX server (localhost:3000)"
	txoption="-tx http://localhost:3000"
else
	echo "Local TX server not available, checking internet..."
	if curl -sSf tx.fhir.org > /dev/null 2>&1; then
		echo "Online — using tx.fhir.org"
		txoption=""
	else
		echo "Offline"
		txoption="-tx n/a"
	fi
fi

echo "$txoption"

export JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS -Dfile.encoding=UTF-8"

publisher=$input_cache_path/$publisher_jar
if test -f "$publisher"; then
	java -jar $publisher -ig . $txoption $*

else
	publisher=../$publisher_jar
	if test -f "$publisher"; then
		java -jar $publisher -ig . $txoption $*
	else
		echo IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
	fi
fi
