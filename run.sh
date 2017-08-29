#!/bin/sh

if [ "$WERCKER_EMBER_BUILD_USE_CACHE" = "true" ]; then
  if [ -d "$WERCKER_CACHE_DIR/wercker/npm" ]; then
    debug "Configuring npm to use wercker cache"
    npm config set cache "$WERCKER_CACHE_DIR/wercker/npm"
  else
    debug "NPM cache not exists"
  fi
fi

if [ -e "./node_modules/.bin/ember" ]; then
  EMBER="./node_modules/.bin/ember"
  info "Using locally installed ember"
else
  info "Installing latest ember-cli globally"
  npm install -g ember-cli
  EMBER=$(which ember)
fi

info "$($EMBER -v)"

if $EMBER build --environment "$WERCKER_EMBER_BUILD_ENVIRONMENT"; then
  success "Built successfully"
else
  fail "Failed building"
fi
