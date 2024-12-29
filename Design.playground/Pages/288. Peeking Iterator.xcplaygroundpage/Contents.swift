class PeekingIterator {
    private var iterator: IndexingIterator<Array<Int>>
    private var nextValue: Int?
    
    init(_ arr: IndexingIterator<Array<Int>>) {
        iterator = arr
        nextValue = iterator.next()
    }
    
    func next() -> Int {
        let current = nextValue
        nextValue = iterator.next()
        return current ?? 0
    }
    
    func peek() -> Int {
        return nextValue ?? 0
    }
    
    func hasNext() -> Bool {
        return nextValue != nil
    }
}
