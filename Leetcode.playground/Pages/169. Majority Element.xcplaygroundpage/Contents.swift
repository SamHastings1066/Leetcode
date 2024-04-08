
// My first solution
//class Solution {
//    func majorityElement(_ nums: [Int]) -> Int {
//        let threshold = nums.count / 2
//        var numStore = [Int:Int]()
//        for num in nums {
//            numStore[num, default: 0] += 1
//            if numStore[num]! > threshold {
//                return num
//            }
//        }
//        return -1
//    }
//}


class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        
        return -1
    }
}

let nums = [2,2,1,1,1,2,2]

print(Solution().majorityElement(nums))
