import Foundation
func arrayOfArray(array: [Any]) -> Int {
    var sum = 0

    if(array.isEmpty) {
        print("array Empty")
        return -1;
    }

    for (i, _) in array.enumerated() {
        if let temp = array[i] as? [Any] {
            sum += arrayOfArray(array: temp)
        } else {
            if let temp = array[i] as? Int {
              sum += temp
            }
        }
    }
    
    return sum
}

var list = 
[
    [
        4,
        [21, 4]
    ],
    [
        [1, 2],
        3,
        [ 99, 
          [98, 13]
        ]
    ], 
    [
        [5, 20],
        [6, 78, 40]
    ], 
    [
        [6]
    ]
]

print(arrayOfArray(array: list))