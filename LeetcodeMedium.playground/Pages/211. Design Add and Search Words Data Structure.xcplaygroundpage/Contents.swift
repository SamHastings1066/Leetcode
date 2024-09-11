
// My first approach
//class WordDictionary {
//    
//    class Node {
//        var children = [Character: Node]()
//        var isEnd = false
//    }
//    
//    var root = Node()
//    
//    func addWord(_ word: String) {
//        var node = root
//        for ch in word {
//            node.children[ch] = node.children[ch] ?? Node()
//            node = node.children[ch]!
//        }
//        node.isEnd = true
//    }
//    
//    func search(_ word: String) -> Bool {
//        lookup(word, root)
//    }
//    
//    func lookup(_ word: String, _ start: Node?) -> Bool {
//        guard let start else { return false }
//        var word = word
//        if word.count == 1 {
//            if word == "." && !start.children.values.allSatisfy({ !$0.isEnd }) {
//                return true
//            } else if start.children[word.first!] != nil && start.children[word.first!]!.isEnd {
//                return true
//            } else {
//                return false
//            }
//        }
//        let ch = word.removeFirst()
//        if ch == "." {
//            return !start.children.values.allSatisfy {
//                !lookup(word, $0)
//            }
//        } else {
//            return lookup(word, start.children[ch])
//        }
//    }
//}

// Second
class Trie {
    var isEnd = false
    var dict = [Character : Trie]()
}

class WordDictionary {
    let root = Trie()
    
    func addWord(_ word: String) {
        var node = root
        for char in word {
            if node.dict[char] == nil { node.dict[char] = Trie() }
            node = node.dict[char]!
        }
        node.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        return dfs(word, root)
    }
    
    func dfs( _ word: String, _ node: Trie) -> Bool {
        if word.count == 0 { return node.isEnd }
        var word = word
        let char = word.removeFirst()
        if char != "." {
            return node.dict[char] != nil && dfs( word, node.dict[char]!)
        } else {
            for nd in node.dict.values {
                if dfs( word, nd) {
                    return true
                }
            }
        }
        
        return false
    }
}

let wordDictionary = WordDictionary()
wordDictionary.addWord("bad")
wordDictionary.addWord("dad")
wordDictionary.addWord("mad")
wordDictionary.search("pad") // return False
wordDictionary.search("bad") // return True
wordDictionary.search(".ad") // return True
wordDictionary.search("b..") // return True

