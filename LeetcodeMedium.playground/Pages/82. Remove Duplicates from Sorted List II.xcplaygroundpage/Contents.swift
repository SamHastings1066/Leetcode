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

// First solution
//class Solution {
//    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        if head == nil { return nil }
//        var isHeadSet = false
//        var dummy: ListNode? = ListNode(0, head)
//        var prev: ListNode?
//        var first: ListNode? = head
//        var next: ListNode?
//        while first != nil {
//            if first?.val == first?.next?.val {
//                next = first?.next
//                while first?.val == next?.val {
//                    next = next?.next
//                }
//                prev?.next = next
//                first = next
//            } else {
//                if !isHeadSet {
//                    dummy = first
//                    isHeadSet = true
//                }
//                prev = first
//                first = first?.next
//            }
//        }
//        
//        return isHeadSet ? dummy : nil
//        
//    }
//}

// Sentinel head
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var sentinel = ListNode(0,head)
        var pred: ListNode? = sentinel
        var curr = head
        while curr != nil {
            if curr?.next != nil && curr?.val == curr?.next?.val {
                while curr?.next != nil && curr?.val == curr?.next?.val {
                    curr = curr?.next
                }
                pred?.next = curr?.next
            } else {
                pred = curr
            }
            curr = curr?.next
        }
        return sentinel.next
    }
}
var arrayOne = [1,2,3,3,4,4,5]
var head = createLinkedList(from: arrayOne)
printNodeValues(Solution().deleteDuplicates(head))

