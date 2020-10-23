func evenOddSum(array: [Int], comparator: (Int) -> Bool) -> (even:Int, odd: Int) {
    var isEven = false
    var evenSum:Int = 0, oddSum: Int = 0
    var list = array

    for(i, _) in list.enumerated() {

        isEven = comparator(list[i])

        if(isEvenTrue) {
            evenSum += list[i]
        } else {
            oddSum += list[i]
        }
    }

    return (evenSum, oddSum)
}

var numberList = [1, 7, 11, 3, 9, 8, 5, 12, 10]
let total = evenOddSum(array: numberList) {
    return ($0 % 2 == 0) ? true : false 
}

print("""
      Sum of all even numbers in array is \(total.even)
      Sum of all odd numbers in array is \(total.odd)
      """)