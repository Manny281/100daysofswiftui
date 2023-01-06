import Cocoa

//access control using private(set)//
struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

//  private - Don't let anything outside the struct use this.
//  fileprivate - Don't let anything outside the curretn file use this.
//  public - Let anyone, anywhere use this.


struct entryFee {
    private(set) var money = 0
    
    mutating func atm(withdraw: Int) {
        money += withdraw
    }
    
    mutating func Fee(feeAmount: Int) -> Bool {
        if money >= feeAmount {
            money -= feeAmount
            return true
        } else {
            return false
        }
    }
}

var entry = entryFee()
entry.atm(withdraw: 300)
let allow = entry.Fee(feeAmount: 200)


if allow {
    print("You have enough to enter.")
} else {
    print("You do not have enough.")
}


//static properties and methods//
struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

//  self - The current value of a struct
//  Self - The curretn type of a struct


struct Garage {
    static var carCount = 0
    static var carList = [String]()
    
    static func new(car: String) {
        print("You now have a \(car) in your garage.")
        carCount += 1
        carList.append(car)
    }
}

Garage.new(car: "Shelby GT500")
print(Garage.carCount)
Garage.new(car: "Chevy Camaro zl1")
print(Garage.carCount, Garage.carList)


struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

AppData.version

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "h4irf0rce0ne")
}

Employee.example

struct Vehicle {
    static let sportsCar = "911"
    static let suv = "Escalade V"
    static let pickup = "Shelby f150"
}

Vehicle.pickup


//checkpoint 6//
//My Solution
struct Car {
    var model: String
    var seats: Int
    var maxGears: Int
    
    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
        maxGears = 10
    }
    
    var shift = 0 {
        didSet {
            if shift >= 1 && shift <= maxGears {
                print("you are in gear \(shift)")
            } else if shift < 1  {
                print("Try shifting up")
            } else {
                print("You only have \(maxGears) gears")
            }
            print("Your \(model) has \(seats) seats.")
        }
    }
}


var car = Car(model: "Civic", seats: 4)
car.shift += 2


//course solution
struct MyCar {
    let model: String
    let seats: Int
    let maximimumGears: Int
    private(set) var gear = 1
    
    init(model: String, seats: Int, maximumGears: Int) {
        self.model = model
        self.seats = seats
        self.maximimumGears = maximumGears
    }
    
    mutating func changeGear(difference: Int) {
        gear = gear + difference
        
        if gear > 1 {
            gear = 1
        } else if gear > maximimumGears {
            gear = maximimumGears
        }
    }
}

var mycar = MyCar(model: "BMW X3", seats: 5, maximumGears: 8)
mycar.changeGear(difference: 2)
print(mycar.gear)
