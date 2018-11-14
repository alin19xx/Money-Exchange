//
//  ViewController.swift
//  Money Exchange
//
//  Created by DAM on 31/10/2018.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit


var arrayCoins:[Coin] = []
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
    var counter = 1
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var imagBack: UIImageView!
    @IBOutlet weak var labelCoinValue: UILabel!
    
    var pos1 = ""
    var pos2 = ""
    var value1 = 0
    var value2 = 0
    
    @IBOutlet weak var btnHack: UIButton!
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pos1 = arrayCoins[pickerView.selectedRow(inComponent: 0)].getKeyCoin()
        pos2 = arrayCoins[pickerView.selectedRow(inComponent: 1)].getKeyCoin()
        if(component == 0){
            value1 = row
        }else if(component == 1){
            value2 = row
        }
        
    }
    
    @IBAction func convert(_ sender: Any) {
        //Comprobacion de si funciona el pickerView
        print(pos1)
        print(pos2)
        print(value1)
        print(value2)
        //Le decimos que si no puede castarlo que el ponga un 0
        let valor:Double = Double(inputAmount.text ?? "0") ?? 0
        //Cogemos el valor de la moneda del componente 1 y del componente 2
        let a = arrayCoins[value1].getValueCoin()
        let b = arrayCoins[value2].getValueCoin()
        let conversion:Double = (valor * b) / a
        textInfo.text = String(conversion) + "€"
        if(valor == 999){
            btnHack.isHidden = false
        }
    }

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
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(0, inComponent: 1, animated: true)
        counter = 1
        btnHack.isHidden = true
        labelCoinValue.text = "Valor \(arrayCoins[0].getKeyCoin()) : \(arrayCoins[0].getValueCoin())"
    }
    
    @IBAction func next(_ sender: Any) {
       
        counter += 1
         if(counter == 7){
           counter = 1
        }
        slide()
    }
    
    @IBAction func previous(_ sender: Any) {
        counter -= 1
        if(counter == 0){
            counter = 6
        }
        slide()
    }
    
    
    
    func slide() {
        
        switch counter {
        case 1:
            labelCoinValue.text = "Valor \(arrayCoins[0].getKeyCoin()) : \(arrayCoins[0].getValueCoin())"
            imageFlag.image = UIImage(named: "euro.jpeg")
            imagBack.image = UIImage(named: "eurBack.jpg")
        case 2:
             labelCoinValue.text = "Valor \(arrayCoins[1].getKeyCoin()) : \(arrayCoins[1].getValueCoin())"
            imageFlag.image = UIImage(named: "dolar.jpg")
            imagBack.image = UIImage(named: "usdBack")
        case 3:
             labelCoinValue.text = "Valor \(arrayCoins[2].getKeyCoin()) : \(arrayCoins[2].getValueCoin())"
            imageFlag.image = UIImage(named: "bitcoin.jpg")
            imagBack.image = UIImage(named: "btcBack")
        case 4:
            labelCoinValue.text = "Valor \(arrayCoins[3].getKeyCoin()) : \(arrayCoins[3].getValueCoin())"
            imageFlag.image = UIImage(named: "ethereum.png")
            imagBack.image = UIImage(named: "ethBack.jpg")
        case 5:
              labelCoinValue.text = "Valor \(arrayCoins[4].getKeyCoin()) : \(arrayCoins[4].getValueCoin())"
            imageFlag.image = UIImage(named: "ripple.jpg")
            imagBack.image = UIImage(named: "xrpBack.jpg")
        case 6:
              labelCoinValue.text = "Valor \(arrayCoins[5].getKeyCoin()) : \(arrayCoins[5].getValueCoin())"
            imageFlag.image = UIImage(named: "litecoin.jpg")
            imagBack.image = UIImage(named: "ltcBack.jpg")
        default:
            print("Error 404")
        }
    
}
}
