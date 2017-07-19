#!/bin/sh

# Check that the commit message is correctly formatted
#
# Example Passing message:
# feat(module): JIRA-123 Add a new feature
#
# Example failures:
# chore(module):JIRA-123 Add a new feature
# chore(module): JIRA-123 add a new feature
# chore(): JIRA-123 add a new feature

regex='^(feat|fix|docs|style|refactor|perf|test|chore)\([a-z]+-?[a-z]+\):{1} JIRA-[0-9]+ ([A-Z].*)'

test "" != "$(grep "$regex" "$1")" || {
  echo >&2 "Your message when the test above fails"
  exit 1
}