import Foundation

// Programacao Orientada a Protocolos

protocol Stock {
    
    var item: String { get }
    var quantity: Int { get }
}

protocol Characteristics {
    var color: String { get }
}

struct Sale: Stock, Characteristics {
    let item: String
    let quantity: Int
    let color: String
    var stock = 10
    
    func transaction() async {
        if quantity == stock {
            print("Compra realizada!")
            print("Estoque esgotado.")
        } else if quantity < stock && quantity > 0 {
            print("Compra realizada!")
            print("Estoque disponível: \(quantityAvailable)")
        } else if quantity > stock {
            print("Compra não finalizada!")
            print("Estoque indisponível. Quantidade limite: \(stock)")
        } else {
            print("Ocorreu um problema! Tente novamente.")
        }
    }
}

extension Sale {
    var quantityAvailable: Int {
        stock - quantity
    }

}

let buy = Sale(item: "iPhone", quantity: 106, color: "black")

Task{
    await buy.transaction()
}
