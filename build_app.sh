#!/bin/bash

success=0
failure=0
iterations=0
while [ $iterations -lt 10 ]; do
	iterations=`expr $iterations + 1`
	echo "Build $iterations"
	rm -rf ~/Library/Developer/Xcode/DerivedData/TestMobileSDKBuild-*
	xcodebuild -project TestMobileSDKBuild.xcodeproj -scheme TestMobileSDKBuild -sdk iphonesimulator -configuration Debug clean build > /dev/null 2>&1
	status=$?
	if [ $status -eq 0 ]; then
		success=`expr $success + 1`
	else
		failure=`expr $failure + 1`
	fi
done

echo "Successful builds: $success"
echo "Failed builds: $failure
"