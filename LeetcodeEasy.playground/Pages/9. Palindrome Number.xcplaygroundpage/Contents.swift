class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0 ) { return false }
        
        var reversed = 0
        var x = x
        while x > reversed {
            reversed = reversed * 10 + x % 10
            x /= 10
        }
        
        return x == reversed || x == reversed / 10
    }
}
