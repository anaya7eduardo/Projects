import UIKit
 /*
  Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
  You may assume that each input would have exactly one solution, and you may not use the same element twice.
  You can return the answer in any order.
  
  Example 1:
  Input: nums = [2,7,11,15], target = 9
  Output: [0,1]
  Output: Because nums[0] + nums[1] = 9, we return [0, 1].
  
  Combs :
  2 + 7 , 2 + 11 , 2 + 15
  7 + 11 , 7 + 15
  11 + 15
  
  Example 2:
  Input: nums = [3,2,4], target = 6
  Output: [1,2]
  
  Example 3:
  Input: nums = [3,3], target = 6
  Output: [0,1]
  */

let target = 6
let nums = [3,2,4]
var nums2 = [0,0]
var count = 0

for (index1, x) in nums.enumerated() {
    for (index2, y) in nums.enumerated() {
        if index1 != index2 && count <= 0{
            if x+y == target {
                print(nums)
                //print("[\(index1),\(index2)]")
                nums2 = [index1,index2]
                count += 1
            }
        }
    }
}
print(nums2)