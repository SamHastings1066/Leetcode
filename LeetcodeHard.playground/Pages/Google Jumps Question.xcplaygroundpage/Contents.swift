/*

 You are given an integer array A of size N. You can jump from index J to index K, such that K > J, in the following way:
  
 during odd-numbered jumps (i.e. jumps 1, 3, 5 and so on), you jump to the smallest index K such that A[J] < A[K] and A[K] − A[J] is minimal among all possible K's.
 during even-numbered jumps (i.e. jumps 2, 4, 6 and so on), you jump to the smallest index K such that A[J] > A[K] and A[J] − A[K] is minimal among all possible K's.
  
 It may be that, for some index J, there is no legal jump. In this case the jumping stops.
  
 Write a function that, given an integer array A of length N, returns an integer denoting the number of starting points from which you can reach (maybe by jumping more than once) the end of the array A (index N − 1).
 Example: [1] => 1

 For example, given A = [10, 13, 12, 14, 15] the function should return 2. Explanation:
  
 For J=0:
  
 During the 1st (odd-numbered) jump, you jump to index K=2 because A[K] > A[J] (i.e. 12 > 10) and A[K] − A[J] is minimal.
 During the 2nd (even-numbered) jump, there is no legal jump from index 2 because there are no more elements that are smaller than 12.
  
 Therefore, you cannot reach the end of array A from its 0 field.
  
 For J=1:
  
 During the 1st (odd-numbered) jump, you jump to index K=3 because A[K] > A[J] (i.e. 14 > 13) and A[K] − A[J] is minimal.
 During the 2nd (even-numbered) jump, there is no legal jump from index 3 because there are no more elements that are smaller than 14.
  
 Therefore, you cannot reach the end of array A from its 1st field.
  
 For J=2:
  
 During the 1st (odd-numbered) jump, you jump to index K=3 because A[K] > A[J] (i.e. 14 > 12) and A[K] − A[J] is minimal.
 During the 2nd (even-numbered) jump, there is no legal jump from index 3, because there are no more elements that are smaller than 14.
  
 Therefore, you cannot reach the end of array A from its 2nd field.
  
 For J=3:
  
 During the 1st (odd-numbered) jump, you jump to the last index (K=4) because A[K] > A[J] (i.e. 15 > 14) and A[K] − A[J] is minimal.
 You can reach the end of array A from its 3rd field.
  
 For J=4 you are already at the end of array A.
  
 Thus, you can reach the end of the array only from indices 3 and 4. Therefore, the function should return 2.
  
 Given A = [10, 11, 14, 11, 10] the function should also return 2. You can reach the end of the array from indices 0 and 4.

*/


// Brute Force - time: O(n^2); space: O(1)
func totalJumps(_ arr: [Int]) -> Int {
    let n = arr.count
    var totalJumps = 0
    for j in arr.indices {
        var curr = j
        var numJumps = 1
        while curr < n {
            if curr == n-1 {
                totalJumps += 1
                break
            } else if numJumps % 2 == 1 {
                var minDiff = Int.max
                var nextIndex = -1
                for k in curr+1..<n {
                    if arr[k]>arr[curr] {
                        let diff = arr[k] - arr[curr]
                        if diff < minDiff || (diff == minDiff && k < nextIndex) {
                            minDiff = diff
                            nextIndex = k
                        }
                    }
                }
                if nextIndex == -1 {
                    break
                } else {
                    curr = nextIndex
                    numJumps += 1
                }
            } else {
                var minDiff = Int.max
                var nextIndex = -1
                for k in curr+1..<n {
                    if arr[k]<arr[curr] {
                        let diff = arr[curr] - arr[k]
                        if diff < minDiff || (diff == minDiff && k < nextIndex) {
                            minDiff = diff
                            nextIndex = k
                        }
                    }
                }
                if nextIndex == -1 {
                    break
                } else {
                    curr = nextIndex
                    numJumps += 1
                }
            }
        }
    }
    return totalJumps
}


import XCTest

class SolutionTests: XCTestCase {
    
    func test_totalJumps_returns2ForExampleTestCase() {
        let A = [10, 11, 14, 11, 10]
        XCTAssertEqual(totalJumps(A), 2)
    }
    
    func test_totalJumps_returns1ForExampleWithNoValidJumps() {
        let A = [12, 11, 10]
        XCTAssertEqual(totalJumps(A), 1)
    }
}

SolutionTests.defaultTestSuite.run()


