#!/bin/sh

# remove previous publication
rm -rf public
mkdir public

# clone gh-pages branch from the local repo into a repo located within "public"
git clone .git --branch gh-pages public
  
# generate
hugo
  
# commit the changes in the clone and push them back to the local gh-pages branch    
cd public && git add --all && git commit -m "Publishing to gh-pages (deploy.sh)"

# publish
git remote add upstream https://github.com/jcheng1203/pub-tips.git
git push upstream gh-pages