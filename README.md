Shall
=====

Shall is supposed to be a set of Bourne Shell functions which provides you with a way to test your scripts. Other people might call such a thing a "test framework", or even a "unit test framework". As Shall is supposed to be small, we shall not call it that. :)

Currently, it is used for bash scripts, so Bourne shell compatibility might not be given yet. This shall change over time.

Usage
=====

Test Functions
--------------

Include shall in your script:

    . ./shall

Add test functions to your script:

    test_MyFeature()
    {
        assertOK test 5 -lt 7
    }

Call testRun in your script (optionally on some condition):

    test $RUNSHALL && testRun

This way, you can simply add all your test case to the script that you want to use instead of having a second script. If you make the sourcing and definition of your test function depending on some condition which is met in your dev environment, so that it might not be set in your production environment, you don't even have to ship shall with your script:

    if test $RUNSHALL; then
        . ./shall
        test_MyFeature()
        {
          ...
        }
        testRun
        exit
    fi

Mocking
-------

In order to provide tests with a defined environment, you might want to create mock commands which create defined output, leaving defined state, just as you want mock objects in other programming environments. In order to do so, shall comes with the 'mock' function which lets you override any other function or command with whatever you want:

    checkUser()
    {
        if test $(whoami) = 'teqster'; then
          echo "Welcome, you are the right user."
        fi
    }
    myWhoami()
    {
        echo 'teqster'
    }
    test_checkUser()
    {
        mock whoami myWhoami
        output=$(checkUser|grep Welcome)
        # output not empty?
        assertOK test -n \"$output\"
    }

The above example defines a function checkUser and a test called test_checkUser, which is using the function myWhoami as mock command for whoami. Often, mock commands will be rather simplistic, so mocking a command with some line(s) of shell script instead of shell functions is possible:

    checkUser()
    {
        if test $(whoami) = 'teqster'; then
          echo "Welcome, you are the right user."
        fi
    }
    test_checkUser()
    {
        mock whoami 'echo teqster'
        output=$(checkUser|grep Welcome)
        # output not empty?
        assertOK test -n \"$output"
    }

This does the same, but without the need for a mock function. 

Mocks will be cleaned up after each test function. You can access the original commands using the 'orig_' prefix in the mock code. testPrimeTuesday.sh gives you some example how to do this using the date command.

The mocking feature is - like all of shall - in a very early state, subject to change and experimentation, so please do not yet rely on it too much.

Todos ("Roadmap")
=================

- ensure Bourne Shell compatibility
- add more assert helpers, if meaningful
- make everything much more robust!
- add script option which runs testRun automatically ("--shall run")
- improve mocking functionality


License
=======

The MIT License (MIT)

Copyright (c) 2014 teqster

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

