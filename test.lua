print("------------------------------------")
print("Lua version: " .. (_G.jit and _G.jit.version or _G._VERSION))
print("------------------------------------")
print("")

local HAS_RUNNER = not not lunit
local lunit = require "lunit"
local TEST_CASE = lunit.TEST_CASE

local _ENV = TEST_CASE"some_test_case"

function test_1()
  local foo = require "foo"
  assert_function(foo.test_true)
  assert_true(foo.test_true())
end

function test_2()
  assert_false(false)
end

if not HAS_RUNNER then lunit.run() end
