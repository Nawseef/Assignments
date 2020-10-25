import Foundation
func arrayOfArray(array: [[[Int]]]) {
    var sum = 0
    if(array.isEmpty) {
        print("array Empty")
        return;
    }

    for (i, _) in array.enumerated() {
        for (j, _) in array[i].enumerated() {
            for (k, _) in array[i][j].enumerated() {
                
                sum += array[i][j][k]

            }
        }
    }
    
    print(sum)
}

var list = 
[
    [
        [4],
        [21, 4]
    ],
    [
        [1,2,3],
        [99, 98]
    ], 
    [
        [5, 13, 20],
        [6,78,40]
    ], 
    [
        [6]
    ]
]

arrayOfArray(array: list)