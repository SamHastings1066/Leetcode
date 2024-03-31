import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
    }
}

// my solution
//class Solution {
//    func hasCycle(_ head: ListNode?) -> Bool {
//        var mAs = [UnsafeMutableRawPointer]()
//        var head = head
//        while head?.next != nil {
//            if mAs.contains( Unmanaged.passUnretained(head!).toOpaque()) { return true }
//            mAs.append(Unmanaged.passUnretained(head!).toOpaque())
//            head = head?.next
//        }
//        return false
//    }
//}


// Tortoise vs hare approach
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next
        while slow != nil, fast != nil {
            guard slow !== fast else {return true}
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}
