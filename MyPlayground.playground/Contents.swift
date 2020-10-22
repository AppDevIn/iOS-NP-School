// Excerise 1
for index in 1...20{
    print("The number is \(index)")
}

// Excerise 2
for index in 1...20{
    if index % 2 != 0{print("The odd number is \(index)")}
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
    
    if mark >= 50 {
        return "Pass"
    }
    return "Fail";
    
    
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
    var max: Int = n[0]
    for value in n[1..<n.count]{
        if value > max{
            max = value
        }
    }
    
    return max
}

findMax(n: generate10Ran())

//Excerise 6
func findMin(n: [Int])->Int {
    var min: Int = n[0]
    for value in n[1..<n.count]{
        if value < min{
            min = value
        }
    }
    
    return min
}

findMin(n: generate10Ran())

//Excerise 7

func findAvg(n:[Int]) -> Double{
    print(n)
    return Double(n.reduce(0, +))/Double(n.count)
}

findAvg(n: generate10Ran())

