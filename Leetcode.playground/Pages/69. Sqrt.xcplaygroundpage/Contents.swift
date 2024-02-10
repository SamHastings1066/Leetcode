// TODO: Understand exactly why it is pivot - 1 and pivot +1. draw it out on paper using x = 6 and x = 10 with just right = pivot and left = pivot, as well as the way you ahve it now.

class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else {return x}
       
        var left = 2
        var right = x/2
        
        while left <= right {
            let pivot = (right + left) / 2
            let num = pivot*pivot
            if num > x {
                right = pivot - 1
            } else if num < x {
                left = pivot + 1
            } else {
                return pivot
            }
        }
        return right
        
    }
}

let solution = Solution()
print(solution.mySqrt(2))
