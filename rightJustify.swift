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

rightjustify(s: "monty")


