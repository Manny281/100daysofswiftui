import Cocoa

//boolean//
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let number2 = 121
print(number2.isMultiple(of: 3))

let goodDogs = true
let gameOver = false
let isMultiple = 120.isMultiple(of: 3)

let notMultiple = 121.isMultiple(of: 3)

//flip from to true to false//
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameStarted = true
gameStarted = !gameStarted
gameStarted = !gameStarted

//toggle to flip between true and false//
var endGame = false
print(endGame)
endGame.toggle()
print(endGame)

var startGame = true
startGame.toggle()

//joining two strings together with plus//
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let firstName = "Manny "
let lastName = "Martinez"
let fullName = firstName + lastName

//only works for small things//
let people = "Haters"
let action = "hate"
let lyric = people + "gonna" + action

let myShow = "cyberpunk "
var worstOrBest = "best "
let opinion = myShow + "is the " + worstOrBest + "show"

let luggageCode = "1" + "2" + "3" + "4" + "5"

//is the same as//
let luggageCode2 = "12345"

//using quotes//
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

//more efficent than using + & using string and int together//
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let theShow = "cyberpunk"
let topNumber = 5
let opinion2 = "The show \(theShow) is on my top \(topNumber) list."
print(opinion2)

let number3 = 11
let missionMessage = "Apollo \(number) landed on the moon."

let age2 = 1000
let mythMessage = "The Vampire is \(age2) years old."

//using math//
print("5 x 5 is \(5 * 5)")
print("100 - 50 is \(100 - 50)")

//used for injecting custon data into strings//
var city1 = "Cardiff"
var message1 = "Welcome to \(city1)!"
