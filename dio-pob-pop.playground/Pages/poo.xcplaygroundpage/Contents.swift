import UIKit

// Desafio Programacao Orientada a Objetos

class Stock {
    
    let item: String
    let quantity: Int
    var stock = 10
    
    init(item: String, quantity: Int) {
        self.item = item
        self.quantity = quantity
    }
    
    func available() async {
        print("Estoque disponível!")
    }
}

class Sale: Stock {
    
    override func available() async {
        await transaction()
    }
    
    private func transaction() async {
        
        if quantity == stock {
            print("Compra realizada!")
            stock -= quantity
            print("Estoque esgotado.")
        } else if quantity < stock && quantity > 0 {
            print("Compra realizada!")
            stock -= quantity
            print("Estoque disponível: \(stock)")
        } else if quantity > stock {
            print("Compra não finalizada!")
            print("Estoque indisponível. Quantidade limite: \(stock)")
        } else {
            print("Ocorreu um problema! Tente novamente.")
        }
    }
}

let buy = Sale(item: "iPhone", quantity: 1)

Task {
    await buy.available()
}
