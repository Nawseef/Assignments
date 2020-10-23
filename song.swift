func song(number: inout Int) {

    if(number <= 0) {
        print("""
              No bottles of water on the wall,
              no bottles of water,
              ya’ can’t take one down, ya’ can’t pass it around,
              ’cause there are no more bottles of water on the wall!
              """)
    
        return;
    } else if (number > 0) {
        print("""
               \(number) bottles of water on the wall,
               \(number) bottles of water,
               ya’ take one down, ya’ pass it around,
               \(number - 1) bottles of water on the wall.

               """)

        number -= 1
        song(number: &number)
    }

}

func song1(number: inout Int, comparator: (Int) -> Bool) {
    let bottleAvailable = comparator(number)

    if(bottleAvailable) {
          print("""
               \(number) bottles of water on the wall,
               \(number) bottles of water,
               ya’ take one down, ya’ pass it around,
               \(number - 1) bottles of water on the wall.

               """)

          number -= 1
          song(number: &number)
    } else {
        print("""
              No bottles of water on the wall,
              no bottles of water,
              ya’ can’t take one down, ya’ can’t pass it around,
              ’cause there are no more bottles of water on the wall!
              """)
        return;
    }

}

var a = 3
song1(number: &a) {
    ($0 <= 0) ? false : true
}