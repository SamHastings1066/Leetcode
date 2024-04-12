

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
     
     func show(){
         var node: ListNode? = self
         repeat {
             print(node?.val ?? "")
             node = node?.next ?? nil
         } while node != nil
     }
 }
 
//class Solution {
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        var headNode: ListNode? = nil
//        var currentNode: ListNode? = nil
//        var firstList: ListNode? = list1
//        var secondList: ListNode? = list2
//        
//        if firstList == nil {
//            currentNode = secondList
//            secondList = secondList?.next
//        } else if secondList == nil {
//            currentNode = firstList
//            firstList = firstList?.next
//        } else if firstList!.val <= secondList!.val {
//            //print(firstList!.val)
//            currentNode = firstList
//            //currentNode?.next = ListNode(1)
//            //print(currentNode?.next?.val)
//            firstList = firstList?.next
//            //print(currentNode?.val, currentNode?.next?.val)
//        } else {
//            currentNode = secondList
//            secondList = secondList?.next
//        }
//        
//        headNode = currentNode
//
//
//        while firstList != nil || secondList != nil {
//
//
//            //currentNode = currentNode?.next
//
//            if firstList == nil {
//                currentNode?.next = secondList
//                secondList = secondList?.next
//            } else if secondList == nil {
//                currentNode?.next = firstList
//                firstList = firstList?.next
//            } else if firstList!.val <= secondList!.val {
//                currentNode?.next = firstList
//                firstList = firstList?.next
//            } else {
//                currentNode?.next = secondList
//                secondList = secondList?.next
//            }
//            
//            currentNode = currentNode?.next
//            
//        }
//
//
//        return headNode
//    }
//}

// Best answer - recursive
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {return l1 == nil ? l2 : l1}
        
        if l1!.val <= l2!.val {
            l1!.next = mergeTwoLists(l1!.next, l2); return l1
        } else {
            l2!.next = mergeTwoLists(l1, l2!.next); return l2
        }
    }
}


let list1: [Int] = [1,2,4], list2: [Int] = [1,3,4]
//let list1: [Int] = [], list2: [Int] = [0]


func createLinkList(from list: [Int]) -> ListNode? {
    guard !list.isEmpty else { return nil }
    var mutableList = list
    let headNode = ListNode(mutableList.removeFirst())
    var nextNode: ListNode? = headNode
    while !mutableList.isEmpty{
        nextNode?.next = ListNode(mutableList.removeFirst())
        nextNode = nextNode?.next
    }
    return headNode
}

let linkedList1Head = createLinkList(from: list1)
let linkedList2Head = createLinkList(from: list2)

//print(linkedList2Head?.val)
//print(linkedList2Head?.next?.val)
//print(linkedList2Head?.next?.next?.val)
//print(linkedList2Head?.next?.next?.next?.val)

let solution = Solution()

print(solution.mergeTwoLists(linkedList1Head, linkedList2Head)?.show())
