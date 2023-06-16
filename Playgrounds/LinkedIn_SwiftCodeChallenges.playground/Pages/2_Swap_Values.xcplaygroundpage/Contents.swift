import Foundation

// https://www.linkedin.com/learning/swift-code-challenges/swap-values

func swap(_ x: Int, _ y: Int) {
    var i = y
    var j = x
    print("x: \(i), y: \(j)")
}

swap(10, 20)

// Using generics
/*
func swap<E>(_ left: inout E, _ right: inout E) {
    let tmp = left
    left = right
    right = tmp
}

var f = "foo"
var b = "bar"
swap(&f, &b)
print("f: \(f), b: \(b)")
 */

// Using generics (cleaner)
func swap<E:Equatable>(_ left: inout E, _ right: inout E) {
    guard left != right else {
        return
    }
    (left, right) = (right, left)
}

var f = "foo"
var b = "bar"
swap(&f, &b)
print("f: \(f), b: \(b)")
