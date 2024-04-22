class Solution {
    func reverse(_ x: Int) -> Int {
        
        var x = x
        var ans: Int = 0

        while x != 0 {
            let pop = x % 10
            
            if ans > Int32.max / 10 || (ans == Int32.max / 10 && pop > 7) {
                return 0
            }
            if ans < Int32.min / 10 || (ans == Int32.min / 10 && pop < -8) {
                return 0
            }
            
            
            x /= 10
            ans = 10 * ans + pop
        }
        return ans
    }
}



print(Solution().reverse(1534236469))
