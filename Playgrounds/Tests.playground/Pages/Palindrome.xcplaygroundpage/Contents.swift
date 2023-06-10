let testSubject1 = "formaxamfor"
//output: axa

let testSubject2 = "January"
//output: "" (empty string)

func minPalindrome(inputString: String) -> String {
    var result = [String]()
    
    for i in 0..<inputString.count {
        for j in i..<inputString.count {
            let temp = Array(inputString)[j..<inputString.count]
            let newInputString = String(temp)
            var newWord = ""
            for char in newInputString {
                newWord.append(char)
                if newWord.count < 3 {
                    continue
                }
                let newWordReversed = String(newWord.reversed())
                if String(newWord) == newWordReversed {
                    result.append(String(newWord))
                }
            }
        }
    }
    return result.min() ?? ""
}

print("testSubject1: \(minPalindrome(inputString: testSubject1))")

print("testSubject2: \(minPalindrome(inputString: testSubject2))")
