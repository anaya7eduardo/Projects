let arrOne = [75, 325, 800, 375, 575, 300, 25, 925, 875]
//arrOutput = [ 5, 25 ]

let arrTwo = [9, 11, 13, 15, 25]
//arrOutput = []

func identifyFactors(userInput: [Int]) -> [Int] {
    let max = userInput.max() ?? 2
    var arrOutput = [Int]()
    for i in 2..<max {
        let counter = userInput.filter { $0 % i == 0 }.count
        if counter == userInput.count {
            arrOutput.append(i)
        }
    }
    return arrOutput
}

print("arrOne: \(identifyFactors(userInput: arrOne))")

print("arrTwo: \(identifyFactors(userInput: arrTwo))")
