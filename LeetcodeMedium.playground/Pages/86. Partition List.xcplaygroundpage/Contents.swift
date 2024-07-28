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

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var sentinelBefore = ListNode(0)
        var sentinelAfter = ListNode(0)
        var before: ListNode? = sentinelBefore
        var after: ListNode? = sentinelAfter
        
        var current = head
        while current != nil {
            if current!.val < x {
                before?.next = current
                before = before?.next
            } else {
                after?.next = current
                after = after?.next
            }
            current = current?.next
        }
        before?.next = sentinelAfter.next
        after?.next = nil
        
        return sentinelBefore.next
    }
}

var arrayOne = [1,4,3,2,5,2]
var head = createLinkedList(from: arrayOne)
var x = 3
printNodeValues(Solution().partition(head, x))
