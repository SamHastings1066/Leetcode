
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// My first solution
//class Solution {
//    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//        var headA = headA
//        var headB = headB
//        
//        var listA = [ListNode]()
//        var listB = [ListNode]()
//        while headA != nil {
//            listA.append(headA!)
//            headA = headA?.next
//        }
//        while headB != nil {
//            listB.append(headB!)
//            headB = headB?.next
//        }
//        var lastNode = listA.removeLast()
//        if lastNode !== listB.removeLast() {
//            return nil
//        }
//
//        if listA.isEmpty || listB.isEmpty {
//            return lastNode
//        }
//        var tempA = ListNode(0)
//        var tempB = ListNode(0)
//
//        while !listA.isEmpty, !listB.isEmpty {
//            tempA = listA.removeLast()
//            tempB = listB.removeLast()
//            if tempA !== tempB {return lastNode}
//            lastNode = tempA
//        }
//
//        if tempA === tempB { return tempA }
//
//        return nil
//    }
//}

// HashSet
//class Solution {
//    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//        var headA = headA
//        var headB = headB
//        var visited = Set<ObjectIdentifier>()
//        
//        while headA != nil {
//            visited.insert(ObjectIdentifier(headA!))
//            headA = headA?.next
//        }
//        
//        while headB != nil {
//            if visited.contains(ObjectIdentifier(headB!)) {
//                return headB!
//            }
//            headB = headB?.next
//        }
//        
//        return nil
//    }
//}

// Two pointers
class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var p1 = headA
        var p2 = headB
        
        while p1 !== p2 {
            p1 = p1 == nil ? headB : p1?.next
            p2 = p2 == nil ? headA : p2?.next
        }
        
        return p1
    }
}
