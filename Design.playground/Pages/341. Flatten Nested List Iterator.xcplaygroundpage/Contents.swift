class NestedInteger: CustomStringConvertible {
    var description: String {
        switch content {
        case .integer(let value):
            return "\(value)"
        case .list(let nestedList):
            return "[\(nestedList.map(\.description).joined(separator: ","))]"
        }
    }

    private enum Content {
        case integer(Int)
        case list([NestedInteger])
    }

    private var content: Content

    // Initialize with a single integer
    init(_ value: Int) {
        self.content = .integer(value)
    }

    // Initialize with a list of NestedInteger
    init(_ list: [NestedInteger]) {
        self.content = .list(list)
    }

    // Return true if this NestedInteger holds a single integer
    public func isInteger() -> Bool {
        if case .integer = content {
            return true
        }
        return false
    }

    // Return the single integer this NestedInteger holds, if it holds a single integer
    public func getInteger() -> Int {
        if case .integer(let value) = content {
            return value
        }
        fatalError("Called getInteger on a NestedInteger holding a list.")
    }

    // Set this NestedInteger to hold a single integer
    public func setInteger(_ value: Int) {
        content = .integer(value)
    }

    // Set this NestedInteger to hold a nested list and adds a nested integer to it
    public func add(_ elem: NestedInteger) {
        if case .list(var nestedList) = content {
            nestedList.append(elem)
            content = .list(nestedList)
        } else {
            content = .list([elem])
        }
    }

    // Return the nested list that this NestedInteger holds, if it holds a nested list
    public func getList() -> [NestedInteger] {
        if case .list(let nestedList) = content {
            return nestedList
        }
        fatalError("Called getList on a NestedInteger holding an integer.")
    }
}


class NestedIterator {
    
    var stack = [([NestedInteger], Int)]()
    
    init(_ nestedList: [NestedInteger]) {
        stack.append((nestedList,0))
    }
    
    func makeStackTopAnInteger() {
        while !stack.isEmpty {
            let currentList = stack.last!.0
            let currentPosition = stack.last!.1
            
            if currentList.count == currentPosition {
                stack.removeLast()
                continue
            }
            
            if currentList[currentPosition].isInteger() {
                break
            }
            
            let nextList = currentList[currentPosition].getList()
            stack[stack.count-1].1 += 1
            stack.append((nextList,0))
        }
    }
    
    func next() -> Int {
        if hasNext() {
            let currentList = stack.last!.0
            let currentPosition = stack.last!.1
            stack[stack.count-1].1 += 1
            return currentList[currentPosition].getInteger()
        } else {
            return -1
        }
    }
    
    func hasNext() -> Bool {
        makeStackTopAnInteger()
        return !stack.isEmpty
    }
}
