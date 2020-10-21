func rightjustify(s: String) {
    var temp = s 

    for _ in 1...70 {

        if(temp.count<70) {
            temp = " " + temp
        }

        else{
            break;
        }

     }

    print(temp)
}

let closure = {
    (s: String) -> String
    in
    var temp = s 

    for _ in 1...70 {
        if(temp.count<70) {
            temp = " " + temp
        }
        else{
            break;
        }
    }

     return temp
}

func new(s: String) {
    let justified = closure(s)
    print(justified)
}

rightjustify(s: "monty")