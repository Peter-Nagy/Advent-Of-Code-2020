class PassportValidator: Solver {
    func solveFirst(input: [String]) -> Any? {
        var passportStrings = [String]()
        var currentPassportString = ""
        for line in input {
            if line == "/n" {
                passportStrings.append(currentPassportString)
                currentPassportString = ""
            } else {
                currentPassportString += " \(line)"
            }
        }
        return passportStrings
    }
    
    func solveSecond(input: [String]) -> Any? {
        return nil
    }
    
    struct Passport {
        var birthYear: String?
        var issueYear: String?
        var expirationYear: String?
        var height: String?
        var hairColor: String?
        var eyeColor: String?
        var passportId: String?
        var countryId: String?
    }
}
