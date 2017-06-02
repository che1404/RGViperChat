#!/bin/bash
if [ "${TRAVIS_BRANCH}" = "master" ]; then
        fastlane ios report_test_coverage
fi
