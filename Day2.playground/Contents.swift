import Cocoa

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harris"
let ringo = "Ringo Starr"

//arrays//
let beatles = [john, paul, george, ringo]
beatles[0]
beatles[1]

//sets are faster//
let colors = Set(["red", "green", "blue"])

//unordered, duplicates get ignored//
let colors2 = Set(["red", "greeen", "blue", "red", "blue"])

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


