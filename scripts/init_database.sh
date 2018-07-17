#!/bin/sh

echo "cleaning up database."
rails db:migrate:reset
echo "done."
echo "loading seeds."
rails db:seed
echo "done."
