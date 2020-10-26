func sortEvenSquare(array: [Int], evenCondition: (Int) -> Bool, squareCondition: ([Int]) -> [Int], sortCondition: (Int, Int) -> Bool) -> [Int] {

    var modifiedArray = [Int]()
    var isEven = false, shouldSwap = false
    var temp = 0

    for item in array {
        isEven = evenCondition(item)

        if(isEven) {
            modifiedArray += [item]
        }
    }

    modifiedArray = squareCondition(modifiedArray)

    for (i, _) in modifiedArray.enumerated() {
        for j in stride(from: i+1, to: modifiedArray.count, by: 1) {

            shouldSwap = sortCondition(modifiedArray[i], modifiedArray[j])

            if(shouldSwap) {
                temp = modifiedArray[i]
                modifiedArray[i] = modifiedArray[j]
                modifiedArray[j] = temp
            }
        }
    }

    return modifiedArray
}

let array = [6, 1, 5, 3, 10, 7, 2, 8, 9, 11]
print(sortEvenSquare(array: array,evenCondition: {
    ($0 % 2 == 0) ? true : false
},
squareCondition: {
    var squareArray = [Int]()
    for item in $0 {
        squareArray.append(item * item)
    }
    return squareArray
}
) {
    ($0 > $1) ? true : false
})