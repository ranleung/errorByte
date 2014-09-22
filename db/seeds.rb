# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


randall = User.create({username: "ranleung", password: "111"})

beginner1 = randall.codes.create({level: "Beginner", question: "Error Message: Unexpected end of input", correctCode: "var time = 5; <br><br>if (time < 20) {<br> console.log('Good day'); <br>}", wrongCode: "var time = 5; <br><br>if (time < 20) { <br>console.log('Good day');", hint: "control flow"})
beginner2 = randall.codes.create({level: "Beginner", question: "Error Message: Unexpected identifier", correctCode: "var time = 5; <br><br>if (time < 1) { <br>console.log(“true”) <br>};", wrongCode: "var time = 5; <br><br>if time < 1 { <br>console.log(“true”) <br>};", hint: "syntax error"})
beginner3 = randall.codes.create({level: "Beginner", question: "Which code yields 0?", correctCode: "console.log(64%2);", wrongCode: "console.log(64%3);", hint:"modulus"})
beginner4 = randall.codes.create({level: "Beginner", question: "Which code yields 'derf'?", correctCode: "console.log('wonderful day'.substring(3,7));", wrongCode: " console.log('wonderful day'.substring(4,7));", hint: "The substring() method extracts the characters from a string, between two specified indices, and returns the new sub string."})
beginner5 = randall.codes.create({level: "Beginner", question: "Which code yields an infinite loop?", correctCode: "var i = 5;<br><br>while (i < 51) { <br>console.log(i); <br>}", wrongCode: "for (var i = 5; i < 51; i+=5) {<br>console.log(i);<br>}", hint: "Where does/doesn't it increment?"})
beginner6 = randall.codes.create({level: "Beginner", question: "Error: Unexpected token >=", correctCode: "for (var i = 10, i >= 0, i--) {<br>console.log(i); <br>}", wrongCode: "for (var i = 10; i >= 0, i--) {<br> console.log(i); <br>}", hint: "Which error comes first?"})
beginner7 = randall.codes.create({level: "Beginner", question: "Which code yields True?", correctCode: "var hungry = true;<br>var full = false;<br><br>if (hungry && (full || hungry)) { <br>console.log('true'); <br>}", wrongCode: "var hungry = true; <br>var full = false;<br><br>if (hungry && (full && hungry)) {<br>console.log('true'); <br>}", hint: "True && True === True, True && False === False, True | | False === True"})
beginner8 = randall.codes.create({level: "Beginner", question: "Which code console logs both 15 20?", correctCode: "switch(5+10) {<br>case 15: <br>console.log(’15'); <br>case 20: <br>console.log(’20'); <br>break;<br>default: <br>console.log(‘nothing'); <br>}", wrongCode: "switch(5+10) { <br>case 15: <br>console.log(’15'); <br>case 20:<br>console.log(’20');<br>default:<br>console.log(‘nothing'); <br>}", hint: "Both answers do not console log 15 ONLY."})
beginner9 = randall.codes.create({level: "Beginner", question: "Which code returns false?", correctCode: "var a = 0.1, b = 0.2; <br><br>console.log(a + b == 0.3);", wrongCode: "var a = 0.1, b = 0.2; <br><br>console.log('0.1 + 0.2 = ', a + b);", hint: "Arithmetic operations are not as precise as you’d think due to the way floating point numbers are represented in memory."})
beginner10 = randall.codes.create({level: "Beginner", question: "What will for (var i = 0; i < 10; i++) { } output?", correctCode: "10", wrongCode: "undefined", hint: "In JavaScript, though, this is not the case and the variable i remains in scope even after the for loop has completed, retaining its last value after exiting the loop. (variable hoisting)"})
