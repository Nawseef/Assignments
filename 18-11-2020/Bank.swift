import Foundation

protocol BankProtocol {
    func sendNumberofAccounts() -> Int
}

class Bank {

    let name: String
    let ifscCode: String
    let location: String
    var accManager = [BankProtocol]()
    lazy var noOfAccount = 0
    
    init(name: String, ifscCode: String, location: String)
    {
        self.name = name
        self.ifscCode = ifscCode
        self.location = location
    }

    func addAccountManager(accountManager: AccountManager) {
        self.accManager.append(accountManager)
    }

    func recieveNumberofAccounts() {
        for manager in accManager {
            noOfAccount += manager.sendNumberofAccounts()
        }
    }

}

class AccountManager {

    let name: String
    var accounts = [String: Account]()    //[Account Number: instance Name]

    init(name: String) {
        self.name = name
    }

    func addAccount(account: Account) {
        self.accounts[account.accountNumber] = account
    }

    func currentBalance(accountNumber: String) {
        for (key, _) in accounts {
            if(key == accountNumber) {

                if let account = accounts[key] {
                    print(account.balance)
                    return;
                }
            } 
        }
        print("Wrong Account Number")
    }

    func accountDetails(accountNumber: String) {
        for (key, _) in accounts {
            if(key == accountNumber) {

                if let account = accounts[key] {
                    print(account.accountHolderName)
                    if let mailId = account.email {
                        print(mailId)
                    }
                    if let phone = account.phoneNumber {
                        print(phone)
                    }
                    return;
                }

            } 
        }
        print("Wrong Account Number")
    }

    func accountSummary(accountNumber: String) {
        for (key, _) in accounts {
            if(key == accountNumber) {

                if let account = accounts[key] {
                    print(account.statements)
                    return;
                }

            } 
        }
        print("Wrong Account Number")
    }

}

extension AccountManager: BankProtocol {
    func sendNumberofAccounts() -> Int {
        return self.accounts.count
    }
}

class Account {

    let accountHolderName: String
    let email: String?
    let phoneNumber: String?
    weak var bank: Bank?

    var balance: Float = 0.0
    var isDeposit = false, isWihdraw = false
    var statements = [String]()
    static var startingIndex = 100000000
    var accountNumber = ""

    init(accountHolderName: String, initialDesposit: Float, email: String?, phoneNumber: String?, bank: Bank) {
        self.accountHolderName = accountHolderName
        self.email = email
        self.phoneNumber = phoneNumber
        self.bank = bank
        self.balance = initialDesposit
        statements.append("\(initialDesposit) credited")
    }

    func generateAccountNumber() {
        Account.startingIndex += 1
        var ifsc = ""
        if let temp = bank {
            ifsc = temp.ifscCode
        }
        self.accountNumber = ifsc.suffix(4) + String (Account.startingIndex)
    }

    func deposit(amount: Float) {

        if(isDeposit) {

            balance += amount
            print("Amount of \(amount) is credited to your account \(self.accountNumber), balance: \(balance)")
            
            if(statements.count < 10) {
                statements.append("\(amount) credited")
            } else {
                statements.removeFirst()
            }

        } else {
            print("Deposit is not allowed in this account")
        }

    }

    func wihdraw(amount: Float) {
        if(isWihdraw) {

            if(balance >= amount) {

                balance -= amount
                print("Amount of \(amount) is dedited from your account \(self.accountNumber), balance: \(balance)")

                if(statements.count < 10) {
                statements.append("\(amount) dedited")
                } else {
                    statements.removeFirst()
                }

            } else {
                print("Insufficient Funds")
            }

        } else {
            print("Withdraw is not allowed in this account")
        }
    }

}

enum CasaAccountType {
    case savings, current
}

class CasaAccount: Account {

    let myType: CasaAccountType
    let rateOFInterest: Float = 0.08               //8%

    init(accountHolderName: String, initialDesposit: Float, email: String?, phoneNumber: String?, bank: Bank, myType: CasaAccountType) {
        self.myType = myType

        super.init(accountHolderName: accountHolderName, initialDesposit: initialDesposit, email: email, phoneNumber: phoneNumber, bank: bank)
        super.generateAccountNumber()
        self.assignType()
    }

    func assignType() {
        switch myType {
            case .savings:
                    isDeposit = true
                    isWihdraw = true
            case .current:
                    isDeposit = true
                    isWihdraw = true
        }
    }

    func accureInterest() -> Float {
        return (balance	* (balance * rateOFInterest/365))
    }

}

enum DepositAccountType {
    case fixed, recurring
}

class DepositAccount: Account {

    let myType: DepositAccountType
    let rateOFInterest: Float = 0.06
    var termOfDeposit: Float

    init(accountHolderName: String, initialDesposit: Float, email: String?, phoneNumber: String, bank: Bank, myType: DepositAccountType, termOfDeposit: Float) {
        self.myType = myType
        self.termOfDeposit = termOfDeposit

        super.init(accountHolderName: accountHolderName, initialDesposit: initialDesposit, email: email, phoneNumber: phoneNumber, bank: bank)
        super.generateAccountNumber()
        self.assignType()
    }

    func assignType() {
        switch myType {
            case .fixed:
                    isDeposit = false
                    isWihdraw = false
            case .recurring:
                    isDeposit = true
                    isWihdraw = false
        }
    }

    func accureInterest() -> Float {
        return (balance	+ balance *	rateOFInterest * termOfDeposit)
    }

}

enum LoanAccountType {
    case homeLoan, vehicleLoan, personalLoan
}

class LoanAccount: Account {

    let myType: LoanAccountType
    let rateOFInterest: Float = 0.04

    init(accountHolderName: String, initialDesposit: Float, email: String?, phoneNumber: String?, bank: Bank, myType: LoanAccountType) {
        self.myType = myType

        super.init(accountHolderName: accountHolderName, initialDesposit: initialDesposit, email: email, phoneNumber: phoneNumber, bank: bank)
        super.generateAccountNumber()
        self.assignType()
    }

    func assignType() {
        switch myType {
            case .homeLoan:
                    isDeposit = true
                    isWihdraw = false
            case .vehicleLoan:
                    isDeposit = true
                    isWihdraw = false
            case .personalLoan:
                    isDeposit = true
                    isWihdraw = false
        }
    }

    func accureInterest() -> Float {
        return (balance	* (balance * rateOFInterest/365))
    }

}

enum Service {
        case deposit, wihdraw, balanceCheck, statementCheck
    }

class BankOperations {

    var requests = [(Account, Service, Float)]()

    func enqueue(account: Account, service: Service, amount: Float = 0.0) {
        requests.append((account, service, amount))
    }

    func dequeue() {

        if requests.isEmpty {
            print("no items")
        } else {
            requests.removeFirst()
        }

    }

    func operate() {

        if(requests.count>0) {

            for i in 0..<requests.count {
            
                let account = requests[i].0
                let service = requests[i].1
                let amount = requests[i].2

                switch service {
                    case .deposit: 
                            account.deposit(amount: amount)
                    case .wihdraw: 
                            account.wihdraw(amount: amount)
                    case .balanceCheck: 
                            print(account.balance)
                    case .statementCheck: 
                            print(account.statements)
                }

            }

            for _ in 0..<requests.count {
                dequeue()
            }

            print("Operation completed")

        } else {
            print("No requests remaining")
        }

    }
}

let vijaya = Bank(name: "Vijaya Bank", ifscCode: "VIJB0001436", location: "Mangalore")

let accManager = AccountManager(name: "Roy")
vijaya.addAccountManager(accountManager: accManager)


let acc1 = CasaAccount(accountHolderName: "Suresh", initialDesposit: 5000, email: nil, phoneNumber: nil, bank: vijaya, myType: .savings)
let acc2 = CasaAccount(accountHolderName: "Adil", initialDesposit: 10000, email: "adil@gmail.com", phoneNumber: nil, bank: vijaya, myType: .current)
let acc3 = DepositAccount(accountHolderName: "Ganesh", initialDesposit: 500, email: nil, phoneNumber: "990043", bank: vijaya, myType: .fixed, termOfDeposit: 4)
let acc4 = DepositAccount(accountHolderName: "Sara", initialDesposit: 6000, email: "sara@gmail.com", phoneNumber: "995083", bank: vijaya, myType: .recurring, termOfDeposit: 3)
let acc5 = LoanAccount(accountHolderName: "Adrian", initialDesposit: 15000, email: nil, phoneNumber: nil, bank: vijaya, myType: .personalLoan)
let acc6 = LoanAccount(accountHolderName: "Arjun", initialDesposit: 7000, email: "arjun@gmail.com", phoneNumber: "948944", bank: vijaya, myType: .homeLoan)

accManager.addAccount(account: acc1)
accManager.addAccount(account: acc2)
accManager.addAccount(account: acc3)
accManager.addAccount(account: acc4)
accManager.addAccount(account: acc5)
accManager.addAccount(account: acc6)

print(acc1.accountNumber)
print("----------------------------------------------------------------------------")

var requestQueue = BankOperations()

requestQueue.enqueue(account: acc1, service: .balanceCheck)
requestQueue.enqueue(account: acc1, service: .deposit, amount: 5000)
requestQueue.enqueue(account: acc2, service: .deposit, amount: 6000)
requestQueue.enqueue(account: acc2, service: .balanceCheck)
requestQueue.enqueue(account: acc1, service: .wihdraw, amount: 2000)
requestQueue.enqueue(account: acc1, service: .balanceCheck)
requestQueue.enqueue(account: acc1, service: .statementCheck)
requestQueue.enqueue(account: acc3, service: .deposit, amount: 10000)


requestQueue.operate()
print("----------------------------------------------------------------------------")
requestQueue.operate()
print("----------------------------------------------------------------------------")
requestQueue.operate()
print("----------------------------------------------------------------------------")


accManager.currentBalance(accountNumber: "1436100000002")
accManager.accountDetails(accountNumber: "1436100000002")
accManager.accountSummary(accountNumber: "1436100000002")

