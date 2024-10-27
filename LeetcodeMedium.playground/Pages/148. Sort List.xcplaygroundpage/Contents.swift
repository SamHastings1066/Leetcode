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

// Top down
//class Solution {
//    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var dummyTail = ListNode(0)
//        var l1=l1, l2=l2
//        var node: ListNode? = dummyTail
//        while l1 != nil && l2 != nil {
//            if l1!.val < l2!.val {
//                node?.next = l1
//                l1 = l1?.next
//            } else {
//                node?.next = l2
//                l2 = l2?.next
//            }
//            node = node?.next
//        }
//        node?.next = l1 == nil ? l2 : l1
//        return dummyTail.next
//    }
//    
//    func getMid(_ l: ListNode?) -> ListNode? {
//        var prevMid: ListNode?
//        var node = l
//        while node != nil && node?.next != nil {
//            prevMid = prevMid == nil ? node : prevMid?.next
//            node = node?.next?.next
//        }
//        var mid = prevMid?.next
//        prevMid?.next = nil
//        return mid
//        
//    }
//    func sortList(_ head: ListNode?) -> ListNode? {
//        if head == nil || head?.next == nil { return head }
//        var mid = getMid(head)
//        var l1 = sortList(head)
//        var l2 = sortList(mid)
//        return merge(l1,l2)
//        
//    }
//}

// Bottom up
class Solution {
    // - Complexity:
    //   - time: O(n log(n)), where n is the number of nodes in the linked list.
    //   - space: O(1), only constant space is used.

    ///`tail` is a global variable that represents the tail of the last list that was merged.
    private var tail = ListNode(-1)
    /// `nextSublist` is a global variable pointing to the first node in the next sublist to be merged.
    private var nextSublist: ListNode? = ListNode(-1)


    /// This function takes the list starting at the node `head`. It sets up the following variables
    /// `start` - points to the first node in the two sublists to be merged in the current iteration of the inner while loop.. It is initialised to point to the head of the input list.
    /// - `dummy`points to a sentinel node prior to the first node in the list.
    /// - `size` represents the length of the two lists that will be merged in the function `merge(_:_:)`.
    /// - `n` represents the length of the list stating at the node `head`.
    /// While `size` is less than `n` the function does the following:
    ///  - Sets `tail` to `dummy` - a sentinel node.
    ///  - While `start` is not nil (inner while loop):
    ///     - if the node after `start` is nil, the tail of the previously merged node is connected to `start` and the inner while loop is broken.
    ///     - The list starting at start is split into two sublists to be merged in this iteration of the iiner while loop, and a third sublist which will be the sublist to be broken down and merged in the next iteration of the inner while loop. `mid` points to the first node in the second of the two sublists to be merged in this iteration.
    ///     - The sublists starting at `start` and `mid` are then merged in sorted order the `merge` function sets `tail` to the end of the sorted list.
    ///  - `start` is reset to be the first node in the semi-sorted list
    ///  - `size` is doubled.
    func sortList(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }

        var start = head
        let dummy = ListNode(-1)

        var size = 1
        let n = getCount(head)

        while size < n {
            tail = dummy
            while start != nil {
                guard start?.next != nil else {
                    tail.next = start
                    break
                }

                var mid = split(start, size)
                merge(&start, &mid)
                start = nextSublist
            }
            start = dummy.next

            size *= 2
        }

        return dummy.next
    }


    /// This function takes the list starting at the node `start` and, if possible - i.e. if the list is long enough - breaks the list into three lists. The first two lists are of length `size`, and are the lists to be merged. The third list, representing the next sublist to be merged, is comprised of all the nodes remaining in the original list. The function returns `mid` - which points to the start of the second list.
    /// At the begining of the function:
    /// - `start` points to the first node in the list.
    /// - `end` is initialised to point to the node after the first node in the list, if it exists.
    /// The for loop generates `size-1` iterations. In each iteration, the for loop moves `start` forwards along the list  by one node and it moves `end` forwards along the list by two nodes at a time.
    /// After the for loop has finished, `start` points to the final node in the first list and `end` points to the final node in the second list.
    /// - `mid` is set to `start.next` i.e. the first node in the second list. Then `start.next` is set to `nil`, thus breaking the link between the first two lists.
    /// `nextSubList` is set to the node after the end of the sceond list thereby pointing to the first node in the next sublist to be merged, as required. Then `end.next` is set to `nil`, thus breaking the link between the first second list and the next sublist to be merged.
    /// By the end of the function the three lists are as follows:
    /// - `start` points to the final node in the first list, or nil if the original list is nil;
    /// - `mid` points to the first node in the second list, or nil if the original list is not long enough;
    /// - `end` points to the final node in the second list, or nil if the original list is not long enough;
    /// - `nextSublist` points to the first node in the final list, or nil if the original list is not long enough.
    ///
    
    private func split(_ start: ListNode?, _ size: Int) -> ListNode? {
        var start = start
        var end = start?.next

        for _ in 1..<size {
            if let endNext = end?.next { end = endNext.next ?? endNext }
            if let startNext = start?.next { start = startNext }
        }
        let mid = start?.next
        start?.next = nil
        nextSublist = end?.next
        end?.next = nil

        return mid
    }

    
    /// Takes the list starting at node `list1` and the list starting at node `list2` and merges the nodes in order of ascending node value. Sets `tail` to the end of the merged list.
    /// `dummy` points to a sentinel node representing the node prior to the start of the merged list. Therefore `dummy.next` is the first node in the merged list.
    /// `curr` is used to point to the current node as the function iterates through the list nodes during the merging process in the while loop. `curr` starts off pointing to `dummy` -  the sentinel node prior to the start of the merged list.
    /// `tail` is a global variable that represents the tail of the last list that was merged. Therefore, at the end of this merge function, tail is set to the end of the merged list. This is either the node pointed to by`curr`, or if `curr` is nil, this is `dummy.next` - which points to the first node in the newly merged list.
    private func merge(_ list1: inout ListNode?, _ list2: inout ListNode?) {
        let dummy = ListNode(-1)
        var curr: ListNode? = dummy

        while let list1Val = list1?.val, let list2Val = list2?.val {
            if list1Val < list2Val {
                curr?.next = list1
                list1 = list1?.next
            } else {
                curr?.next = list2
                list2 = list2?.next
            }
            curr = curr?.next
        }
        curr?.next = list1 != nil ? list1 : list2
        while curr?.next != nil { curr = curr?.next }

        tail.next = dummy.next
        if let curr = curr { tail = curr }
    }


    /// Returns the length of the list of that begins at the node `head`.
    private func getCount(_ head: ListNode?) -> Int {
        var count = 0
        var curr = head

        while curr != nil {
            curr = curr?.next
            count += 1
        }

        return count
    }

}

var maxi = 0
print(max(maxi, 3))

// Additionally, if you think any of the names of the variables in the model solution could have more intuitive names please can you change them to the more intuitive names, and adjust the comments accordingly.
var arrayOne = [-1,5,3,4,0]
var linkedListOneHead = createLinkedList(from: arrayOne)
var result = Solution().sortList(linkedListOneHead)
printNodeValues(result)


