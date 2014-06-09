#! /bin/bash

# A script for setting up environment for travis-ci testing.
# Sets up Lua and Luarocks.
# LUA must be "lua5.1", "lua5.2" or "luajit".
# PLATFORM must be "linux" or "macosx".

if [ -z "$PLATFORM" ]; then
  PLATFORM=$TRAVIS_OS_NAME;
fi

if [ "$PLATFORM" == "osx" ]; then
  PLATFORM="macosx";
fi

# http://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linuxluz-
if [ -z "$PLATFORM" ]; then
  if [ "$(uname)" == "Linux" ]; then
    PLATFORM="linux";
  else
    PLATFORM="macosx";
  fi;
fi

echo "==========================="
echo " uname      : $(uname)     "
echo " uname      : $(uname -s)  "
echo " uname      : $(expr substr $(uname -s) 1 5)"
echo " Travis     : $TRAVIS_OS_NAME"
echo " Platform   : $PLATFORM    "
echo " Lua        : $LUA         "
echo " LuaRocks   : $LUAROCKS    "
echo "==========================="
echo

if [ "$LUA" == "luajit" ]; then
  curl http://luajit.org/download/LuaJIT-2.0.2.tar.gz | tar xz
  cd LuaJIT-2.0.2
  make && sudo make install
  sudo ln -s /usr/local/bin/luajit /usr/local/bin/lua
  cd $TRAVIS_BUILD_DIR;
else
  if [ "$LUA" == "lua5.1" ]; then
    curl http://www.lua.org/ftp/lua-5.1.5.tar.gz | tar xz
    cd lua-5.1.5;
  elif [ "$LUA" == "lua5.2" ]; then
    curl http://www.lua.org/ftp/lua-5.2.3.tar.gz | tar xz
    cd lua-5.2.3;
  fi
  sudo make $PLATFORM install
  cd $TRAVIS_BUILD_DIR;
fi

LUAROCKS_BASE=luarocks-$LUAROCKS
curl http://luarocks.org/releases/$LUAROCKS_BASE.tar.gz | tar xz
cd $LUAROCKS_BASE;

if [ "$LUA" == "luajit" ]; then
  ./configure --lua-suffix=jit --with-lua-include=/usr/local/include/luajit-2.0;
else
  ./configure;
fi

make build && sudo make install

cd $TRAVIS_BUILD_DIR

rm -rf $LUAROCKS_BASE

if [ "$LUA" == "luajit" ]; then
  rm -rf LuaJIT-2.0.2;
elif [ "$LUA" == "lua5.1" ]; then
  rm -rf lua-5.1.5;
elif [ "$LUA" == "lua5.2" ]; then
  rm -rf lua-5.2.3;
fi
