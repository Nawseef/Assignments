import Foundation

class Car {

    let maxSpeed: Int
    let color: String 
    let fuelType: String 
    let noOfSeats: Int 

    init(maxSpeed: Int, color: String, fuelType: String, noOfSeats: Int) {
        self.maxSpeed = maxSpeed
        self.color = color
        self.fuelType = fuelType
        self.noOfSeats = noOfSeats
    }

    func speedDifference(difference: Int) -> Int {
        return (maxSpeed - difference)
    }

    func remainingSeat(occupiedSeat: Int) -> Int{
        return (noOfSeats - occupiedSeat)
    }
}

var speedDifference = 40, seatsTaken = 4

var carDetails = Car(maxSpeed: 120, color: "Black", fuelType: "Petrol", noOfSeats: 7)

let speed = carDetails.speedDifference(difference: speedDifference)
print("The car is moving at \(speed)")

let availableSeats = carDetails.remainingSeat(occupiedSeat: seatsTaken)
print("The remaining seats are \(availableSeats) out of \(carDetails.noOfSeats)")