import Cocoa

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harris"
let ringo = "Ringo Starr"

//arrays//
let beatles = [john, paul, george, ringo]
beatles[0]
beatles[1]

let players = ["Player One", "Player Two", "Player Three"]
players[1]

//sets are faster//
let colors = Set(["red", "green", "blue"])

let shapes = Set(["circle", "square", "triangle"])

//using an array would be a better fit//
let red = 3
let green = 5
let blue = 4

let colorLetters = Set([red, green, blue])

//unordered, duplicates get ignored//
let colors2 = Set(["red", "greeen", "blue", "red", "blue"])

let shapes2 = Set(["circle", "square", "circle", "square"])

//sets and arrays//
let arrayOfBlogCategories: [String] = ["Swift", "Debuging", "Xcode", "Workflow", "Optimization"]
let setOfBlogCategories: Set<String> = ["Swift", "Debuging", "Xcode", "Workflow", "Optimization"]

//array of strings//
let blogCategories = ["Swift", "Debuging", "Xcode", "Workflow", "Optimization"]

print(arrayOfBlogCategories)
print(setOfBlogCategories)

//tuples, hold a fixed set of unchangable items//
var name = (first: "Taylor", last: "Swift")
name.0
name.1
name.first
name.last

var playerOne = (first: "Player", last: "One", age: 28, level: 2)
playerOne.0
playerOne.1
playerOne.2
playerOne.3
playerOne.first
playerOne.last
playerOne.age
playerOne.level

print(playerOne.level)

//tuple version//
var website = (name: "Apple", url: "www.apple.com")
website.name
website.url
website.0
website.1

//array version//
var arrayWebsite = ["Apple", "www.apple.com"]
arrayWebsite[0]
arrayWebsite[1]

//tuple//
var person = (name: "Paul", age: 40, isMarried: true)

//tuple, use for fixed items//
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

//set, use to check quickly for unique items//
let set = Set(["aardvark", "astronaut", "azalea"])

//array, use if order matters, most common//
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

//dictionaries, like arrays but can be accesed using anything//
//dictionary that stores the height of singers using their name//
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeren": 1.73
]
heights["Taylor Swift"]

//give default to avoid nil return//
let favoriteIceCream = [
    "Paul": "Chocoalte",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Charlotte", default: "Unknown"]

//sometimes you want nil return to know its missing//
let results = [
    "english": 100,
    "french": 85,
    "geography": 75
]
let historyResult = results["history"]

//empty dictionary//
var teams = [String: String]()
teams["Paul"] = "Red"

//empty array//
var result = [Int]()

//empty set//
var word = Set<String>()
//or//
var numbers = Set<Int>()

//array and dictionionary//
var score = Dictionary<String, Int>()
var result1 = Array<Int>()

//enums are a way of defining groups of related values//
//example to avoid accidentaly using a different name//
let test = "failure"
let test2 = "failed"
let test3 = "fail"

//enum to define test result with either success or failure//
enum testResult {
    case success
    case failure
}

let test4 = testResult.failure
let test5 = testResult.success

//enum stores associated values//
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")
let running = Activity.running(destination: "park")
let singing = Activity.singing(volume: 48)

//weather enum//
enum Weather {
    case sunny
    case windy(speed: Int)
    case rainy(chase: Int, amount: Int)
}

//replaces writting unpleasant code such as://
enum Weather2 {
    case sunny
    case lightBreeze
    case aBitWindy
    case quiteBlusteryNow
    case nowThatsAStrongWind
    case thisIsSeriousNow
    case itsAHurricane
}

//assigning values to enums//
enum Planet: Int {
    case mercury = 1
    case Venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)


enum Music {
    case play
    case stop
    case skip
    case volumeRaise(raise: Int)
    case volumeLower(lower: Int)
    case fastforward(speed: Int)
    case rewind(speedBack: Int)
}

let volume = Music.volumeLower(lower: 12)

//100 days of swiftUI day 3//

var beatles2 = ["john", "Paul", "George", "Ringo"]
let numbers2 = [4, 8, 15, 16, 23, 42]
var temperatures2 = [25.3, 28.2, 26.4]

print(beatles2[0])
print(numbers2[1])
print(temperatures2[2])

beatles2.append("Adrian")
beatles2.append("Allen")
beatles2.append("Noval")
beatles2.append("Vivian")

//starting with empty array//
var scores2 = Array<Int>()
scores2.append(100)
scores2.append(80)
scores2.append(85)
print(scores2[1])

var albums2 = Array<String>()
albums2.append("Folklore")
albums2.append("Fearless")
albums2.append("Red")

//same as above//
var albums3 = [String]()
albums3.append("Folklore")
albums3.append("Fearless")
albums3.append("Red")

//starting with a array of strings//
var albums4 = ["Folklore"]
albums4.append("Fearless")
albums4.append("Red")

//removing from array//
var characters2 = ["Lana", "Pam", "Ray", "Sterling"]
print(characters2.count)

characters2.remove(at: 2)
print(characters2.count)

characters2.removeAll()
print(characters2.count)

//check if contains//
let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

//sort array//
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let numberSort = [83, 47, 12, 9, 28, 6]
print(numberSort.sorted())

//reverse sort, just remembers that its reversed//
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

//dictionaries//
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

//default to always get something back//
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])
print(employee2["status", default: "Unknown"])
print(employee2["manager", default: "Unknown"])

// using different data types together//
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics2 = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics2[2012, default: "unknown"])

var heights2 = [String: Int]()
heights2["Yao Ming"] = 229
heights2["Shaquille O'Neal"] = 216
heights2["LeBron James"] = 206

//can be overwritten//
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"


//sets//
let actors2 = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Niclolas Cage",
    "Samuel L Jackson"
])

print(actors2)


var actors3 = Set<String>()
actors3.insert("Denzel Washington")
actors3.insert("Tom Cruise")
actors3.insert("Nicolas Cage")
actors3.insert("Samuel L Jackson")
print(actors3)


//using enums//
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.wednesday

//other way of writing the same enum//
enum Weekday2 {
    case monday, tuesday, wednesday, thursday, friday
}

var day2 = Weekday2.monday
day2 = .tuesday
day2 = .friday

