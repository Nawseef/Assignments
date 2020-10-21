func oddSum(n: Int) -> Int {
    if n > 0 {
        if(n % 2 == 1) {
            print(n)
            return n + oddSum(n: n-1)
        }
        else {
            return oddSum(n: n-1)
        }
    }
    
    return 0
}

print(oddSum(n: 25))