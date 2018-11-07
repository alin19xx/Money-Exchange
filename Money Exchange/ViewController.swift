//
//  ViewController.swift
//  Money Exchange
//
//  Created by DAM on 31/10/2018.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
 
    //Variable del pickerView
    @IBOutlet weak var pickerView: UIPickerView!
    //Input donde se pone la cantidad
    @IBOutlet weak var inputAmount: UITextField!
    //Label que tiene que mostrar
    //
    //
    //Variable btnConvert
    @IBOutlet weak var btnConvert: RoundButton!
    //Label info conversion
    @IBOutlet weak var textInfo: UILabel!
    //Boton next fotos
    @IBOutlet weak var btnNext: RoundButton!
    //Boton previous fotos
    @IBOutlet weak var btnPrev: RoundButton!
    var contador = 1
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var imagBack: UIImageView!
    @IBOutlet weak var labelCoinValue: UILabel!
    var arrayCoins:[Coin] = []
    
    //Metodo para establecer el numero de columnas
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    //Metodo para establecer el numero de lineas de los pickerViews
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayCoins.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayCoins[row].getKeyCoin()
    }
    //Metodo para mostrar las keys de cada moneda
    private func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return textInfo.text = ""
    }
    
    /* CODIGO PARA GUARDAR LA INFO DEL PICKERVIEW EN LABEL
    let dictCoins = self.dictCoins[0][textInfo.selectedRowInComponent(0)]
    
    
    */

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let eur = Coin(keyCoin: "EUR", valueCoin: 1)
        arrayCoins.append(eur)
        let usd = Coin(keyCoin: "USD", valueCoin: 1.14)
        arrayCoins.append(usd)
        let btc = Coin(keyCoin: "BTC", valueCoin: 0.0002)
        arrayCoins.append(btc)
        let eth = Coin(keyCoin: "ETH", valueCoin: 0.01)
        arrayCoins.append(eth)
        let xrp = Coin(keyCoin: "XRP", valueCoin: 2.49)
        arrayCoins.append(xrp)
        let ltc = Coin(keyCoin: "LTC", valueCoin: 0.022)
        arrayCoins.append(ltc)
    }
    
    @IBAction func next(_ sender: Any) {
        
        contador += 1
        if(contador == 7){
           contador = 0
        }
        desplazar()
    }
    
    @IBAction func previous(_ sender: Any) {
        contador -= 1
        if(contador == 1){
            contador = 6
        }
        desplazar()
    }
    
    
    
    func desplazar() {
        
        switch contador {
        case 1:
           labelCoinValue.text = "\(arrayCoins[0].getValueCoin())"
            imageFlag.image = UIImage(named: "euro.jpeg")
            imagBack.image = UIImage(named: "eurBack.jpg")
        case 2:
             labelCoinValue.text = "\(arrayCoins[1].getValueCoin())"
            imageFlag.image = UIImage(named: "dolar.jpg")
            imagBack.image = UIImage(named: "usdBack")
        case 3:
             labelCoinValue.text = "\(arrayCoins[2].getValueCoin())"
            imageFlag.image = UIImage(named: "bitcoin.jpg")
            imagBack.image = UIImage(named: "btcBack")
        case 4:
            labelCoinValue.text = "\(arrayCoins[3].getValueCoin())"
            imageFlag.image = UIImage(named: "ethereum.png")
            imagBack.image = UIImage(named: "ethBack.jpg")
        case 5:
              labelCoinValue.text = "\(arrayCoins[4].getValueCoin())"
            imageFlag.image = UIImage(named: "ripple.jpg")
            imagBack.image = UIImage(named: "xrpBack.jpg")
        case 6:
              labelCoinValue.text = "\(arrayCoins[5].getValueCoin())"
            imageFlag.image = UIImage(named: "litecoin.jpg")
            imagBack.image = UIImage(named: "ltcBack.jpg")
        default:
            print("Error 404")
        }
    
}
}
