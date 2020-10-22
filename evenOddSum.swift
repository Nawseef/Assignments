var numberList = [2, 7, 11, 3, 9, 8, 5, 12, 10]

let additionClosure = {
    (value1: Int) -> Bool
    in
    if(value1 % 2 == 0) {
        return true
    }

    return false
}

func evenOddSum(array: [Int], comparator: (Int) -> Bool) -> (even:Int, odd: Int) {
    var isEvenTrue = false
    var evenSum:Int = 0, oddSum: Int = 0
    var list = array

    for(i, _) in list.enumerated() {

        isEvenTrue = comparator(list[i])

        if(isEvenTrue) {
            evenSum += list[i]
        }
        else {
            oddSum += list[i]
        }
    }

    return (evenSum, oddSum)
}

let total = evenOddSum(array: numberList, comparator: additionClosure)

print("""
      Sum of all even numbers in array is \(total.even)
      Sum of all odd numbers in array is \(total.odd)
      """)