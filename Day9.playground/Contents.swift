import Cocoa
//asigning function to variable//
func greetUser() {
    print("Hi there!")
}
 
greetUser()

var greetCopy = greetUser
greetCopy()

//*testing
func testNum() {
    var test = 11
    print("\(test)")
}

var testing = testNum
testing()

func greetUser2() {
    print("Hi there!")
}
//*

var greetCopy2: () -> Void = greetUser2

//*testing
let numberTen = { (ten: String) -> String in
    "This is number: \(ten)."
}
let numTen = numberTen("Ten")
print(numTen)
//*

//accepts no parameters and returns nothing//
func greetUser0() {
    print("returns no value")
}
var greetCopy0: () -> Void = greetUser0

//closure expression//
let sayHello1 = {
    print("Hello there!")
}

sayHello1()


let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello2("Taylor")

//accepts integer returns string//
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

//*test
func numThreeFunc(for getNum: Int) -> String {
    if getNum == 3 {
        return "Three"
    } else {
        return "Not Three"
    }
}

let threeClos: (Int) -> String = numThreeFunc
let printNum3 = threeClos(3)
print(printNum3)
//*

//more practice//
let myCar = { (model: String) -> String in
    "My Car: \(model)"
}
myCar("GT500")

//sorting//
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

//custom sorting//
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}
//passing into a function into sort//
//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

//longer version//
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})

//trailing closures and shorthand//
let teamTwo = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let sorted2 = teamTwo.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzzane" {
        return false
    }
    
    return a < b
}

let captainFirstTeamTwo = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

print(captainFirstTeam)

//reversed sort//
let reverseTeam = team.sorted { $0 > $1 }


// more examples//
let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)


func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)


func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)


func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("about to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

//checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func isOdd(number: Int) -> Bool {
    number.isMultiple(of: 2) == false
}

func luckyString(_ number: Int) -> String {
    "\(number) is a lucky number."
}

func printValue(_ string: String) {
    print(string)
}

luckyNumbers.filter(isOdd).sorted().map(luckyString).forEach(printValue)

