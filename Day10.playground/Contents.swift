import Cocoa

//createing structs//
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()


struct Car {
    let year: Int
    let make: String
    let model: String
    
    func printCar() {
        print("\(year) \(make) \(model)")
    }
}

let mustang = Car(year: 2014, make: "Ford", model: "Mustang")
let camaro = Car(year: 2022, make: "Chevrolet", model: "Camaro")

print(mustang.make)
print(camaro.year)

mustang.printCar()
camaro.printCar()

//values that can change//
struct Employee {
    let name: String
    var vacationRemaining = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
//using default value//
var kane = Employee(name: "Lana Kane")
print(archer.vacationRemaining)


struct Driver {
    let name: String
    let vehicle: String
    var horsepower: Int
    
    mutating func allowRacing(minHP: Int, maxHP: Int) {
        if horsepower >= minHP && horsepower <= maxHP{
            print("You qualify to enter the race.")
        } else if horsepower > maxHP {
            horsepower -= maxHP
            print("You do NOT qualify.")
            print("You are overpowered by: \(horsepower) hp.")
        } else {
            horsepower -= minHP
            horsepower = abs(horsepower)
            print("You do NOT qualify.")
            print("You are underpowered by: \(horsepower) hp.")
        }
    }
}

var manny = Driver(name: "Manny", vehicle: "Ford Mustang", horsepower: 300)
manny.allowRacing(minHP: 400, maxHP: 500)
print(manny.name,":", manny.vehicle)

//computed property//
struct Employee2 {
    let name2: String
    var vacationAllocated2 = 14
    var vacationTaken2 = 0

    var vacationRemaining2: Int {
        get {
            vacationAllocated2 - vacationTaken2
        }
        
        set {
            vacationAllocated2 = vacationTaken2 + newValue
        }
    }
}

var archer2 = Employee2(name2: "Sterling Archer", vacationAllocated2: 14)
archer2.vacationTaken2 += 4
archer2.vacationRemaining2 = 5
print(archer2.vacationAllocated2)

struct Car1 {
    let make: String
    var basehp = 400.0
    var tunehp = 0.0
    
    var hpDyno: Double {
        get {
            basehp + tunehp
        }
        
        set {
            basehp -= (tunehp * newValue)
        }
    }
}

var civic = Car1(make: "Honda", basehp: 580.0)
civic.tunehp += 100
print(civic.hpDyno)
//hp loss to wheels//
civic.hpDyno = 0.15
print(civic.hpDyno)


//property observers//
//sample//
struct Game0 {
    var score0 = 0
}

var game0 = Game0()
game0.score0 += 10
print("Score is now \(game0.score0)")
game0.score0 -= 3
print("Score is now \(game0.score0)")
game0.score0 += 1
print("Score is now \(game0.score0)")

//using observer//
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


struct Transmission {
    var gear = 0 {
        didSet {
            print("You are now in gear \(gear)")
        }
    }
}

var manual = Transmission()
manual.gear += 1
manual.gear += 3
manual.gear -= 2
manual.gear += 3


struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish A")


struct Garage {
    var fleet = [String]() {
        willSet {
            print("Current cars in the garage: \(newValue)")
        }
        didSet {
            print("There are now \(fleet.count) cars in your garage")
        }
    }
}

var garage = Garage()
garage.fleet.append("Camaro ZL1")
garage.fleet.append("Mclaren P1")
garage.fleet.append("Cadillac Escalade V")


//custom initializers//
//swift automatically creates initializers//
struct Player1 {
    let name1: String
    let number1: Int
}

let player1 = Player1(name1: "Megan R", number1: 15)

//creating you own initializer//
struct Player {
    let name: String
    let number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}
//customizing initializer//
struct Player2 {
    let name2: String
    let number2: Int
    
    init(name2: String) {
        self.name2 = name2
        number2 = Int.random(in: 1...99)
    }
}

let player2 = Player2(name2: "Megan R")
print(player2.number2)


struct Parts {
    let year: Int
    let make: String
    let model: String
    
    init(make: String, model: String) {
        year = Int .random(in: 1999...2004)
        self.make = make
        self.model = model
        
    }
}

let parts = Parts(make: "Ford", model: "Mustang")
print(parts.year)
