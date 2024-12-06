
//class RandomizedSet {
//    
//    var elementIndices: [Int:Int]
//    var elements: [Int]
//    var count: Int { return elements.count }
//
//    init() {
//        elements = []
//        elementIndices = [:]
//    }
//    
//    func insert(_ val: Int) -> Bool {
//        if elementIndices[val] != nil {
//            return false
//        } else {
//            elementIndices[val]=count
//            elements.append(val)
//            return true
//        }
//    }
//    
//    func remove(_ val: Int) -> Bool {
//        if let index = elementIndices[val] {
//            let retained = elements[count-1]
//            (elements[index],elements[count-1]) = (elements[count-1], elements[index])
//            elements.removeLast()
//            elementIndices[retained] = elementIndices[val]
//            elementIndices[val] = nil
//            return true
//        }
//        else {
//            return false
//        }
//    }
//    
//    func getRandom() -> Int {
//        return elements.randomElement() ?? 0
//    }
//}

class RandomizedSet {
    private var nums: [Int] = []
    private var indices: [Int: Int] = [:]
    
    init() {}
    
    func insert(_ val: Int) -> Bool {
        guard indices[val] == nil else { return false }
        
        nums.append(val)
        indices[val] = nums.count - 1
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = indices[val] else { return false }
        
        let lastElement = nums.last!
        nums[index] = lastElement
        indices[lastElement] = index
        
        nums.removeLast()
        indices[val] = nil
        return true
    }
    
    func getRandom() -> Int {
        return nums.randomElement()!
    }
}


let set = RandomizedSet()
set.insert(0)
print(set.elements, set.elementIndices)
set.insert(1)
print(set.elements, set.elementIndices)
set.remove(0)
print(set.elements, set.elementIndices)
set.insert(2)
print(set.elements, set.elementIndices)
set.remove(1)
print(set.elements, set.elementIndices)
print(set.getRandom())
