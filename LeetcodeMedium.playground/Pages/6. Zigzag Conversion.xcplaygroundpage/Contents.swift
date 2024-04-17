class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows < 2 || numRows >= s.count { return s }
        var s = Array(s)
        var arrays = [[Character]](repeating: [Character](), count: numRows)
        var currRow = 0
        var step = 1
        for char in s {
            arrays[currRow].append(char)
            currRow += step
            if currRow == 0 || currRow == numRows - 1 {
                step *= -1
            }
        }
        var result = [Character]()
        for arr in arrays {
            result.append(contentsOf: arr)
        }
        return String(result)
    }
}

print(Solution().convert("PAYPALISHIRING", 3))
