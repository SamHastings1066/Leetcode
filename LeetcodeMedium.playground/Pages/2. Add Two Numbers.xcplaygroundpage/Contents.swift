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

// My solution
//class Solution {
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var dummyHead = ListNode()
//        var current = dummyHead
//        var l1 = l1
//        var l2 = l2
//        var carriedOne = 0
//        while l1 != nil || l2 != nil || carriedOne != 0 {
//            var val1 = l1?.val ?? 0
//            var val2 = l2?.val ?? 0
//            var sum = val1 + val2 + carriedOne
//            carriedOne = sum / 10
//            current.next = ListNode(sum % 10)
//            current = current.next!
//            l1 = l1?.next
//            l2 = l2?.next
//        }
//        return dummyHead.next
//    }
//}

// Recursive
class Solution {
    private var carry = 0
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && carry == 0 { return nil }
        var sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
        carry = sum / 10
        return .init( sum % 10 , addTwoNumbers(l1?.next, l2?.next))
    }
}

var l1 = [2,4,3]
var l2 = [5,6,4]
//var l1 = [9,9,9,9,9,9,9]
//var l2 = [9,9,9,9]

var l1Head = createLinkedList(from: l1)
var l2Head = createLinkedList(from: l2)

printNodeValues(Solution().addTwoNumbers(l1Head, l2Head))
