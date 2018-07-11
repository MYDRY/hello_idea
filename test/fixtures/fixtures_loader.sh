#!/bin/sh

fixtures=(
    'users'
    'topics'
    'ideas'
    'comments'
    'likes'
)

rails db:seed

for fixture in ${fixtures[@]}; do
    echo "loading fixture for '${fixture}'"
    rails db:fixtures:load FIXTURE=${fixture}
    echo "done"
done
