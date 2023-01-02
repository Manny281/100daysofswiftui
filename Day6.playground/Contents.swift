import Cocoa

//loops//
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for name in platforms {
    print("Swift works great on \(name). test")
}

let faveCars = ["GT500", "Cobra", "Type-R", "R33"]

for car in faveCars {
    print("One of my favorite cars it the: \(car).")
}


//for loop//
for i in 1...12 {
    print("5 * \(i) is \(5 * i)")
}
print()

for i in 1...6 {
    print("This is number: \(i)")
}

//nested for loop//
for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("   \(j) x \(i) is \(j * i)")
    }
    
    print()
}
print()

for i in 1...3 {
    print("Game: \(i)")
    print()
    
    for j in 1...4 {
        print("number: \(j).")
    }
    
    print()
}



//ranges//
for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}
print()

for i in 1..<5 {
    print("Counting from 1 through 5: \(i)")
}
   

//replace loop variable//
var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)


var numbersArray = [1, 2, 3, 4, 5, 6]

for _ in numbersArray {
    print("number: \(numbersArray[0...2])")
}


var names = ["Sterling", "Cyril", "Lana", "Ray", "Paul"]

for _ in names {
    print("\(names) is a secret agent")
}

//test:got wrong//
var numbers = [1, 2, 3, 4, 5, 6]
for number in numbers {
    if number % 2 == 0 {
        print(number)
    }
}
print()


//while loop//
var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000)
let randomNum = Int.random(in: 1...10)

let amount = Double.random(in: 0...1)
let randomDecimal = Double.random(in: 0...5)

//create integer to store roll//
var roll = 0

//carry on looping until reach 20//
while roll != 20 {
    //roll a new dice and print what it was//
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
//prints after the loop ends
print("Critical hit!")


//skipping loop items with break and continue
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found pictures: \(filename)")
}

let folderFiles = ["music.mp3", "music.jpg", "music.png", "album.mp3", "album.png", "single.mp3"]

for musicFile in folderFiles {
    if musicFile.hasSuffix(".mp3") == false {
        continue
    }
    print("Found music: \(musicFile)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) { multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)

let scores = [1, 8, 4, 3, 0, 5, 2]
var count = 0

for score in scores {
    if score == 0 {
        break
    }
    
    count += 1
}

print("You had \(count) scores before you got 0.")


//checkppoint 3//

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
