[![Build Status](https://travis-ci.org/moteus/lua-travis-example.png?branch=master)](https://travis-ci.org/moteus/lua-travis-example)
[![Coverage Status](https://coveralls.io/repos/moteus/lua-travis-example/badge.png?branch=master)](https://coveralls.io/r/moteus/lua-travis-example?branch=master)
[![License](http://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

### This project demonstrates how to:
* Install Lua 5.1/5.2/5.3/JIT
* Install LuaRocks
* make and install Lua module containing C and Lua parts
* Run tests
* Post coverage report to [coveralls.io](https://coveralls.io) service

LuaJIT can be tested using latest stable release (2.0.4) and also current master branches of LuaJIT 2.0 and 2.1. These options map onto 'luajit', 'luajit2.0' and 'luajit2.1' in the test matrix, respectively.

## Other CI

### [CodeShip](https://codeship.com)
[![Codeship Status for moteus/lua-travis-example](https://codeship.com/projects/a57c55e0-c4b7-0132-9bce-0a3d9756066d/status?branch=master)](https://codeship.com/projects/74177)

Test environment contain Lua 5.1.2/LuaRocks 2.0.8.
To use this luarocks you should use local tree to install Lua modules.
But also you can use this install script

```Bash
export LUAROCKS=2.2.1
export LUA=lua5.3
export TRAVIS_BUILD_DIR=$(pwd)
export TRAVIS_OS_NAME=linux
source .travis/setenv_lua.sh
$HOME/.lua/luarocks install Lua-cURL         --server=https://luarocks.org/dev
$HOME/.lua/luarocks install luacov-coveralls --server=https://luarocks.org/dev
$HOME/.lua/luarocks install lunitx
$HOME/.lua/luarocks make rockspecs/foo-scm-0.rockspec
```

Test script
```Bash
cd test
lunit.sh -i $HOME/.lua/lua test.lua
```
