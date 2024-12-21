/*
 My first ans - time: O(n), space: O(1)
 Observe that for any group 't' of consecutive chars, the length of compressed 't' is less than or equal to the length of t:
    t = a, t' = a
    t = bbb, t' = b3
    t = aaaaaaaaaa, t' = a10
 Therefore process chars from left to right.
 Use a pointer to point to the position in chars that we are writing to.
 Keep track of the "last" seen char, set this initially to the first char in chars
 Keep track of the lastCount - the count of the "last" char so far, set this initially to 1
 Iterate through chars
    if the current char = last, increment lastCoun by 1
    else
        set chars[focusIdx] to the last, then add in the count of the last char incrementing focusIndex appropriately

 At the end set chars[focusIdx] to the last, then add in the count of the last char incrementing focusIndex appropriately
 then delete all chars remaining between focusIndex and the end of the chars array
 return length of chars array
 */



//class Solution {
//    func compress(_ chars: inout [Character]) -> Int {
//        guard chars.count > 1 else { return chars.count }
//        var last = chars[0]
//        var lastCount = 1
//        var focusIdx = 0
//        for i in 1..<chars.count {
//            let curr = chars[i]
//            if curr != last {
//                chars[focusIdx] = last
//                focusIdx += 1
//                if lastCount != 1 {
//                    let countChars = Array(String(lastCount))
//                    for char in countChars {
//                        chars[focusIdx] = char
//                        focusIdx += 1
//                    }
//                }
//                lastCount = 1
//                last = curr
//            } else {
//                lastCount += 1
//            }
//        }
//        chars[focusIdx] = last
//        focusIdx += 1
//        if lastCount != 1 {
//            let countChars = Array(String(lastCount))
//            for char in countChars {
//                chars[focusIdx] = char
//                focusIdx += 1
//            }
//        }
//        for _ in focusIdx..<chars.count {
//            chars.removeLast()
//        }
//        return chars.count
//    }
//}


/*
 Second answer, same intuition and time and space efficiency, just a more intuitive implementation.
 Also does not delete the unused charatcers at the end of the chars array since this is not required ny the question description.
 */

class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        guard chars.count > 1 else { return chars.count }
        var readPointer = 0
        var writePointer = 0
        while readPointer < chars.count {
            let currentChar = chars[readPointer]
            var groupLength = 1
            while readPointer + groupLength < chars.count && chars[readPointer] == chars[readPointer + groupLength] {
                groupLength += 1
            }
            chars[writePointer] = currentChar
            writePointer += 1
            if groupLength != 1 {
                let lengthInChars = Array(String(groupLength))
                for char in lengthInChars {
                    chars[writePointer] = char
                    writePointer += 1
                }
            }
            readPointer = readPointer + groupLength
        }
        return writePointer
    }
}
