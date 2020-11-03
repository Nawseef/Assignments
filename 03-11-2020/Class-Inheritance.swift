class Details {

    let name: String
    let address: String
    let phoneNumber: Int

}

class Human: Details {

    var age: Int
    let gender: String

    func leaveProcedure() {
        //write a email for leave 
    }

}

class College: Details {

    var noOfEmployees: Int
    var noOfStudents: Int
    let allBranches = [String]()

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
    let subjects = [String]()
    var yearOfStudy: Int

    func study() {
        //prepare for internal
        //prepare for external
    }

    func projects() {
        //complete project for particular semester
    }

}

class Staff: Human {

    private let branch: String
    private subjectsTaken: [String: Int]
    let qualification: String
    let workHours: Int

    private func takeClass() {
        //teach student of particular year
        //take suprise tests
    }

    private func createQuestionPaper() {
        //create Question Paper for subjects taken
    }
    
}

class Guard: Staff {

    let shift: String
    let areaToGuard: String

    func checkID() {
        //Check ID's of everyone entering the premises
    }

    func vehicleEntry() {
        //Enter log of vehicle number and time 
    }

}





