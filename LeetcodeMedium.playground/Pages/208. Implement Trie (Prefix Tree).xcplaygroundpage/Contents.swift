class Trie {

    class Node {
        var children = [Character: Node]()
        var isEnd = false
    }
    
    var root = Node()
    
    func insert(_ word: String) {
        var node = root
        for ch in word {
            node.children[ch] = node.children[ch] ?? Node()
            node = node.children[ch]!
        }
        node.isEnd = true
    }
    
    // Returns final node in word if word is stored, else returns root
    func lookup(_ word: String) -> Node {
        var node = root
        for ch in word {
            guard let child = node.children[ch] else { return root }
            node = child
        }
        return node
    }
    
    func search(_ word: String) -> Bool {
        lookup(word).isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        lookup(prefix) !== root
    }
}
