#!/bin/bash

{
	# Pattern taken from https://bitbucket.org/chromiumembedded/cef/issues/2596/improve-cef-version-number-format#comment-50679036
	export CEF_VERSION=$(perl -n -e  '/^\s*set\s*\(CEF_VERSION\s+"((?:\d+\.?){3}\+g\w+\+chromium-(?:\d+\.?){4})"\s*\)/i && print "$1"' "$1/CMakeLists.txt")
	echo -e '\n\nChanges'

	echo "git log --pretty=format:'%h - %s <%aN>' <after_commit>...<latest_commit>"

	if [ -z $CEF_VERSION ]; then
	  echo "Failed to retrieve cef version"
	  exit 1
	fi
} > /dev/null

echo "$CEF_VERSION"
