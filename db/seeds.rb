# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
initial_genres = Genre.create([{ id: 1, name: '理想' },
                               { id: 2, name: '問題' },
                               { id: 3, name: 'その他'}
                              ])
