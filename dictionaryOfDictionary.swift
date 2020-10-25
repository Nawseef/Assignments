import Foundation
func dictionaryOfDictionary(dic: [String: [String: String]], search: String) {
    let array = search.components(separatedBy: ":")
    let lastString = array.count - 1

    for i in 0...lastString {
        if(i == 0) {
            if(dic.keys.contains(array[i]) == false) {
                print("\(array[i]) is wrong key")
                return;
            }
        }

        if(i == 1) {
            if(dic[array[i-1]]!.keys.contains(array[i]) == false) {
                print("\(array[i]) is wrong Key")
                return;
            }
        }
    }

    if(lastString == 0) {
        print(dic[array[0]]!)
    }

    if(lastString == 1) {
        print(dic[array[0]]![array[1]]!)
    }

}

var dictionary: [String: [String: String]] = 
[ 
    "A0001": [
        "Name": "ABC",
        "Age": "20",
        "Branch": "CS"

    ],
    "A0002": [
        "Name": "DEF",
        "Age": "22",
        "Branch": "EC"
    ],
    "A0003": [
        "Name": "XYZ",
        "Age": "23",
        "Branch": "ME"
    ]
]  

var stringOfKeys = "A0001:Name"
dictionaryOfDictionary(dic: dictionary, search: stringOfKeys)