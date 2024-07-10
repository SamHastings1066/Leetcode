// First solution
//class Solution {
//    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
//        let magazine = Array(magazine)
//        let ransomNote = Array(ransomNote)
//        // Iterate over all letters in magazine, creating a count of the letters in a hashmap magazineLetters
//        var magazineLetters: [Character:Int] = [:]
//        for char in magazine {
//            magazineLetters[char, default: 0] += 1
//        }
//        // Iterate over all the letter in ransomNote, subtract 1 from the count of that letter in magazineLetters (default count 0). if the count of any letter in magazineLetters falls below 0, return false.
//        for char in ransomNote {
//            magazineLetters[char, default: 0] -= 1
//            if magazineLetters[char]! < 0 { return false }
//        }
//        // return true.
//        return true
//    }
//}

//Index removeal approach
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magazine = magazine
        for char in ransomNote {
            if let index = magazine.firstIndex(where: {
                $0 == char
            }) {
                magazine.remove(at: index)
            } else {
                return false
            }
        }
        return true
    }
}

let ransomeNote = "aa"
let magazine = "aab"
print(Solution().canConstruct(ransomeNote, magazine))
