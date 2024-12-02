// Brute force solution
//class Solution {
//    func trap(_ height: [Int]) -> Int {
//        let size = height.count
//        guard size > 2 else { return 0 }
//        var ans = 0
//
//        for i in 1..<size - 1 {
//            var leftMax = 0
//            var rightMax = 0
//            
//            // Search the left part for max bar size
//            for j in 0...i {
//                leftMax = max(leftMax, height[j])
//            }
//            
//            // Search the right part for max bar size
//            for j in i..<size {
//                rightMax = max(rightMax, height[j])
//            }
//            
//            ans += min(leftMax, rightMax) - height[i]
//        }
//        
//        return ans
//    }
//}

// Dynamic programming

//class Solution {
//    func trap(_ height: [Int]) -> Int {
//        let size = height.count
//        guard size > 2 else { return 0 }
//        var leftMax = [height[0]]
//        var rightMax = [height[size - 1]]
//        for i in 0..<size-1 {
//            leftMax.append(max(leftMax[i], height[i+1]))
//        }
//        for i in (0..<size-1).reversed() {
//            rightMax.insert(max(rightMax[0], height[i]), at: 0)
//        }
//        var ans = 0
//        for i in 1..<size-1 {
//            ans += min(leftMax[i],rightMax[i]) - height[i]
//        }
//        return ans
//    }
//}


// Two pointers

class Solution {
    func trap(_ height: [Int]) -> Int {
        let size = height.count
        guard size > 2 else { return 0 }
        var ans = 0
        var leftMax = 0
        var rightMax = 0
        var l = 0
        var r = size - 1
        while l<r {
            if height[l] < height[r] {
                if height[l] > leftMax {
                    leftMax = height[l]
                } else {
                    ans += leftMax - height[l]
                }
                l += 1
            } else {
                if height[r] > rightMax {
                    rightMax = height[r]
                } else {
                    ans += rightMax - height[r]
                }
                r-=1
            }
        }
        return ans
    }
}


