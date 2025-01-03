// Time: O(M^2 * N); Space: O(M^2 * N) - where M is the length of a word and N is the number of words in the `wordList`.
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let L = beginWord.count

        var allComboDict = [String:[String]]()

        for word in wordList {
            for i in 0..<L {
                var arrayWord = Array(word)
                arrayWord[i] = "*"
                let intermediateWord = String(arrayWord)
                allComboDict[intermediateWord, default:[]].append(word)
            }
        }

        var queue = [(beginWord,1)]
        var seen = Set<String>()
        seen.insert(beginWord)
        
        while !queue.isEmpty {
            let levelCount = queue.count
            
            let (word, level) = queue.removeFirst()
            if word == endWord { return level }
            for i in 0..<L {
                var arrayWord = Array(word)
                arrayWord[i] = "*"
                let newWord = String(arrayWord)
                if let linkedWords = allComboDict[newWord] {
                    for nextWord in linkedWords {
                        if !seen.contains(nextWord) {
                            queue.append((nextWord, level + 1))
                            seen.insert(nextWord)
                        }
                    }
                }
            }
        }
        return 0
    }
}
