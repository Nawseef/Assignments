func arrayOfDictionary(dic: [[String: String]]) -> [String] {
    var list = [String]()

    for (i, _) in dic.enumerated() {

            for values in dic[i].values {
                list += [values]
            }
            
    }

    return list
}


var dictionary = 
[ 
    [
        "Name": "ABC",
        "Age": "20",
        "Branch": "CS"
    ],
    [
        "Name": "DEF",
        "Age": "22",
        "Branch": "EC"
    ],
    [
        "Name": "XYZ",
        "Age": "23",
        "Branch": "ME"
    ]
]    
print(arrayOfDictionary(dic: dictionary))