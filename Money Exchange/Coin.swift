//
//  Coin.swift
//  Money Exchange
//
//  Created by Stefan Korolchuk on 3/11/18.
//  Copyright © 2018 DAM. All rights reserved.
//

import Foundation

class Coin{
    private var keyCoin: String
    private var valueCoin: Double
    init(keyCoin: String, valueCoin: Double) {
        self.keyCoin = keyCoin
        self.valueCoin = valueCoin
    }
    
    func getKeyCoin() -> String{
        return keyCoin
    }
    
    func getValueCoin() -> Double {
        return valueCoin
    }
    
    func setKeyCoin(keyCoin: String) {
        self.keyCoin = keyCoin
    }
    
    func setValueCoin(valueCoin: Double) {
        self.valueCoin = valueCoin
    }
}
