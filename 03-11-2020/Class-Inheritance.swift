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

    func leaveProcedure() {
        //write a email for leave 
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
    var noOfEmployees: Int
    var noOfStudents: Int
    var branches = [String]()

    init(details: Details, belongsTo: University, noOfEmployees: Int, noOfStudents: Int, branches: [String]) {
        self.details = details
        self.belongsTo = belongsTo
        self.noOfEmployees = noOfEmployees
        self.noOfStudents = noOfStudents
        self.branches = branches
        
        belongsTo.colleges.append(self)
    }

    func admitStudent() {
        //admit new student to some branch
    }

    func payEmployees() {
        //pay all working Employees
    }

    func collectFees() {
        //collect fees from students yearly
        //collect fees for college programs
    }

    func timeTable() {
        //create time table for particular branch
        //create time table for exams
    }

}

class Student: Human {

    let usn: String
    var subjects = [String]()
    var yearOfStudy: Int

    init(details: Details, age: Int, dob: String, gender: String, usn: String, subjects: [String], yearOfStudy: Int) {
        self.usn = usn
        self.subjects = subjects
        self.yearOfStudy = yearOfStudy

        super.init(details: details, age: age, dob: dob, gender: gender)
    }
    
    func myAttendnace(staffName: TeachingStaff, subjectName: String) -> Double {
        var takenClass: Double = 0.0
        var attendedClass: Double = 0.0
        if let temp = staffName.subjectsTaken[subjectName] {
            takenClass = Double (temp)
        } else {
            print("Wrong entry")
        }

        if let temporaryDictionary = staffName.studentAttendance[self.usn] {
            if let temp = temporaryDictionary[subjectName] {
                attendedClass = Double (temp)
            }
        } else {
            print("Wrong entry")
        }

        return ((attendedClass/takenClass) * 100)
    }

    func study() {
        //prepare for internal
        //prepare for external
    }

    func projects() {
        //complete project for particular semester
    }

}

class Employee : Human {

    let empID : Int
    let qualification: String
    let workHours: Float

    init(details: Details, age: Int, dob: String, gender: String, empID: Int, qualification: String, workHours: Float) {
        self.empID = empID
        self.qualification = qualification
        self.workHours = workHours

        super.init(details: details, age: age, dob: dob, gender: gender)
    }

}

class Branch {

    let name: String
    let facultyInfo: [String: String]
    let noOfStudents: [Int: Int]

    init(name: String, facultyInfo: [String: String], noOfStudents: [Int: Int]) {
        self.name = name
        self.facultyInfo = facultyInfo
        self.noOfStudents = noOfStudents
    }

    func conductExam() {
        //internal exams
    }

    func internalResult() {
        //display result of each student
    }
}

class TeachingStaff: Employee {

    let branch: String
    var designation: String
    var subjectsTaken: [String: Int]
    var studentAttendance: [String: [String: Int]]

    init(details: Details, age: Int, dob: String, gender: String, empID: Int, qualification: String, workHours: Float, branch: String, designation: String, subjectsTaken: [String: Int], studentAttendance: [String: [String: Int]]) {
      self.branch = branch
      self.designation = designation
      self.subjectsTaken = subjectsTaken
      self.studentAttendance = studentAttendance

      super.init(details: details, age: age, dob: dob, gender: gender, empID: empID, qualification: qualification, workHours: workHours)
    }

    func takeClass() {
        //teach student of particular year
        //take suprise tests
    }

    func createQuestionPaper() {
        //create Question Paper for subjects taken
    }
    
}


class Guard: Employee {

    let shift: String
    let areaToGuard: String

    init(details: Details, age: Int, dob: String, gender: String, empID: Int, qualification: String, workHours: Float, shift: String, areaToGuard: String) {
        self.shift = shift
        self.areaToGuard = areaToGuard

        super.init(details: details, age: age, dob: dob, gender: gender, empID: empID, qualification: qualification, workHours: workHours)
    }

    func checkID() {
        //Check ID's of everyone entering the premises
    }

    func vehicleEntry() {
        //Enter log of vehicle number and time 
    }

}

var vtu = University(details: Details(name: "VTU", address: "Belgavi", phoneNumber: 9123))

var mite = College(details: Details(name: "MITE", address: "Mangalore", phoneNumber: 9922), belongsTo: vtu, noOfEmployees: 56, noOfStudents: 980, branches: ["CSE", "ECE", "ME"])

var canara = College(details: Details(name: "Canara Engineering College", address: "Mangalore", phoneNumber: 9872), belongsTo: vtu, noOfEmployees: 66, noOfStudents: 1020, branches: ["CSE", "ECE", "ME"])

var staff1 = TeachingStaff(details: Details(name: "Ashok", address: "Mangalore", phoneNumber: 9988), age: 34, dob: "25-09-1986", gender: "Male", empID: 0228, qualification: "M.Tech", workHours: 8.5, branch: "CSE", designation: "Assistant Professor", subjectsTaken: ["Chem": 8, "Phy": 9], studentAttendance: ["A001": ["Chem": 6, "Phy": 3]])

var student1 = Student(details: Details(name: "Abhishek", address: "Mangalore", phoneNumber: 9900), age: 20, dob: "25-09-2000", gender: "Male", usn: "A001", subjects: ["Chem", "Phy"], yearOfStudy: 2)

print(student1.myAttendnace(staffName: staff1, subjectName: "Chem"))
print(vtu.colleges[1].details.name)