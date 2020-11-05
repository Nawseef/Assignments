import Foundation

class Details {

    let name: String
    let address: String
    let phoneNumber: Int

    init(name: String, address: String, phoneNumber: Int) {
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
    }

}

class Human {

    let details: Details
    var age: Int
    let dob: String
    let gender: String

    init(details: Details, age: Int, dob: String, gender: String) { 
        self.details = details
        self.age = age
        self.dob = dob
        self.gender = gender
    }

}

class University {

    let details: Details
    var colleges = [College]()
    var noOfColleges: Int {
        return colleges.count
    }

    init(details: Details) {
        self.details = details
    }
 
    func examDates() {
        //create a timeTable for all sunbject of every year
    }
}

class College {

    let details: Details
    let belongsTo: University
    var branches = [Branch]()
    var noOfStudents = 0
    

    init(details: Details, belongsTo: University) {
        self.details = details
        self.belongsTo = belongsTo
        // self.noOfEmployees = noOfEmployees
        //self.branches = branches

        belongsTo.colleges.append(self)
    }

    func admitStudent(branchName: Branch, student: Student) {
        branchName.studentsInfo.append(student)
        noOfStudents += 1
    }

    func collectFees() {
        //collect fees from students yearly
        //collect fees for college programs
    }

}

class Branch {

    let name: String
    let belongsTo: College
    var noOfStudents: Int {
        return studentsInfo.count
    }
    var studentsInfo: [Student]
    var studentMarks: [String: [String: Int]]

    init(name: String, belongsTo: College) {
        self.name = name
        self.belongsTo = belongsTo
        self.studentsInfo = [Student]()
        studentMarks = [String: [String: Int]]()

        belongsTo.branches.append(self)
    }

    func calculateCGPA(studentUSN: String) -> Float {
        var totalMarks: Float = 0.0

        if let tempDictionary = self.studentMarks[studentUSN] {
            for (subjectName, _) in tempDictionary {

                if let tempMarks = tempDictionary[subjectName] {
                    totalMarks += Float (tempMarks)
                } else {
                    print("No Entry Exists")
                    return 0.0
                }

            }
        } else {
            print("No Entry Exists")
            return 0.0
        }

        let cgpa = (totalMarks/40)
        return (Float (round(100 * cgpa) / 100))
    }

    func conductExam() {
        //internal exams
    }

    func internalResult() {
        //display result of each student
    }
}

class Student: Human {

    let usn: String
    let college: College
    let branch: Branch
    var yearOfStudy: Int
    var myCGPA: Float {
        return self.branch.calculateCGPA(studentUSN: self.usn)
    }

    init(details: Details, age: Int, dob: String, gender: String, usn: String, college: College, branch: Branch, yearOfStudy: Int) {
        self.usn = usn
        self.college = college
        self.branch = branch
        self.yearOfStudy = yearOfStudy

        super.init(details: details, age: age, dob: dob, gender: gender)

        college.admitStudent(branchName: branch, student: self)
    }

    func study() {
        //prepare for internal
        //prepare for external
    }

    func projects() {
        //complete project for particular semester
    }

}

var vtu = University(details: Details(name: "VTU", address: "Belgavi", phoneNumber: 9123))

var mite = College(details: Details(name: "MITE", address: "Mangalore", phoneNumber: 9922), belongsTo: vtu)

var canara = College(details: Details(name: "Canara Engineering College", address: "Mangalore", phoneNumber: 9872), belongsTo: vtu)

var cse = Branch(name: "Computer Science & Engineering", belongsTo: mite)
var me = Branch(name: "Mechanical Engineering", belongsTo: mite)
var ise = Branch(name: "Information Science & Engineering", belongsTo: mite)

var cse001 = Student(details: Details(name: "Abhishek", address: "Mangalore", phoneNumber: 9900), age: 20, dob: "25-09-2000", gender: "Male", usn: "CSE001", college: mite, branch: cse, yearOfStudy: 2)
var cse002 = Student(details: Details(name: "Altaf", address: "Mangalore", phoneNumber: 9901), age: 20, dob: "24-10-2000", gender: "Male", usn: "CSE002", college: mite, branch: cse, yearOfStudy: 2)
var cse003 = Student(details: Details(name: "Arun", address: "Mangalore", phoneNumber: 9903), age: 20, dob: "05-03-2000", gender: "Male", usn: "CSE003", college: mite, branch: cse, yearOfStudy: 2)

var me001 = Student(details: Details(name: "Adil", address: "Mangalore", phoneNumber: 9904), age: 20, dob: "15-08-2000", gender: "Male", usn: "ME001", college: mite, branch: me, yearOfStudy: 2)
var me002 = Student(details: Details(name: "Chirag", address: "Mangalore", phoneNumber: 9905), age: 20, dob: "01-05-2000", gender: "Male", usn: "ME002", college: mite, branch: me, yearOfStudy: 2)
var me003 = Student(details: Details(name: "Dedin", address: "Mangalore", phoneNumber: 9906), age: 20, dob: "06-06-2000", gender: "Male", usn: "ME003", college: mite, branch: me, yearOfStudy: 2)

var ise001 = Student(details: Details(name: "Adrian", address: "Mangalore", phoneNumber: 9907), age: 20, dob: "30-09-2000", gender: "Male", usn: "ISE001", college: mite, branch: ise, yearOfStudy: 2)
var ise002 = Student(details: Details(name: "Amal", address: "Mangalore", phoneNumber: 9908), age: 20, dob: "10-10-2000", gender: "Male", usn: "ISE002", college: mite, branch: ise, yearOfStudy: 2)
var ise003 = Student(details: Details(name: "Arun", address: "Mangalore", phoneNumber: 9903), age: 20, dob: "09-01-2000", gender: "Male", usn: "ISE003", college: mite, branch: ise, yearOfStudy: 2)

cse.studentMarks = [
                    "CSE001": [
                                "Maths": 78,
                                "Python": 65,
                                "Java": 74,
                                "Basics of C": 79
                              ],
                    "CSE002": [
                                "Maths": 55,
                                "Python": 98,
                                "Java": 45,
                                "Basics of C": 98,
                              ],
                    "CSE003": [
                                "Maths": 66,
                                "Python": 67,
                                "Java": 83,
                                "Basics of C": 79
                              ]
                   ]

me.studentMarks = [
                    "ME001": [
                                "Maths": 58,
                                "Thermodynamics": 95,
                                "Hydraulics": 449,
                                "AVG": 77
                              ],
                    "CSE002": [
                                "Maths": 87,
                                "Thermodynamics": 87,
                                "Hydraulics": 75,
                                "AVG": 90,
                              ],
                    "CSE003": [
                                "Maths": 73,
                                "Thermodynamics": 50,
                                "Hydraulics": 73,
                                "AVG": 80
                              ]
                   ]

ise.studentMarks = [
                    "ISE001": [
                                "Maths": 98,
                                "Python": 97,
                                "File System": 93,
                                "Basics of C": 90
                              ],
                    "ISE002": [
                                "Maths": 55,
                                "Python": 42,
                                "File System": 45,
                                "Basics of C": 67,
                              ],
                    "ISE003": [
                                "Maths": 76,
                                "Python": 67,
                                "File System": 55,
                                "Basics of C": 40
                              ]
                   ]

print("All Colleges in VTU:")
for college in vtu.colleges {
    print("--\(college.details.name)")
}
print("")

print("All Branches in MITE:")
for branch in mite.branches {
    print("--\(branch.name)")
}
print("")

print("No. of Student in MITE are \(mite.noOfStudents)")
for branch in mite.branches {
    print("--Students in \(branch.name) are \(branch.noOfStudents)")
    for student in branch.studentsInfo {
        print("----\(student.usn) - \(student.details.name) - year:\(student.yearOfStudy)")
    }
    print("")
}
print("")

print("CGPA of all CSE Studetns")
for student in cse.studentsInfo {
    let cgpa = cse.calculateCGPA(studentUSN: student.usn)
    print("--\(student.usn): \(cgpa)")
}
print("")

print(cse003.myCGPA)