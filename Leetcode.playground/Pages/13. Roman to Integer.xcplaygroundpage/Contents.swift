// My solution
//class Solution {
//    let romanMap = [
//        "I": 1,
//        "V": 5,
//        "X": 10,
//        "L": 50,
//        "C": 100,
//        "D": 500,
//        "M": 1000
//    ]
//    func romanToInt(_ s: String) -> Int {
//
//        var inputString = s
//       
//        var result = 0
//        
//        while inputString.count > 1 {
//            let secondLetterIndex = inputString.index(after: s.startIndex)
//            let secondLetter = inputString[secondLetterIndex]
//            if romanMap[String(inputString[inputString.startIndex])]! >= romanMap[(String(secondLetter))]! {
//                let removedCharacter = inputString.remove(at: inputString.startIndex)
//                result += romanMap[String(removedCharacter)]!
//            } else {
//                let firstRemovedCharacter = inputString.remove(at: inputString.startIndex)
//                let secondRemovedCharacter = inputString.remove(at: inputString.startIndex)
//                result += romanMap[String(secondRemovedCharacter)]! - romanMap[String(firstRemovedCharacter)]!
//            }
//        }
//        if inputString.count == 1 {
//            result += romanMap[inputString]!
//        }
//        return result
//    }
//}
//
//let solution = Solution()
//print(solution.romanToInt("VX"))

// Model solution

class Solution2 {
    let romanMap: [Character:Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    func romanToInt(_ s: String) -> Int {
        // Basic idea with this algorithm is to cycle through the string looking at 2 consecvutive letters at a time. For each letter "prev" in the string, its corresponding int value is either added to or subtracted from the total "out". The decision to add or subtract prev is based upon whether its int value is less than the int value of the next letter in the string, "val", in which case add, otherwise subtract. prev must start at zero, and always add the last letter at the end of the loop.
        var prev = 0, out = 0
        for i in s {
            let val = romanMap[i] ?? 0
            out += prev >= val ? prev : -prev
            prev = val
        }
        out += prev
        return(out)
    }
}

let solution2 = Solution2()
print(solution2.romanToInt("VX"))


