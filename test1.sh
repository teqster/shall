#!/usr/bin/env bash

. ./shall

test_OK()
{
    true
}

test_FAIL()
{
    false
}

test_asserOK_simple()
{
    assertOK true
}

test_asserOK_expand()
{
    assertOK test 5 -gt 2
}

test_assertFAIL_simple()
{
    assertFail false
}

test_assertFAIL_expand()
{
    assertFail test 5 -lt 2
}

testRun

# vi:st=4:ts=4:et:ai:
