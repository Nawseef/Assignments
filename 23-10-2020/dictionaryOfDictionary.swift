import Foundation
func dictionaryOfDictionary(dic: [String: Any], search: String) {
    let array = search.components(separatedBy: ":")
    let lastString = array.count - 1
    var newDict: [String: Any] = dic

    for i in 0...lastString {
        if(newDict.keys.contains(array[i])) {
            if let temp = newDict[array[i]] as? [String: Any] { 
                newDict = temp
            } else if(i == lastString) {
                if let temp = newDict[array[i]] {
                    print(temp)
                }
            } else {
                print("\(array[i]) doesn't have a key \(array[i+1])")
                break
            }

        } else {
            print("\(array[i]) is wrong key")
            break
        }
    }
}

var dictionary: [String: Any] = 
[ 
    "A0001": [
        "Name": "ABC",
        "Age": 20,
        "Branch": "CS",
        "Marks": [
            "Chemistry": 83,
            "Maths": 88,
            "English": 90
        ]
    ],
    "A0002": [
        "Name": "DEF",
        "Age": 22,
        "Branch": "EC",
        "Marks": [
            "Chemistry": 76,
            "Maths": 45,
            "English": 55
        ]
    ],
    "A0003": [
        "Name": "XYZ",
        "Age": 23,
        "Branch": "ME",
        "Marks": [
            "Chemistry": 60,
            "Maths": 12,
            "English": 32
        ]
    ]
]  

var stringOfKeys = "A0003:Marks:Maths"
dictionaryOfDictionary(dic: dictionary, search: stringOfKeys)