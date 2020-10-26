func oddSum(n: Int) -> Int {
    if(n > 0) {

        if(n % 2 == 1) {
            return n + oddSum(n: n-1)
        } else {
            return oddSum(n: n-1)
        }

    }
    return 0
 }

func oddSum1(n: Int, comparator: (Int) -> Bool) -> Int {
    let odd = comparator(n)
    if(n > 0) {

        if(odd) {
            return n + oddSum1(n: n-1, comparator: comparator)
        } else {
            return oddSum1(n: n-1, comparator: comparator)
        }
        
    }
    return 0
}

print(oddSum1(n: 25) {
    ($0 % 2 == 1) ? true : false
})