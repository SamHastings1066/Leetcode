// My answer
//class Solution {
//    func summaryRanges(_ nums: [Int]) -> [String] {
//        guard !nums.isEmpty else {return []}
//        var lastSeen = nums[0]
//        var startRange = nums[0]
//        var ans = [String]()
//        for num in nums[1..<nums.count] {
//            if num == lastSeen + 1 {
//                lastSeen = num
//            } else {
//                if lastSeen == startRange {
//                    ans.append(String(lastSeen))
//                } else {
//                    ans.append(String(startRange) + "->" + String(lastSeen))
//                }
//                lastSeen = num
//                startRange = num
//            }
//        }
//        if lastSeen == startRange {
//            ans.append(String(lastSeen))
//        } else {
//            ans.append(String(startRange) + "->" + String(lastSeen))
//        }
//        return ans
//        
//    }
//}

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var ranges = [String]()
        var i = 0
        
        while i < nums.count {
            var start = nums[i]
            
            while i + 1 < nums.count && nums [i+1] == nums[i] + 1 {
                i+=1
            }
                
            if start != nums[i] {
                ranges.append(String(start) + "->" + String(nums[i]))
            } else {
                ranges.append(String(start))
            }
            i += 1
        }
        
        return ranges
        
    }
}

var nums = [0,2,3,4,6,8,9]

print(Solution().summaryRanges(nums))
