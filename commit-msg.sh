#!/bin/sh

# Check that the commit message contains a particular string, e.g. JIRA ticket number

test "" != "$(grep 'JIRAPROJECT-' "$1")" || {
  echo >&2 "Your message when the test above fails"
  exit 1
}