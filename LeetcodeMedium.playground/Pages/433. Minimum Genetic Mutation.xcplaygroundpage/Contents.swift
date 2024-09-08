// First approach
//class Solution {
//
//    func dist(_ geneA: [Character], _ geneB: [Character]) -> Int {
//        var dist = 0
//        for i in 0..<8 {
//            if geneA[i] != geneB[i] {
//                dist += 1
//            }
//        }
//        return dist
//    }
//    
//    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
//        if startGene == endGene { return 0 }
//        var startGene = Array(startGene)
//        var bank = bank.map { Array($0) }
//        var queue = [startGene]
//        var moves = 0
//        var seen: [String] = []
//        while !queue.isEmpty {
//            let levelSize = queue.count
//            
//            for _ in 0..<levelSize {
//                let curr = queue.removeFirst()
//                seen.append(String(curr))
//                
//                for gene in bank {
//                    if !seen.contains(String(gene)){
//                        if dist(gene, curr) == 1 {
//                            if String(gene) == endGene {
//                                return moves + 1
//                            }
//                            queue.append(gene)
//                        }
//                    }
//                }
//            }
//            moves += 1
//        }
//        return -1
//    }
//}

class Solution {
    
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        var queue = [(startGene, 0)]
        var seen = Set<String>()
        
        while !queue.isEmpty {
            var (node, steps) = queue.removeFirst()
            if node == endGene { return steps }
            
            for c in "ACGT" {
                for i in 0..<8 {
                    let neighbour = String(Array(node)[0..<i] + [c] + Array(node)[i+1..<8])
                    if !seen.contains(neighbour) && bank.contains(neighbour) {
                        queue.append((neighbour, steps + 1))
                        seen.insert(neighbour)
                    }
                }
            }
        }
        return -1
    }
}

var startGene = "AACCGGTT"
var endGene = "AAACGGTA"
var bank = ["AACCGGTA","AACCGCTA","AAACGGTA"]

print(Solution().minMutation(startGene, endGene, bank))

