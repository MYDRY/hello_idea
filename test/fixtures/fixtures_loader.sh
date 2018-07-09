#!/bin/sh

fixtures=(
    'genres'
    'users'
    'topics'
    'ideas'
    'comments'
    'likes'
)

for fixture in ${fixtures[@]}; do
    echo "loading fixture for '${fixture}'"
    rails db:fixtures:load FIXTURE=${fixture}
    echo "done"
done
