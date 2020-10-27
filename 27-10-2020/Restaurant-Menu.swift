import Foundation

class RestarantMenu {

    let sushi: Int
    let noodle: Int 
    let soup: Int 
    let friedChicken: Int 

    init(sushi: Int, noodle: Int, soup: Int, friedChicken: Int) {
        self.sushi = sushi
        self.noodle = noodle
        self.soup = soup
        self.friedChicken = friedChicken
    }

    func generateBill(order: [String: Int]) -> Int{
        var bill = 0

        for (itemName, noOFServings) in order {
            switch(itemName) {
                case "sushi": 
                        bill += (sushi * noOFServings)
                case "noodle": 
                        bill += (noodle * noOFServings)
                case "soup": 
                        bill += (soup * noOFServings)
                case "friedChicken": 
                        bill += (friedChicken * noOFServings)
                default:
                    print("\(itemName) Not a valid order")
            }
        }

        return bill
    }
    
}

var customerOrder = ["sushi": 2, "friedChicken": 1]

var itemPrice = RestarantMenu(sushi: 200, noodle: 125, soup: 80, friedChicken: 99)

let customerBill = itemPrice.generateBill(order: customerOrder)
print("Your bill is - \(customerBill)")