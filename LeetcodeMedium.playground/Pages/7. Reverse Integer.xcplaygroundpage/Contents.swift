class Solution {
    func reverse(_ x: Int) -> Int {
        
        var x = x
        var ans: Int = 0

        while x != 0 {
            let pop = x % 10
            
            if ans > Int.max || (ans == Int.max && pop > 7) {
                return 0
            }
            if ans < Int.min || (ans == Int.min && pop < -8) {
                return 0
            }
            
            
            x /= 10
            ans = 10 * ans + pop
        }
        return ans
    }
}



print(Solution().reverse(-120))
