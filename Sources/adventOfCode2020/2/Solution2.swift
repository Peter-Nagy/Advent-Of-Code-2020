class PasswordValidator: Solver {
    func solveFirst(input: [String]) -> Any? {
        return input.map { row -> Rule in
            let parameters = row.split(separator: " ")
            let minimumCharacterNumber = Int(parameters[0].split(separator: "-")[0])!
            let maximumCharacterNumber = Int(parameters[0].split(separator: "-")[1])!
            let character = parameters[1].dropLast()
            let password = parameters[2]
            
            return Rule(password: String(password)) {
                let numberOfCharacters = password.components(separatedBy: character).count - 1
                return numberOfCharacters >= minimumCharacterNumber && numberOfCharacters <= maximumCharacterNumber
            }
        }.map { $0.validate() }.filter { $0 }.count
    }
    
    func solveSecond(input: [String]) -> Any? {
        return input.map { row -> Rule in
            let parameters = row.split(separator: " ")
            let firstCharacterPosition = Int(parameters[0].split(separator: "-")[0])!
            let secondCharacterPosition = Int(parameters[0].split(separator: "-")[1])!
            let character = parameters[1].dropLast()
            let password = parameters[2]
            
            return Rule(password: String(password)) {
                var numberOfCharacters = 0
                if String(password)[firstCharacterPosition - 1] == character {
                    numberOfCharacters += 1
                }
                if String(password)[secondCharacterPosition - 1] == character {
                    numberOfCharacters += 1
                }
                return numberOfCharacters == 1
            }
        }.map { $0.validate() }.filter { $0 }.count
    }
    
    typealias RuleValidator = () -> Bool
    
    struct Rule {
        let password: String
        let validate: RuleValidator
    }
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
