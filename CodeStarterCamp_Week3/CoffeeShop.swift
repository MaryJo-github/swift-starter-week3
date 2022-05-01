//
//  CoffeeShop.swift
//  CodeStarterCamp_Week3
//
//  Created by 황지웅 on 2022/04/26.
//

import Foundation

class CoffeeShop {
    private var barista: Barista? = nil
    private var coffeeMenu: CoffeeMenu = CoffeeMenu(coffeeListsInShop: [.americano: 3000, .caffeelatte: 4000, .deCaffeine: 5000, .espresso: 1500])
    private var salesMoney: Int
    private var pickUpTable: PickUpTable = PickUpTable()
    
    init() {
        salesMoney = 0
    }
    
    func hireBarista(barista: Barista) {
        self.barista = barista
        self.barista?.getJob(coffeeShop: self)
    }
    
    func depositMoney(coffeePrice: Int) {
        salesMoney += coffeePrice
    }
    
    func insertOrderToPickUpTable(orderMan: String, coffee: Coffee) {
        pickUpTable.insertOrderToPickUpTable(name: orderMan, coffee: coffee)
    }
    
    func getPriceOfCoffeeFromMenu(coffee: Coffee) -> Int? {
        return coffeeMenu.getPriceOfCoffee(coffee: coffee)
    }
    
    func order(coffee: Coffee) {
        guard let coffeePrice = getPriceOfCoffeeFromMenu(coffee: coffee) else {
            print("존재하지 않는 커피 메뉴입니다.")
            return
        }
        
        depositMoney(coffeePrice: coffeePrice)
        barista?.makeCoffeeOrderFromShop(coffee: coffee)
    }
}

extension CoffeeShop: Shop {
    func insertCoffeeToPickUpTable(coffee: Coffee) {
        pickUpTable.releasePickUpTable(coffee: coffee)
    }
}
