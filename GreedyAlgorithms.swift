import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    
    let n = costs.count
    var resta = Array(repeating: 0, count: n)
    var ans: [Int] = []
    
    for i in 0..<n{
        resta[i] = costs[i][0] - costs[i][1]
    }
    resta.sort(by: <)
    
    for i in 0..<n{
        let num = resta[i]
        for j in 0..<n{
            if num == costs[j][0] - costs[j][1] && ans.count <= n/2 {
                ans.append(costs[j][0])
            }
            if num == costs[j][0] - costs[j][1] && ans.count > n/2{
                ans.append(costs[j][1])
            }
        }
    }
    ans.remove(at: n/2 )
    var sum = 0
    for i in 0..<ans.count{
        sum += ans[i]
    }
    
    return sum
}


func partitionLabels(_ S: String) -> [Int] {
    
    var theString = Array(S)
    
    var pos = 0
    var ans: [Int] = []
    
    print(theString)
    while !theString.isEmpty {
        var myBag = String(theString[0])
        //check where is the last (first letter)
        for i in stride(from: theString.count-1, to: 0, by: -1){
            if myBag.contains(theString[i]){
                pos = i
                break
            }
        }
        
        //appending the letters betwen
        for i in 0..<pos{
            if !myBag.contains(theString[i]){
                myBag.append(theString[i])
            }
        }
    
        //checking the letter after the last
        for i in pos..<theString.count{
            if !myBag.contains(theString[i]){
                break
            }
            else{
                pos += 1
            }
        }
        if(myBag.contains(theString[Int(theString.count-1)])){
            for i in 0..<theString.count{
                myBag.append(theString[i])
            }
        }
        var count = 0
        //Ereasing used letters
        for i in stride(from: theString.count-1, to: -1, by: -1){
            if myBag.contains(theString[i]){
                theString.remove(at: i)
               count += 1
            }
        }
    
        ans.append(count)
        myBag = ""
        pos = 0
        count = 0
    
        print(theString)
    }

    return ans
}
