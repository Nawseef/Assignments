func sortEvenSquare(array: [Int], conditionCheck: ([Int]) -> [Int]) -> [Int] {
    
    let modifiedArray = conditionCheck(array)

    return modifiedArray
}

let sortClosure = {
    (value1: [Int]) -> [Int]
    in
    var sortedArray = value1
    var temp = 0

    for (i, _) in sortedArray.enumerated() {
        for j in stride(from: i+1, to: sortedArray.count, by: 1) {

            if(sortedArray[i] > sortedArray [j]) {
                temp = sortedArray[i]
                sortedArray[i] = sortedArray[j]
                sortedArray[j] = temp
            }
        }
    }
    return sortedArray
}

let evenArrayClosure = {
    (value1: [Int]) -> [Int]
    in
    var evenArray = [Int]()
    for item in value1 {
        if(item % 2 == 0) {
            evenArray.append(item)
        }
    }
    return sortClosure(evenArray)
}

let squareArrayClosure = {
    (value1: [Int]) -> [Int]
    in
    var squareArray = [Int]()
    for item in value1 {
        if(item % 2 == 0) {
            squareArray.append(item * item)
        }
    }

    return sortClosure(squareArray)
}

let array = [6, 1, 5, 3, 10, 7, 2, 8, 9, 11]
print(sortEvenSquare(array: array,conditionCheck: squareArrayClosure))