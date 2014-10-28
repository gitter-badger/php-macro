#!/bin/sh

make install

export TEST_PHP_EXECUTABLE=`which php`
export USE_ZEND_ALLOC=0

php run-tests.php -d extension=macro.so -m tests/*.phpt

# Display possible leaks and memory issues
cat tests/*.mem

# make test didn't return status code correctly
# use this to find whether the make test failed
cat tests/*.diff

if [ $? -eq 0 ]; then
	exit 1;
fi
