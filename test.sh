#!/bin/sh

for action in $(find ".github/actions" -name "action.yml"); do
    action_path=$(dirname $action)
    action_name=$(basename $action_path)

    echo "Building \"$action_name\" action..."
    pushd "$action_path" >/dev/null
    npm run build
    popd >/dev/null
    git add "$action_path/dist/index.js"
    echo
done
