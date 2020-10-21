func oddSum(n: Int) -> Int {
    if n > 0 {
        if(n % 2 == 1) {
            return n + oddSum(n: n-1)
        }
        else {
            return oddSum(n: n-1)
        }
    }
    
    return 0
 }


let oddSumClosure = {
    (n: Int) -> Bool
    in

    if(n % 2 == 1){
        return true  
    }

    return false
}

func oddSum1(n: Int) -> Int {
    let odd = oddSumClosure(n)
    if n > 0 {
        if(odd == true) {
            return n + oddSum1(n: n-1)
        }
        else {
            return oddSum1(n: n-1)
        }
    }
    return 0
}

print(oddSum1(n: 25))