func pow(base x: Int, power n: Int) -> Int {

    if(n != 0) {

        if(n % 2 == 0) {
          return pow(base: x, power: (n/2)) * pow(base: x, power: (n/2))
        } else {
            return x * pow(base: x, power: (n-1))
        }

    } else {
        return 1
    }

}

let pow1 = {
    (x: Int, n: Int) -> Int
    in
    var answer = x

    if(n != 0) {

        if(n == 1) {
          return x
        }

        for _ in 2...n {
            answer = answer * x
        }

        return answer

    } else {
        return 1
    }

}

print(pow1(5, 4))