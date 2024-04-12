

class Solution {
    
    //My solution
//    func plusOne(_ digits: [Int]) -> [Int] {
//        var result = digits
//        for i in (0..<result.count).reversed() {
//            if result[i] + 1 < 10 {
//                result[i] += 1
//                return result
//            } else if i == 0 {
//                result[i] = 0
//                result.insert(1, at: 0)
//            }
//            else {
//                result[i] = 0
//            }
//        }
//        return result
//    }
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        
        for i in (0..<digits.count).reversed() {
            guard digits[i] == 9 else {
                digits[i] += 1
                return digits
            }
            digits[i] = 0
        }
        digits.insert(1, at: 0)
        return digits
    }
}



let digits = [9]
let solution = Solution()
print(solution.plusOne(digits))



