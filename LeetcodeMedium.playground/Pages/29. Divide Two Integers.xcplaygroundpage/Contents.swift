// First attempt
//class Solution {
//    func divide(_ dividend: Int, _ divisor: Int) -> Int {
//        print(dividend, Int(Int32.min))
//        if dividend < Int(Int32.min) + 1 && divisor == -1 {
//            return -Int(Int32.min) - 1
//        }
//        if dividend > Int(Int32.max) && divisor == 1 {
//            return -Int(Int32.max)
//        }
//        
//        var flip = 1
//        
//        if (dividend<0) != (divisor<0) {
//            flip = -1
//        }
//        
//        var dividend = abs(dividend)
//        var divisor = abs(divisor)
//        
//        if dividend < divisor { return 0 }
//        
//        var currentVal = divisor
//        var quotient = 0
//        while currentVal <= dividend {
//            currentVal += divisor
//            quotient += 1
//        }
//        
//        return quotient * flip
//        
//    }
//}

// brute force
//class Solution {
//    func divide(_ dividend: Int, _ divisor: Int) -> Int {
//        var maxInt = 2147483647
//        var minInt = -2147483648
//        
//        if divisor == -1 && dividend == minInt {return maxInt}
//        
//        var numNegs = 2
//        var divisor = divisor
//        var dividend = dividend
//        if divisor > 0 {
//            numNegs -= 1
//            divisor = -divisor
//        }
//        if dividend > 0 {
//            numNegs -= 1
//            dividend = -dividend
//        }
//        
//        var quotient = 0
//        while dividend - divisor <= 0 {
//            quotient -= 1
//            dividend -= divisor
//        }
//        
//        return numNegs == 1 ? quotient : -quotient
//        
//    }
//}

// Exponential search
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        var maxInt = 2147483647
        var minInt = -2147483648
        var halfMinInt = -1073741824
        
        if divisor == -1 && dividend == minInt {return maxInt}
        
        var divisor = divisor
        var dividend = dividend
        
        var numNegs = 2
        
        if divisor > 0 {
            numNegs -= 1
            divisor = -divisor
        }
        if dividend > 0 {
            numNegs -= 1
            dividend = -dividend
        }
        
        var quotient = 0
        
        while dividend <= divisor {
            var powerOfTwo = 1 // N.B. +ve
            var value = divisor // must be -ve
            
            while halfMinInt <= value && dividend <= value + value {
                powerOfTwo += powerOfTwo // must be +ve since initialised as +1
                value += value
            }
            dividend -= value
            quotient += powerOfTwo
        }
        
        return numNegs == 1 ? -quotient : quotient
        
        
    }
}

let dividend = -2147483648 // ans 2147483647
let divisor = -1


print(Solution().divide(93706, 157))
