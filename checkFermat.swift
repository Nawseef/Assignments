func pow(_ number: Int, _ power: Int) -> Int {
    var temp = number

    for _ in 1..<power {
        temp *= number
    }

    return temp
}

func checkFermat(a: Int, b: Int, c: Int, n: Int)
{

    if(n<3) {
        print("change \(n) to anything greater than 2")
        return;
    }

    if(pow(a, n) + pow(b, n) == pow(c,n)) {
        print("Holy smokes, Fermat was wrong!")
    }

    else{
        print("No, that doesn’t work.")
    }

}
 
checkFermat(a: 2, b: 4, c: 5, n: 3)