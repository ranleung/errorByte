# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


randall = User.create({username: "ranleung", password: "111"})

beginner1 = randall.codes.create({level: "Beginner", question: "Error Message: Unexpected end of input", correctCode: "var time = 5; <br><br>if (time < 20) {<br> console.log('Good day'); <br>}", wrongCode: "var time = 5; <br><br>if (time < 20) { <br>console.log('Good day');", hint: "control flow"})
beginner2 = randall.codes.create({level: "Beginner", question: "Error Message: Unexpected identifier", correctCode: "var time = 5; <br><br>if time < 1 { <br>console.log(“true”) <br>};", wrongCode: "var time = 5; <br><br>if time < 1 { <br>console.log(“true”) <br>};"})
beginner3 = randall.codes.create({level: "Beginner", question: "Which one yields 0?", correctCode: "console.log(64%2);", wrongCode: "console.log(64%3);"})

