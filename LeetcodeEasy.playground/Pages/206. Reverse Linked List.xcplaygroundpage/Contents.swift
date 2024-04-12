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
// My Solution
//class Solution {
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        guard head != nil else {return nil}
//        
//        var reversed = [Int]()
//        var current = head
//        while current != nil {
//            reversed.insert(current!.val, at: 0)
//            current = current!.next
//        }
//        
//        let returnNode = ListNode(reversed.first!)
//        current = returnNode
//        for value in reversed.dropFirst() {
//            let newNode = ListNode(value)
//            current!.next = newNode
//            current = newNode
//        }
//        return returnNode
//    }
//}

// Iterative
//class Solution {
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        var current = head
//        var prev: ListNode? = nil
//        while current != nil {
//            var nextNode = current?.next
//            current?.next = prev
//            prev = current
//            current = nextNode
//        }
//        return prev
//    }
//}

// Recursive
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        var reversed = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return reversed
    }
}


var arrayOne = [1,2,3,4,5]
var linkedListOneHead = createLinkedList(from: arrayOne)
printNodeValues(Solution().reverseList(linkedListOneHead))
