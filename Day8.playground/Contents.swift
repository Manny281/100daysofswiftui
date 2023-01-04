import Cocoa

//providing default values for parameters//
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)


//handling errors//
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}
//using do //
let string = "12345"
do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error: \(error.localizedDescription)")
}


//checkpoint 4
//my solution, got stuck//
enum squareError: Error {
    case outOfBounds, noRoot
}
var sqroot = Int()
func squareRoot(_ number: Int) throws -> Int {
    if number >= 1 && number <= 10_000 {
        for i in 1...(number/2) {
            if i * i == number {
                return i
            }
        }
    } else if number < 1 || number > 10_000 {
        throw squareError.outOfBounds
    } else {
        throw squareError.noRoot
    }
    return sqroot
}

let number = 25
do {
    let answer = try squareRoot(number)
    print("The Square Root of \(number) is \(answer).")
} catch squareError.outOfBounds {
    print("Out Of Bounds: Please use 1 - 10,000.")
} catch squareError.noRoot {
    print("Can't find a Square Root of \(number): No Root.")
}


//actual solution//
enum RootError: Error {
    case tooLow, tooHigh, notFound
}

func squaRoot(of num: Int) throws -> Int {
    if num < 1 {
        throw RootError.tooLow
    }
    
    if num > 10_000 {
        throw RootError.tooHigh
    }
    
    for i in 1...100 {
        if i * i == num {
            return i
        }
    }
    throw RootError.notFound
}

let num = 25

do {
    let root = try squaRoot(of: num)
    print("The square root of \(num) is \(root).")
} catch {
    print("Sorry, there was a problem.")
}
