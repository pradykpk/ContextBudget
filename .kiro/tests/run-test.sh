#!/bin/bash
TEST_NAME=$1
AGENT=$2
PROMPT_FILE=$3

echo "Running test: $TEST_NAME"
echo "Switching to agent: $AGENT"

kiro <<EOF
/agent swap $AGENT
/context add runtime/runtime-session.md
$(cat $PROMPT_FILE)
EOF

