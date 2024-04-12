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

// My solution
//class Solution {
//    func isPalindrome(_ head: ListNode?) -> Bool {
//        var arr = [Int]()
//        var current = head
//        while current != nil {
//            arr.append(current!.val)
//            current = current?.next
//        }
//        
//        while arr.count > 1 {
//            var first = arr.removeFirst()
//            var last = arr.removeLast()
//            if first != last { return false}
//        }
//        return true
//    }
//}

class Solution {
    
    func findMid(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        var reversed = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return reversed
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil else {return true}
        var midNode = findMid(head)
        midNode?.next = reverseList(midNode?.next)
        var p1 = head
        var p2 = midNode?.next
        while p2 != nil {
            if p1?.val != p2?.val { return false}
            p1 = p1?.next
            p2 = p2?.next
        }
        return true
    }
}


var nums = [1,2,2,1]
var linkedListHeadFromNums = createLinkedList(from: nums)
print(Solution().isPalindrome(linkedListHeadFromNums))
