#! /bin/bash

set -eufo pipefail

source .travis/platform.sh

if [ "$PLATFORM" == "linux" ]; then
  sudo pip install cpp-coveralls;
else
  brew update
  brew install pyenv
  eval "$(pyenv init -)"
  pyenv install 2.7.6
  pyenv global 2.7.6
  pyenv rehash
  pip install cpp-coveralls
  pyenv rehash;
fi

cd $TRAVIS_BUILD_DIR
