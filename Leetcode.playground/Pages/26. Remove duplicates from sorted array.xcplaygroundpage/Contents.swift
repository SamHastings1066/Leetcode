//: [Previous](@previous)

// my solution
//class Solution {
//    func removeDuplicates(_ nums: inout [Int]) -> Int {
//        guard nums.count > 1 else {return 1}
//        var focusIndex = 0
//        
//        for checkIndex in 1...nums.count - 1 {
//            if nums[focusIndex] < nums[checkIndex] {
//                (nums[focusIndex + 1], nums[checkIndex]) = (nums[checkIndex], nums[focusIndex + 1])
//                focusIndex += 1
//            }
//            
//        }
//        return focusIndex + 1
//    }
//}

//Other solution
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        var focusIndex = 1
        
        for checkIndex in 1..<nums.count where nums[checkIndex] != nums[focusIndex - 1] {
            nums[focusIndex] = nums[checkIndex]
            focusIndex += 1
        }
        return focusIndex
    }
}


var nums = [0,0,1,1,1,2,2,3,3,4]
//var nums = [1]

let solution = Solution()

print(solution.removeDuplicates(&nums))
print(nums)
