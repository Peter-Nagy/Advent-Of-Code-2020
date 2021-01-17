import Foundation

let solvers: [Solver] = [
    ExpenseReport(),
    PasswordValidator(),
    PathFinder(),
    PassportValidator()
]

solvers.enumerated().forEach { index, solver in
    let path = "/Users/PeterNagy/personal/adventOfCode2020/Sources/adventOfCode2020/\(index + 1)/\(index + 1).input"
    let input = Parser.readFile(path: path)
    print("\(index + 1). day:")
    print(solver.solveFirst(input: input))
    print(solver.solveSecond(input: input))
    print("\n")
}

protocol Solver {
    func solveFirst(input: [String]) -> Any?
    func solveSecond(input: [String]) -> Any?
}


class Parser {
    static func readFile(path: String) -> [String] {
        do {
            // Get the contents
            let contents = try String(contentsOfFile: path, encoding: .utf8)
            let input = contents.split(separator: "\n").map { String($0) }
            return input
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        return []
    }
}
