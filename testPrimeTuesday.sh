#!/usr/bin/env bash
#
# defines a shell function called isPrimeTuesday which returns 'true' (0) if this is a prime Tuesday
#
# to use this script, run it as usual:
# $ ./testPrimeTuesday.sh
# , and in order to test it, run it with env variable RUNSHALL set:
# $ RUNSHALL=1 ./testPrimeTuesday.sh
#

# the code:

# testing on Tuesday
isTuesday()
{
    test `date +%w` -eq 2
}

# testing on prime:
isPrime()
{
    # by definition, 1 is no prime
    # we use factor to find about prime numbers
    # $ prime 6
    # 6: 2 3
    # $prime 7
    # 7: 7
    # , which means that 'two words' output identifies a prime
    dayOfMonth=$(date +%d)
    factors=$(factor $dayOfMonth)
    test $dayOfMonth -ne 1 -a $(echo $factors|wc -w) -eq 2
}

isPrimeTuesday()
{
    isPrime && isTuesday
}


#
# only run tests when environment variable RUNSHALL is set
# this way, tests and the real stuff can live in the same
# file
#
if test $RUNSHALL; then
    . ./shall

    # the tests:
    test_Tuesday()
    {
        mock date 'orig_date -d 20140805 $@'
        assertOK isTuesday
    }
    
    test_Wednesday()
    {
        mock date 'orig_date -d 20140812 $@'
        assertFail isTuesday
    }
    
    test_Prime()
    {
        mock date 'orig_date -d 20140805 $@'
        assertOK isPrime
    }
    
    test_NoPrime()
    {
        mock date 'orig_date -d 20140805 $@'
        assertFail isPrime
    }
    test_PrimeTuesday()
    
    {
        mock date 'orig_date -d 20140805 $@'
        assertOK isPrimeTuesday
    }
    mock_dateNoPrimeTueday()
    {
        orig_date -d 20140812 $@
    }
    test_NoPrimeTuesday()
    
    {
        mock date mock_dateNoPrimeTueday
        assertFail isPrimeTuesday
    }
    
    testRun
    exit $?
fi

# running stuff
if isPrimeTuesday; then
    echo "Prime Tuesday"
else
    echo "Meh."
fi

# vi:st=4:ts=4:et:ai: