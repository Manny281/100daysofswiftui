import Cocoa

//inference type//
let surname = "Lasso"
var score = 0

let nameOne = "Manny"
var nameScore = 20
//same as//

//explicit type/
let surnameOne: String = "Lasso"
var scoreOne: Int = 0

let nameTwo = "Manny"
var nameScoreTwo = 20
//declare a double//
var scoreTwo: Double = 0

var playerThreeScore: Double = 200

//declaring explicit String, Int, Double, Bool//
let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true

let userNameOne: String = "Manny"
let chosenNumber: Int = 20
let moneyAmount: Double = 12.58
var isTrue: Bool = true

//complex types//
//array of string//
var albums: [String] = ["Red", "Fearless"]

var movies: [String] = ["Toy Story", "Tarzan", "Cars"]

//dictionary of string//
var user: [String: String] = ["id": "@twostraws"]

var gamePlayer: [String: String] = ["name": "Manny"]

//set of string//
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Women, Other"
])

var moviesSet: Set<String> = Set([
    "Toy Story",
    "Tarzan",
    "Cars"
])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
//for empty array of strings
var teams: [String] = [String]()


//two ways of writing empty array//
var cities: [String] = []
//or//
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

let username: String
username = "user"
print(username)

//type annotation makes sure it is a double//
var percentage: Double = 99

//checkpoint 2 challenge//
let faveMovies = ["Toy Story", "Cars", "Monsters inc", "Cars", "Cars"]
print(faveMovies)
print(faveMovies.count)

let setFaveMovies = Set(faveMovies)
print(setFaveMovies.count)
