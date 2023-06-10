import UIKit

//Error Handling
/*
 Swift provides support for throwing, catching, propogating and manipulating recoverable errors at runtime.
 Remember that optionals are used to represent the absence of a value, but when an opperation fails it is often useful to understand the cause of the failure so our code can respond accordingly
 */

//Swift provides us the Error Protocol to handle erros using enums

enum ReadFileError: Error {
case permissions
case badJson(json:String)
case fileNotFound(name:String)
}

class ReadFile {
    var fileName: String
    init(fileName:String) {
        self.fileName = fileName
        print("initializer")
    }
    //if I want to propegate the error using the func I need to add the throws keyword
    func readfile() throws {
        guard fileName.count > 1 else {
            throw ReadFileError.fileNotFound(name: fileName)
        }
    }
}
// test it
let readFile = ReadFile(fileName: "a")
do {
    try readFile.readfile()
} catch ReadFileError.fileNotFound(let name) {
    print("Error with file \(name).")
}
