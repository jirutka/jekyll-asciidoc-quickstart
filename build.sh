#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then

	#Set git user
	git config --global user.email <REPLACE WITH EMAIL>
	git config --global user.name <REPLACE WITH NAME>

	echo -e "Cloning gh-pages\n"
	git clone -b gh-pages https://${GH_TOKEN}@github.com/johncarl81/transfuse.git site

	echo -e "Building Jekyll site\n"
	jekyll build -d site

	cd site

	touch .nojekyll
	rm build.sh


	echo -e "Committing site\n"
	git commit -a -m "Travis build $TRAVIS_BUILD_NUMBER"
	git push --quiet origin gh-pages > /dev/null 2>&1

        cd ..
	rm -rf site

fi

