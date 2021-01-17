class PathFinder: Solver {
    func findPath(input: [String], xStep: Int, yStep: Int) -> Int {
        let lines = input
        var map = [[String]]()
        lines.forEach { line in
            map.append(line.map { String($0) })
        }
        var x = 0
        var y = 0
        var numberOfTrees = 0
        while y < map.count {
            if map[y][x] == "#" {
                numberOfTrees += 1
            }
            x = (x + xStep) % map[0].count
            y += yStep
        }
        return numberOfTrees
    }
    
    func solveFirst(input: [String]) -> Any? {
        return findPath(input: input, xStep: 3, yStep: 1)
    }
    
    func solveSecond(input: [String]) -> Any? {
        return
            findPath(input: input, xStep: 1, yStep: 1) *
            findPath(input: input, xStep: 3, yStep: 1) *
            findPath(input: input, xStep: 5, yStep: 1) *
            findPath(input: input, xStep: 7, yStep: 1) *
            findPath(input: input, xStep: 1, yStep: 2)
        
    }
}
