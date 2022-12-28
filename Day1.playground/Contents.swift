import Cocoa

//variable are used to store temporary info//
var name = "Ted"
name = "Rebecca"
name = "Keeley"

var favoriteShow = "Orange is the New Black"
favoriteShow = "The Good Place"
favoriteShow = "Doctor Who"

//constant, never change//
let character = "Daphne"

//print is used for debugging in the console//
var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "how many roads must a man walk down"

//string//
let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

//backslash before quotes//
let quote = "Then he tapped a sign saying \"Believe\" and walk away."

//multi-line string, triple quotes//
let movie = """
A day in
The life of an
Apple engineer
"""

//count characters in the string//
let nameLength = actor.count
print(nameLength)

//makes all charactors uppercase//
print(result.uppercased())

//checks string if it starts with//
print(movie.hasPrefix("A day"))

//checks string if it ends with//
print(filename.hasSuffix(".jpg"))

//short strings//
var quoteTwo = "Change the world by being yourself"

//long string//
var burns = """
The best laid schemes
0' mice and men
Gang aft agley
"""

//whole numbers, integers//
let score = 10
let reallyBig = 100_000_000

//math with integers//
let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

//compound assignment opperators//
var counter = 10
counter += 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

//ask if integer is a multiple of//
let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

//decimal numbers, floating-point number//
let decimalNumber = 0.1 + 0.2
print(decimalNumber)

//cannot mix double and int unless you tell ito//
let a = 1
let b = 2.0
let c = Double(a) + b
//or let c = a + int(b)

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

var rating = 5.0
rating += 2

//swift decides if int or double based on decimal//
var myInt = 1
var myDouble = 1.0

var total = myInt + Int(myDouble)
// will not work var total = myInt + myDouble//

