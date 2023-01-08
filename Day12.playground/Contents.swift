import Cocoa
//classes//
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

//playground
class Car {
    var gear = 0 {
        didSet {
            if gear > 0 && gear < 6 {
                print("you are now in gear \(gear)")
            } else {
                print("out of bounds")
            }
        }
    }
}

var shift = Car()
shift.gear += 3


//inherit from another class//
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

final class Developer : Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times will spend hours arguing about whether code should be indented uding tabs or spaces.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours:12)
novall.printSummary()


//playground
class CarSpecs {
    var topSpeed: Int
    var quarterTime: Double
    
    init(topSpeed: Int, quarterTime: Double) {
        self.topSpeed = topSpeed
        self.quarterTime = quarterTime
    }
    
    func specs() {
        print("Max Speed: \(topSpeed). 1/4 mi. Time: \(quarterTime).")
    }
}

final class Mustang: CarSpecs {
    func name() {
        print("Mustang:")
    }
    
    override func specs() {
    print("Max: \(topSpeed) MPH. 1/4: \(quarterTime) sec.")
    }
}

final class Camaro: CarSpecs {
    func name() {
        print("Camaro:")
    }
}

let mustang = Mustang(topSpeed: 180, quarterTime: 13.4)
let camaro = Camaro(topSpeed: 200, quarterTime: 12.9)
camaro.name()
camaro.specs()
mustang.name()
mustang.specs()

//how to add initializers for classes//
class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Cars: Vehicle {
    let isConvertible: Bool
    
    init(isElectric:Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Cars(isElectric: true, isConvertible: false)

teslaX.isConvertible
teslaX.isElectric

class Engine {
    let isV8: Bool
    
    init(isV8: Bool) {
        self.isV8 = isV8
    }
}

//playground
class MyCar: Engine {
    let hasTurbo = false
}

let myMustang = MyCar(isV8: true)

myMustang.isV8
myMustang.hasTurbo


//how to copy classes//
class User {
    var username = "Anonymous"
    
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"

print(user1.username)
print(user2.username)


//deinitializer for class//
class Users {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm Alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}
//stores in an array, without it everything is deleted after each loop
var users = [Users]()

//data will be destroyed after the loop runs
for i in 1...3 {
    let user = Users(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
//clears array
users.removeAll()
print("Array is clear!")


//working with variables inside classes//
class UserA {
    var name = "Paul"
}

let user = UserA()
user.name = "Taylor"
print(user.name)


class UserB {
    var name = "Paul"
}

var userB = UserB()
userB.name = "Taylor"
userB = UserB   ()
print(userB.name)

//CheckPoint 7//

//my solution
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func legsPrint() {
        print("Has \(legs) legs.")
    }
}

class Dog: Animal {
    func speak() {
        print("A Dog Barks.")
    }
}
class Cat: Animal {
    var isTame : Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("A Cat Meows.")
    }
    
    func tame() {
        if isTame {
            print("This cat is tame.")
        } else {
            print("This cat is not tame.")
        }
    }
}

class Corgi: Dog {
    override func speak() {
        print("The corgi barks.")
    }
}

class Poodle: Dog {
    override func speak() {
        print("The poodle barks.")
    }
}

class Persian: Cat {
    override func speak() {
        print("The persian cat meows.")
    }
}

class Lion: Cat {
    override func speak() {
        print("The lion roars.")
    }
}

let corgi = Corgi(legs: 4)
corgi.speak()
corgi.legsPrint()

let poodle = Poodle(legs: 4)
poodle.speak()
poodle.legsPrint()

let persian = Persian(legs: 4, isTame: true)
persian.speak()
persian.legsPrint()
persian.tame()

let lion = Lion(legs: 4, isTame: false)
lion.speak()
lion.legsPrint()
lion.tame()
