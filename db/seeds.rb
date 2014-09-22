# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


randall = User.create({username: "ranleung", password: "111"})

js = randall.codes.create({level: "begin", question: "Unexpected end of input", correctCode: "if (time < 20) {<br> console.log('Good day'); <br>} ", wrongCode: "if (time < 20) {<br> console.log('Good day');", hint: "control flow"})


