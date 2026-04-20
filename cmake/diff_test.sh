#!/usr/bin/env bash

set -uo pipefail

numdiff_executable="$1"
output_file="$2"
reference_file="$3"

$numdiff_executable -a 1e-6 -q -s ' \t\n:' $output_file $reference_file

NUMDIFF_RESULT=$?

# If there is no difference between reference and output, the test passes.
if [ "$NUMDIFF_RESULT" -eq 0  ]; then
    exit 0
fi

# If there is a difference, and we are running CI tests then we replace the reference file
# with our output so that we can diff the project. Exit 0 so that the following tests
# still run.
if [ -v GENERATE_REFERENCE_OUTPUT ]; then
  cp $output_file $reference_file
  exit 0
fi

# If there is a difference and we are not running CI tests, should return an error
exit 1
