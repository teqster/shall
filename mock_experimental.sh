#!/usr/bin/env bash

. ./shall

# defining to how to mock curl
# TODO: mock individual commands for individual tests (instead of globally mocking them)
mock_curl()
{
  echo CALLING mock_curl >&2
  cat<<EOJ
[
  {
    "html_url": "https://github.com/teqster"
  }
]
EOJ
}

# apply mocks globally

parseRepoURL()
{
  curl https://api.github.com/users/teqster/repos|awk '/"html_url":/ {print $2}'|tr -d \"
}

test_repoUrlParse()
{
  # unfortunately we cannot go for
  #    assertOK parseRepoURL|grep -q https://github.com/teqster
  # here, because the pipe gets interpreted.
  # maybe something like
  #    assertOK 'parseRepoURL|grep -q https://github.com/teqster'
  # and eval later...
  url=$(parseRepoURL|grep https://github.com/teqster)
  assertOK test -n \"$url\"
}

test_repoUrlParse2()
{
  url=$(parseRepoURL|grep https://github.com/teqster/foo)
  assertFail test -n \"$url\"
}

testRun
