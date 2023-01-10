import Cocoa

//handling missing data with optionals

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number = number {
    print(square(number: number))
} else {
    print("empty")
}


var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
//empty string
var str2 = ""
//optional
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil


//unwrap optionals with guard//

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return //will exit function
    }
    
    print("\(number) x \(number) is \(number * number)")
}

//unwrapptin optionals with nil coalescing

let captains = [
    "Enterpoise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]
//default value is "N/A"
let new = captains["Serenity"] ?? "N/A"


let tvShows = ["Archier", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let numbers = Int(input) ?? 0
print(numbers)


//optional chaining//
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")


struct Books {
    let title: String
    let author: String?
}

var books: Books? = nil
let authors = books?.author?.first?.uppercased() ?? "A"
print(authors)

//handle function failure with optionals//
enum UserError: Error {
    case badID, networkFailed
}

func getUser (id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

//alternative to do, try, and catch
let user = (try? getUser(id:23)) ?? "Anonymous"
print(user)


//checkpoint 9//
//my solution

func array(of randNum: [Int]?) -> Int { randNum?.randomElement() ?? Int.random(in: 1...100) }
