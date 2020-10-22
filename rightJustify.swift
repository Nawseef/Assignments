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

let justifyingClosure = {
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

func rightjustify1(s: String, isJustified: (String) -> String) {
    let justified = isJustified(s)
    print(justified)
}

rightjustify1(s: "monty", isJustified: justifyingClosure)