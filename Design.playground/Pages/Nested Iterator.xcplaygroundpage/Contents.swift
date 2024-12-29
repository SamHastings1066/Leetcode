//class NestedInteger: CustomStringConvertible {
//    var description: String {
//        var result = ""
//        if value != nil {
//            result =  String(value!)
//        } else {
//            result.append("[")
//            for nestedInteger in list! {
//                result.append("\(nestedInteger.description),")
//            }
//            result.removeLast()
//            result.append("]")
//        }
//        return result
//    }
//    
//    private var value: Int?
//    private var list: [NestedInteger]?
//    
//    init(_ value: Int) {
//        self.value = value
//        self.list = nil
//    }
//    
//    init(_ list: [NestedInteger]) {
//        self.value = nil
//        self.list = list
//    }
//    
//    // Return true if this NestedInteger holds a single integer, rather than a nested list.
//    public func isInteger() -> Bool {
//        return value != nil
//    }
//
//    // Return the single integer that this NestedInteger holds, if it holds a single integer
//    // The result is undefined if this NestedInteger holds a nested list
//    public func getInteger() -> Int? {
//        return value
//    }
//
//    // Set this NestedInteger to hold a single integer.
//    public func setInteger(value: Int) {
//        self.value = value
//        list = nil
//    }
//
//    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
//    public func add(elem: NestedInteger) {
//        if list == nil {
//            list = []
//        }
//        list?.append(elem)
//        value = nil
//    }
//
//    // Return the nested list that this NestedInteger holds, if it holds a nested list
//    // The result is undefined if this NestedInteger holds a single integer
//    public func getList() -> [NestedInteger]? {
//        return list
//    }
//}

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

// My first attempt
//class NestedIterator {
//    let nestedList: [NestedInteger]
//    var stack = [NestedInteger]()
//    
//    init(_ nestedList: [NestedInteger]) {
//        self.nestedList = nestedList
//        for i in nestedList.indices.reversed() {
//            stack.append(nestedList[i])
//        }
//    }
//    
//    func next() -> Int {
//        while hasNext() {
//            let poppedInteger = stack.removeLast()
//            if poppedInteger.isInteger() {
//                return poppedInteger.getInteger()
//            }
//            let list = poppedInteger.getList()
//            for i in list.indices.reversed() {
//                stack.append(list[i])
//            }
//        }
//        return -10000000
//        
//    }
//    
//    func hasNext() -> Bool {
//        while !stack.isEmpty {
//            let poppedInteger = stack.removeLast()
//            if poppedInteger.isInteger() {
//                stack.append(poppedInteger)
//                return true
//            }
//            let list = poppedInteger.getList()
//            for i in list.indices.reversed() {
//                stack.append(list[i])
//            }
//        }
//        return false
//    }
//}

//// O(n) constructor flattens list recursively:
//
//class NestedIterator {
//    
//    var flattenedList = [Int]()
//    var currentPos = -1
//    
//    init(_ nestedList: [NestedInteger]) {
//        func flattenList(_ nestedList: [NestedInteger]) {
//            for nestedInt in nestedList {
//                if nestedInt.isInteger() {
//                    flattenedList.append(nestedInt.getInteger())
//                } else {
//                    flattenList(nestedInt.getList())
//                }
//            }
//        }
//        flattenList(nestedList)
//    }
//    
//    func next() -> Int {
//        currentPos += 1
//        return flattenedList[currentPos]
//    }
//    
//    func hasNext() -> Bool {
//        return currentPos + 1 < flattenedList.count
//    }
//}

// O(n) constructor, use `makeStackTopAnInteger` function:
//class NestedIterator {
//
//    var stack = [NestedInteger]()
//    
//    init(_ nestedList: [NestedInteger]) {
//        stack.append(contentsOf: nestedList.reversed())
//    }
//    
//    func makeStackTopAnInteger() {
//        while !stack.isEmpty, !stack.last!.isInteger() {
//            stack.append(contentsOf: stack.removeLast().getList().reversed())
//        }
//    }
//    
//    func next() -> Int {
//        if hasNext() {
//            return stack.removeLast().getInteger()
//        } else {
//            return -1
//        }
//    }
//    
//    func hasNext() -> Bool {
//        makeStackTopAnInteger()
//        return stack.last?.isInteger() == nil ? false : true
//    }
//}

// O(1) constructor, stack stores tuple:
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

let nestedList: [NestedInteger] = //[NestedInteger([])]
[NestedInteger([NestedInteger([NestedInteger(0),NestedInteger(1)]),NestedInteger(2),NestedInteger([NestedInteger(3),NestedInteger(4)])])]



print(nestedList[0].getList())
let nestedIterator = NestedIterator(nestedList)
while nestedIterator.hasNext() {
    print(nestedIterator.next())
}
 print("done")

