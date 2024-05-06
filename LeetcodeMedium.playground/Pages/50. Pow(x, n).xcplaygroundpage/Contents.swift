// first approach
//class Solution {
//    func myPow(_ x: Double, _ n: Int) -> Double {
//        var n = n
//        var negative = false
//        if n < 0 {
//            negative = true
//            n = -n
//        }
//        
//        
//        var ans = 1.0
//        var multiplier = x
//        var powerOfTwo = 1
//        var currentPower = 0
//        
//        while currentPower < n {
//            if currentPower + powerOfTwo * 2 < n {
//                multiplier *= multiplier
//                powerOfTwo *= 2
//            } else {
//                ans *= multiplier
//                currentPower += powerOfTwo
//                powerOfTwo = 1
//                multiplier = x
//            }
//        }
//        
//        if negative {
//            return 1/ans
//        } else {
//            return ans
//        }
//    }
//}

//// Recursive
//class Solution {
//    func myPow(_ x: Double, _ n: Int) -> Double {
//        if n == 0 {
//            return 1
//        }
//        else if n < 0 {return 1/myPow(x, -n)}
//        else if n % 2 == 0 {return myPow(x*x, n/2)}
//        else { return x * myPow(x*x, (n-1)/2)}
//    }
//}

// Interative 2
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {return 1}
        var x=x
        var n=n
        if n < 0 {
            x = 1.0/x
            n = -n
        }
        var ans = 1.0
        while n > 0 {
            if n % 2 == 1 {
                ans *= x
                n-=1
            }
            x*=x
            n/=2
        }
        return ans
    }
}


print(Solution().myPow(2,5))
