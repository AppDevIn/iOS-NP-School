// Excerise 1
for index in 1...20{
    print(index)
}

// Excerise 2
for index in 1...20{
    if index % 2 != 0{print(index)}
}

// Excerise 3
var oddSum: Int = 0
for index in 1...20{
    if index % 2 != 0 {
        oddSum += index;
        print(oddSum);
        
    }
}

//Example
func sayIt(_ aNumber: Int) {
    print("You pass a " + String(aNumber))
}

sayIt(5);

// Excerise 4
func result(mark: Int)-> String {
    
    if mark > 50{
        return "Pass"
    }else{
        return "Fail";
    }
    
}

print(result(mark: 10))
print(result(mark: 100))


// Excerise 5

func generate10Ran() -> [Int]{
    var arr: [Int] = [];
    
    
    for _ in 1...10{
        arr.append(Int.random(in: 1...100))
    }
    
    return arr;
    
}

func findMax(n: [Int])->Int {
    return n.max()!;
}

findMax(n: generate10Ran())

//Excerise 6
func findMin(n: [Int])->Int {
    return n.min()!;
}

findMin(n: generate10Ran())

//Excerise 7
func sum(_ n:[Int]) -> Int{
    var total: Int = 0;
    
    for items in n {
        total += items;
    }
    
    return total;
}

func findAvg(n:[Int]) -> Int{
    
    return sum(n)/n.count
}

findAvg(n: generate10Ran())

