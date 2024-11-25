// My first answer
//class Solution {
//    func trailingZeroes(_ n: Int) -> Int {
//        if n == 0 {return 0}
//        if n < 5 {return 0}
//        var ans = 0
//        var listOfFives = [Int]()
//        for i in 1...n/5 {
//            listOfFives.append(5*i)
//        }
//        for i in 0..<listOfFives.count {
//            while listOfFives[i] > 0 && listOfFives[i] % 5 == 0 {
//                ans += 1
//                listOfFives[i] /= 5
//            }
//        }
//        return ans
//    }
//}

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var ans = 0
        var powerOfFive = 5
        while n >= powerOfFive {
            ans += n / powerOfFive
            powerOfFive *= 5
        }
        return ans
    }
}

print(Solution().trailingZeroes(4000))
