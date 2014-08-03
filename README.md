Shall
=====

Shall is supposed to be a set of Bourne Shell functions which provides you with a way to test your scripts. Other people might call such a thing a "test framework", or even a "unit test framework". As Shall is supposed to be small, we shall not call it that. :)

Currently, it is used for bash scripts, so Bourne shell compatibility might not be given yet. This shall change over time.

Usage
=====

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

Todos ("Roadmap")
=================

- ensure Bourne Shell compatibility
- add more assert helpers, if meaningful
- add script option which runs testRun automatically ("--shall run")


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

