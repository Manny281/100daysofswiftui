import Cocoa

//if condition//
let score = 85

if score > 80 {
    print("Great Job!")
}

let playerScore = 2000

if playerScore > 1800 {
    print("Level Up!")
}


//comparing/
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote.")
}

if playerScore >= 2000 {
    print("Level Up!")
}

if playerScore > 2100 {
    print("Level Up!")
}


//using string//
let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

let letterA = "A"
let letterT = "T"

if letterA < letterT {
    print("\(letterT) is bigger")
}

if letterA > letterT {
    print("\(letterA) is bigger")
}


//using array//
var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

var numbersTwo = [2, 5, 6, 7]

if numbersTwo.count <= 4 {
    numbersTwo.append(9)
}

print(numbersTwo)


//equality//
let country = "Canada"

if country == "Australia" {
    print("G'day!")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}


//check if empty//
var username = ""

if username.isEmpty {
    username = "Anonymous"
}

print("Welcome, \(username)")


//various ways to compare//
let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)


//using enums//
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
//prints: true, becuase small comes before large in case list//
print(first < second)


//checking muliple conditions//
let personAge = 16

if personAge >= 18 {
    print("you can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

let someCondition = 10

if someCondition > 20{
    print("This will run if the condition is true")
} else {
    print("This will run if the condition is false")
}

//else if
let thisCondition = 20

if thisCondition > 40 {
    print("Code to run if this condtion is true")
} else if thisCondition < 10 {
    print("Code to run if other condition is false and this one is true")
} else {
    print("Code to run if both conditions are false")
}

//logical operator//
let temp = 25

if temp > 20 && temp < 30 {
        print("It's a nice day.")
    }

let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent == true {
     print("You can buy the game!")
}

//enum//
enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's Fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}


enum favCar {
    case r33, typeR, gt500, cobra, p1, r4, unknown
}

let myCar = favCar.gt500

if myCar == .gt500 || myCar == .cobra {
    print("American Muscle")
} else if myCar == .r33 || myCar == .typeR {
    print("JDM")
} else if myCar == .p1 {
    print("Supercar")
} else {
    print("Euro")
}
//rewritten using switch statment//
switch myCar {
case .r33:
    print("This is a Nissan.")
case .typeR:
    print("This is a Honda.")
case .gt500:
    print("This is a Shelby.")
case .cobra:
    print("This is a Ford.")
case .p1:
    print("This is a Mclaren.")
case .r4:
    print("This is an Audi.")
case .unknown:
    print("Our car search is broken!")
}

//switch statment//
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm.")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forcast generator is broken!")
}

//default//
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}

//using fallthrough//
let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


//ternary conditional operator//
let ageOne = 18
let canVote = ageOne >= 18 ? "Yes" : "No"
print(canVote)

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

//enum//
enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

//two ways of writing the same code//
let isAuthenticated = true
print(isAuthenticated ? "Welcome!" : "Who are you?")
//is the same as//
if isAuthenticated {
    print("Welcome!")
} else {
    print("Who are you?")
}
