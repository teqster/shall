#!/usr/bin/env bash
#
# minimal mocking
#

. ./shall

# function to test:
parseRepoURL()
{
  curl https://api.github.com/users/teqster/repos|awk '/"html_url":/ {print $2}'|tr -d \"
}

# checking on expected input
test_repoUrlParse()
{
  mock curl 'echo \"html_url\": \"https://github.com/teqster/bar\"'
  url=$(parseRepoURL|grep https://github.com/teqster/bar)
  assertOK test -n \"$url\"
}

# checking on unexpected input, since parsing is supposed to fail
test_repoUrlParseMissingQuotes()
{
  mock curl 'echo html_url: \"https://github.com/teqster/bar\"'
  url=$(parseRepoURL|grep https://github.com/teqster/bar)
  assertFail test -n \"$url\"
}

testRun
