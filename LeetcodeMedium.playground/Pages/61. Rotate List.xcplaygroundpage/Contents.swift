public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func createLinkedList(from array: [Int]) -> ListNode? {
    guard !array.isEmpty else {return nil}
    let head = ListNode(array.first!)
    var current = head
    for value in array.dropFirst() {
        var newNode = ListNode(value)
        current.next = newNode
        current = newNode
    }
    return head
}

func printNodeValues(_ head: ListNode?) {
    guard head != nil else {print("Empty list"); return}
    var node = head
    while let currentNode = node {
        print(currentNode.val)
        node = currentNode.next
    }
}

//var arrayOne = [1,2,3,4,5]
//var linkedListOneHead = createLinkedList(from: arrayOne)
//printNodeValues(linkedListOneHead)

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head==nil || head?.next == nil { return head }
        var oldTail = head
        var n = 1
        while oldTail?.next != nil {
            oldTail = oldTail?.next
            n+=1
        }
        oldTail?.next = head
        
        var newTail = head
        var numIterations = n - (k % n) - 1
        
        for _ in 0..<numIterations {
            newTail = newTail?.next
        }
        
        var newHead = newTail?.next
        newTail?.next = nil
        return newHead
        
    }
}

var input: [Int] = [0,1,2,3]
var inputHead = createLinkedList(from: input)
var outputHead = Solution().rotateRight(inputHead, 4)
printNodeValues(outputHead)
