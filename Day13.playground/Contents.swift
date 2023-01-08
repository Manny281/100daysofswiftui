import Cocoa

//creating and using protocols//


//bare requirements
protocol Vehicle {
    //readable - get
    var name: String { get }
    //readable - get, writeable - set
    var currentPassengers: Int { get set }
    func estimatTime(for distance: Int) -> Int
    func travel(distance: Int)
    //no function bodies allowed
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func estimatTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    //can add more, above are required
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimatTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

/*
// works the same as below
func commute(distance: Int, using vehicle: Car) {
    if vehicle.estimatTime(for: distance) > 100 {
        print("Thats too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}
*/

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimatTime(for: distance) > 100 {
        print("Thats too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicle: [Vehicle], distance: Int) {
    for vehicle in vehicle {
        let estimate = vehicle.estimatTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}
let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)


//opaque return types//
protocol View { }


//some equatable allows change later
//to not have to change return types every time you change the code
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())


//creating and using extnesions//

var quote = "  The truth is rarely pure and never simple   "
//remove whitepace and new lines on either side
let trimmedLong = quote.trimmingCharacters(in: .whitespacesAndNewlines)

//to make it shorter
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
/*
//could have used func but will be global
 func trim(_string: String) -> Sring {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
 }

let trimmed2 = trim(quote)
*/
let trimmedUsingExtension = quote.trimmed()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)
//with custom initialzer
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178)

//custom initializer withour disabling default initializer
struct Book2 {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book2 {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr2 = Book2(title: "Lord of the Rings 2", pageCount: 1283, readingHours: 30)


//creating and using protocol extensions//
//easier to read
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}


protocol Person {
    var name: String { get }
    func sayHello()
}
//adding default implementation
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

//checkpoint 8//
//my solution
protocol Building {
    var rooms : Int { get }
    var cost : Int  { get }
    var agent: String { get }
    func saleSummary()
}

struct House: Building {
    let rooms = 4
    let cost = 500_000
    let agent = "Residential Seller"
    
    func saleSummary() {
        print("House: Price: \(cost), Rooms: \(rooms), Realtor: \(agent)")
    }
}

struct Office: Building {
    let rooms = 2
    let cost = 700_000
    let agent = "Commercial Seller"
    
    func saleSummary() {
        print("Office: Price: \(cost), Rooms: \(rooms), Realtor: \(agent)")
    }
}

var house = House()
house.saleSummary()

var office = Office()
office.saleSummary()

