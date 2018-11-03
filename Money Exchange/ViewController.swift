//
//  ViewController.swift
//  Money Exchange
//
//  Created by DAM on 31/10/2018.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit

var eur = Coin(keyCoin: "EUR", valueCoin: 1)
var usd = Coin(keyCoin: "USD", valueCoin: 1.14)
var btc = Coin(keyCoin: "BTC", valueCoin: 0.0002)
var eth = Coin(keyCoin: "ETH", valueCoin: 0.01)
var xrp = Coin(keyCoin: "XRP", valueCoin: 2.49)
var ltc = Coin(keyCoin: "LTC", valueCoin: 0.022)

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //Variable del pickerView
    @IBOutlet weak var pickerView: UIPickerView!
    //Input donde se pone la cantidad
    @IBOutlet weak var inputAmount: UITextField!
    //Label que tiene que mostrar
    //
    //
    @IBOutlet weak var textInfo: UILabel!
    //
    
    
    //Creamos el diccionario de monedas
    let dictCoins:[(key: String, value: Double)] = [(eur.getKeyCoin(), eur.getValueCoin()),(usd.getKeyCoin(), usd.getValueCoin()),(btc.getKeyCoin(), btc.getValueCoin()),(eth.getKeyCoin(), eth.getValueCoin()),(xrp.getKeyCoin(), xrp.getValueCoin()),(ltc.getKeyCoin(), ltc.getValueCoin())]
    //Metodo para establecer el numero de columnas
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //Metodo para establecer el numero de lineas de los pickerViews
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dictCoins.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dictCoins[row].key
    }
    //Metodo para mostrar las keys de cada moneda
    private func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return textInfo.text = dictCoins[row].key
    }
    
    /* CODIGO PARA GUARDAR LA INFO DEL PICKERVIEW EN LABEL
    let dictCoins = self.dictCoins[0][textInfo.selectedRowInComponent(0)]
    
    
    */

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }


}

