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


// 2-pass approach
//class Solution {
//    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        guard head?.next != nil else {return nil}
//        var listLength = 0
//        var current = head
//        while current != nil {
//            listLength += 1
//            current = current?.next
//        }
//        if listLength == n {
//            return head?.next
//        }
//        var latest = head
//        for _ in 0..<listLength-n-1 {
//            latest = latest?.next
//        }
//        latest?.next = latest?.next?.next
//        return head
//    }
//}

// One-pass approach
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var current = head
        for _ in 0..<n { current = current?.next}
        if current == nil { return head?.next }
        var nodeBeforeNodeToRemove = head
        while current?.next != nil {
            current = current?.next
            nodeBeforeNodeToRemove = nodeBeforeNodeToRemove?.next
        }
        nodeBeforeNodeToRemove?.next = nodeBeforeNodeToRemove?.next?.next
        return head
    }
}

var arrayOne = [1,2,3,4,5]
var linkedListOneHead = createLinkedList(from: arrayOne)
var resultNode = Solution().removeNthFromEnd(linkedListOneHead, 2)
printNodeValues(resultNode)
