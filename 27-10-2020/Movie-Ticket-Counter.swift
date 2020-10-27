import Foundation

class MovieBooking {

    let audi1: String
    let audi2: String 
    let audi3: String 
    let audi4: String 

    init(audi1: String, audi2: String, audi3: String, audi4: String) {
        self.audi1 = audi1
        self.audi2 = audi2
        self.audi3 = audi3
        self.audi4 = audi4
    }

    func ticketGenerator(selection: [String]) {

        var bill = 0, seatNo = 0
        var seatLetter = ""
        let top = ["A", "B", "C", "D"], middle = ["E", "F", "G", "H"], bottom = ["I", "J", "K", "L"]
        let corners = ["Left", "Right"]

        if(selection[3] == "Yes") {
            bill += 100
        }

        if(selection[2] == "Corner") {
            bill += 50
            if let side = corners.randomElement() {
            if(side == "Left") {
                seatNo = Int.random(in: 1...4)
            } else {
                seatNo = Int.random(in: 13...16)
            }
            }
        } else {
            seatNo = Int.random(in: 5...12)
        }

        if(selection[1] == "Top") {

            if let temp = top.randomElement(){
                seatLetter = temp
            }
            bill += 50
            
        } else if(selection[1] == "Middle") {

            if let temp = middle.randomElement(){
                seatLetter = temp
            }
            bill += 25

        } else {

            if let temp = bottom.randomElement(){
                seatLetter = temp
            }

        }

        let seat = seatLetter + String(seatNo)

        switch(selection[0]) {

            case "Batman": 
                    bill += 300
                    print("Your show is at Audi1, Seat - \(seat) and bill - \(bill)")
            case "Avngers": 
                    bill += 250
                    print("Your show is at Audi2, Seat - \(seat) and bill - \(bill)")
            case "Dhoom": 
                    bill += 170
                    print("Your show is at Audi3, Seat - \(seat) and bill - \(bill)")
            case "Lion King": 
                    bill += 350
                    print("Your show is at Audi4, Seat - \(seat) and bill - \(bill)")
            default:
                print("Error")

        }

    }
    
}

let movieOder = ["Avngers", "Bottom", "Corner", "Yes"]

let movies = MovieBooking(audi1: "Batman", audi2: "Avngers", audi3: "Dhoom", audi4: "Lion King")

movies.ticketGenerator(selection: movieOder)