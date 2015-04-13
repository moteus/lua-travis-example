[![Build Status](https://travis-ci.org/moteus/lua-travis-example.png?branch=master)](https://travis-ci.org/moteus/lua-travis-example)
[![Coverage Status](https://coveralls.io/repos/moteus/lua-travis-example/badge.png?branch=master)](https://coveralls.io/r/moteus/lua-travis-example?branch=master)
[![License](http://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

### This project demonstrates how to:
* Install Lua 5.1/5.2/5.3/JIT
* Install LuaRocks
* make and install Lua module containing C and Lua parts
* Run tests
* Post coverage report to [coveralls.io](https://coveralls.io) service

LuaJIT can be tested using latest stable release (2.0.3) and also current master branches of LuaJIT 2.0 and 2.1. These options map onto 'luajit', 'luajit2.0' and 'luajit2.1' in the test matrix, respectively.
