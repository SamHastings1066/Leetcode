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


// First approach
//class Solution {
//    func merge(_ a: [Int], _ b: [Int]) -> [Int] {
//        var c = [Int]()
//        var a = a, b = b
//        while !a.isEmpty && !b.isEmpty {
//            if a[0]<b[0] {
//                let e = a.removeFirst()
//                c.append(e)
//            } else {
//                let e = b.removeFirst()
//                c.append(e)
//            }
//        }
//        
//        while !a.isEmpty {
//            let e = a.removeFirst()
//            c.append(e)
//        }
//        
//        while !b.isEmpty {
//            let e = b.removeFirst()
//            c.append(e)
//        }
//        
//        return c
//    }
//    
//    func mergesort(_ arr: [Int]) -> [Int] {
//        let n = arr.count
//        if n == 1 { return arr }
//        
//        let arr1 = mergesort(Array(arr[0..<n/2]))
//        let arr2 = mergesort(Array(arr[n/2..<n]))
//        
//        return merge(arr1, arr2)
//    }
//    
//    func sortList(_ head: ListNode?) -> ListNode? {
//        var arr = [Int]()
//        var node = head
//        while node != nil {
//            arr.append(node!.val)
//            node = node?.next
//        }
//        arr = mergesort(arr)
//        node = head
//        for i in 0..<arr.count {
//            node!.val = arr[i]
//            node = node?.next
//        }
//        return head
//    }
//}

class Solution {
    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummyTail = ListNode(0)
        var l1=l1, l2=l2
        var node: ListNode? = dummyTail
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                node?.next = l1
                l1 = l1?.next
            } else {
                node?.next = l2
                l2 = l2?.next
            }
            node = node?.next
        }
        node?.next = l1 == nil ? l2 : l1
        return dummyTail.next
    }
    
    func getMid(_ l: ListNode?) -> ListNode? {
        var prevMid: ListNode?
        var node = l
        while node != nil && node?.next != nil {
            prevMid = prevMid == nil ? node : prevMid?.next
            node = node?.next?.next
        }
        var mid = prevMid?.next
        prevMid?.next = nil
        return mid
        
    }
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        var mid = getMid(head)
        var l1 = sortList(head)
        var l2 = sortList(mid)
        return merge(l1,l2)
        
    }
}

var arrayOne = [-1,5,3,4,0]
var linkedListOneHead = createLinkedList(from: arrayOne)
var result = Solution().sortList(linkedListOneHead)
printNodeValues(result)
