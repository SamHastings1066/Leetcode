class Solution {
    func myAtoi(_ s: String) -> Int {
        var s = Array(s)
        var index = 0
        var n = s.count
        var sign = 1
        var result = 0
        
        // Ignore leading whitespace
        while index < n && s[index] == " " {
            index += 1
        }
        
        // Handle sign if there is one
        if index < n && (s[index] == "+" || s[index] == "-") {
            if s[index] == "-" { sign = -1 }
            index += 1
        }
        
        // Append numeric digits to result
        while index < n && s[index].isNumber {
            if result > Int32.max / 10 || (result == Int32.max / 10 && Int(String(s[index]))! > Int32.max % 10) {
                if sign == -1 {
                    return Int(Int32.min)
                } else {
                    return Int(Int32.max)
                }
            }
            result = result * 10 + Int(String(s[index]))!
            index += 1
        }
        
        return result * sign
    }
}

print(Solution().myAtoi("-0042 words"))


