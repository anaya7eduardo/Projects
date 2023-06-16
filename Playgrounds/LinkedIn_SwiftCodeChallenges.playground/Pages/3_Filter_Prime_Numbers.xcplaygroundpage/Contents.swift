import Foundation

// https://www.linkedin.com/learning/swift-code-challenges/filter-prime-numbers

// Prime Number: Divisible only by one and itself
var primeNumbersArray = [Int]()
var primesArray = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

func isPrime(_ n: Int) -> Bool {
    var aux = 0
    if n > 1 {
        for index in 1...n {
            if n%index==0 {
                aux+=1
            }
        }
    } else {
        return false
    }
    return aux == 2 ? true : false
}

//let test = 10101
//isPrime(test) ? print("\(test) is prime number") : print("\(test) is not prime number")

for number in 1...100 {
    if isPrime(number) && number > 1 {
        primeNumbersArray.append(number)
    }
}

print(primeNumbersArray)
//print(primeNumbersArray==primesArray)

func primesInArray(_ arr: [Int]) -> [Int] {
    var primesNumbersArray = [Int]()
    for element in arr {
        if isPrime(element) {
            primesNumbersArray.append(element)
        }
    }
    return primesNumbersArray
}

var testArray1 = [Int]()
var testArray2 = [Int]()

for n in 1...100 {
    testArray1.append(n)
    if n%2==0 && n>2 {
        testArray2.append(n)
    }
}
//print(testArray1)
//print(testArray2)
print(primesInArray(testArray1))
print(primesInArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]))
print(primesInArray([4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66]))


// Other Solutions:
func findPrimes(_ numbers: [UInt]) -> [UInt] {
    var primes = [UInt]()
    
    for number in numbers {
        if number <= 1 {
            continue
        }
        
        var isPrime = true
        
        for i in 2..<number {
            if number % i == 0 {
                isPrime = false
                break
            }
        }
        if isPrime {
            primes.append(number)
        }
    }
    return primes
}

print(findPrimes([0, 1, 2, 5, 7, 9, 57, 59]))
print(findPrimes([1, 4, 6, 8]))
