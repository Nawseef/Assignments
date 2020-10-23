func pow(_ number: Int, _ power: Int) -> Int {
    var temp = number

    for _ in 1..<power {
        temp *= number
    }

    return temp
}

func checkFermat(a: Int, b: Int, c: Int, n: Int, comparator: (Int, Int, Int, Int) -> Bool) {
    if(n<1) {
        print("change \(n) to anything greater than 0")
        return;
    }

    let fermatWrong = comparator(a, b, c, n)

    if(fermatWrong) {
        print("Holy smokes, Fermat was wrong!")
    } else {
        print("No, that doesn’t work.")
    }
}
 
checkFermat(a: 3, b: 4, c: 5, n: 2) {
    return ((pow($0, $3) + pow($1, $3) == pow($2, $3))) ? true : false
}