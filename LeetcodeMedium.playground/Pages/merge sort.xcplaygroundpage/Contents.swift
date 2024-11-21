func merge(_ a:  [Int], _ b:  [Int]) -> [Int] {
    var c = [Int]()
    var a = a, b = b
    while !a.isEmpty && !b.isEmpty {
        if a[0] < b[0] {
            let e = a.removeFirst()
            c.append(e)
        } else {
            let e = b.removeFirst()
            c.append(e)
        }
    }
    
    while !a.isEmpty  {
        // let e = a.removeFirst()
        // c.append(e)
        // simpler option:
        c.append(contentsOf: a)
    }
    
    while !b.isEmpty  {
        // let e = b.removeFirst()
        // c.append(e)
        // simpler option:
        c.append(contentsOf: b)
    }
    
    return c
}

func mergeSort(_ arr: [Int]) -> [Int] {
    let n = arr.count
    
    if n == 1 { return arr }
    
    var arr1 = mergeSort(Array(arr[0..<n/2]))
    var arr2 = mergeSort(Array(arr[n/2..<n]))
    
    return merge(arr1, arr2)
}



print(mergeSort([2,8,5,3,9,4,1,7]))
