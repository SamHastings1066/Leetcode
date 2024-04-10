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

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var arr = [Int]()
        var current = head
        while current != nil {
            arr.append(current!.val)
            current = current?.next
        }
        
        while arr.count > 1 {
            var first = arr.removeFirst()
            var last = arr.removeLast()
            if first != last { return false}
        }
        return true
    }
}

var nums = [1,2,2,1]
var linkedListHeadFromNums = createLinkedList(from: nums)
print(Solution().isPalindrome(linkedListHeadFromNums))
