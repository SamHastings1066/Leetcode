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

//My solution Iterative 
class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var head = head
        var lastLeft: ListNode? = nil
        var start: ListNode? = nil
        var end: ListNode? = nil
        var i = 1
        var current = head
        while i <= right  {
            if i < left - 1 {
                current = current?.next
            }
            else if i == left - 1 {
                lastLeft = current
                current = current?.next
            } else if i == left {
                start = current
                end = current
                current = current?.next
            } else if i <= right {
                lastLeft?.next = current
                end?.next = current?.next
                current?.next = start
                start = current
                current = end?.next
            }
            i += 1
        }
        if left == 1 { head = start}
        return head
    }
}

// Solution recursive
//class Solution {
//    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//        var dummy = ListNode(0, head)
//        var before = dummy
//        for _ in 1..<left {
//            before = before.next!
//        }
//        reverse(before, left, right)
//        return dummy.next
//    }
//    
//    func reverse(_ before: ListNode, _ left: Int, _ right: Int) -> ListNode {
//        if left == right { return before.next! }
//        var first = before.next!
//        var (revSublistStart, revSublistEnd, last, after) = (ListNode(0), ListNode(0), ListNode(0), ListNode(0))
//        if right - left > 1 {
//            revSublistEnd = reverse(first, left + 1, right - 1)
//            revSublistStart = first.next!
//            last = revSublistEnd.next!
//        } else {
//            last = first.next!
//            revSublistStart = first
//            revSublistEnd = last
//        }
//        after = last.next!
//        
//        // Swap first and last
//        before.next = last
//        last.next = revSublistStart
//        revSublistEnd.next = first
//        first.next! = after
//        return first
//    }
//}



var array = [3,5]
var head = createLinkedList(from: array)
var reversedList = Solution().reverseBetween(head, 1, 2)
printNodeValues(reversedList)
