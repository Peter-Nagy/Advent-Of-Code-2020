class ExpenseReport: Solver {
    func findProductOfTwo(nums: [Int], sum: Int = 2020) -> Int? {
        var map = [Int: Bool]()
        
        for number in nums {
            let otherEntry = sum - number
            if map[otherEntry] != nil {
                return number * otherEntry
            }
            map[number] = true
        }
        return nil
    }
    
    func findProductOfThree(nums: [Int], sum: Int = 2020) -> Int? {
        for i in 0...nums.count - 1 {
            let number = nums[i]
            let sumToFind = sum - number
            var numsToFindIn = nums
            numsToFindIn.remove(at: i)
            
            if let product = findProductOfTwo(nums: numsToFindIn, sum: sumToFind) {
                return number * product
            }
        }
        return nil
    }
    
    func solveFirst(input: [String]) -> Any? {
        return findProductOfTwo(nums: input.map { Int($0)! })
    }
    
    func solveSecond(input: [String]) -> Any? {
        return findProductOfThree(nums: input.map { Int($0)! })
    }
}
