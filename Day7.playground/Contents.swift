import Cocoa

//functions//
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart form centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

var number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

//tryping to remake code above but adding parameters//
func remakeNumber(number: Int) {
    if number.isMultiple(of: 2) {
        print("Even")
    } else {
        print("Odd")
    }
}

remakeNumber(number: 2)

let roll = Int.random(in: 1...20)

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 5)


//return values from functions//
let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

//solution one : missing sort//
func compareString(stringOne: String, stringTwo: String) -> Bool {
    if stringOne.count == stringTwo.count {
        return Bool(true)
    } else {
        return Bool(false)
    }
}

let results2 = compareString(stringOne: "Bye", stringTwo: "Hello")
print(results2)

//solution two: (without looking at the answer)//

func challenge(stringOne: String, stringTwo: String) -> Bool {
    if stringOne.sorted() == stringTwo.sorted() {
        return Bool(true)
    } else {
        return Bool(false)
    }
}

let solution = challenge(stringOne: "Hello", stringTwo: "olleH")
print(solution)

//Course solution : less code, more simple//
func areLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)


//return multiple values//
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}


let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

//shorter version//
func getUser2() -> (String, String) {
    ("Taylor", "Swift")
}

let user2 = getUser2()
print("Name: \(user2.0) \(user2.1)")


func rollDice(sides: Int, count: Int) -> [Int] {
    //starts with an empty array//
    var rolls = [Int]()
    
    //roll as many dice as needed//
    for _ in 1...count {
        //add each result to our array//
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    //send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)


func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

let lyric = "I see a red door and I want it painted balck."
print(lyric.hasPrefix("I see"))

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let results = isUppercase(string)


func printTimesTable2(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable2(for: 5)
