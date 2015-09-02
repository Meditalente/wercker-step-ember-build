#!/bin/sh

if [ -e "./node_modules/.bin/ember" ]; then
  EMBER="./node_modules/.bin/ember"
  info "using locally installed ember"
else
  info "installing latest ember-cli"
  npm install -g ember-cli
  EMBER="ember"
fi

$EMBER -v

RESULT=`$EMBER build --environment $WERCKER_EMBER_BUILD_ENVIRONMENT`

if [[ $? -ne 0 ]]; then
  warning "$RESULT"
  fail "failed building"
else
  success "built successfully"
fi
