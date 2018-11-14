//
//  ViewHackController.swift
//  Money Exchange
//
//  Created by DAM on 09/11/2018.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit

class ViewHackController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickerHackView: UIPickerView!
    
    @IBOutlet weak var btnConvertHack: RoundButton!
    @IBOutlet weak var inputAmountHack: UITextField!
    @IBOutlet weak var btnBack: RoundButton!
    var name = ""
    var value = 0
    @IBOutlet weak var infoHack: UILabel!
    
    @IBOutlet weak var infoHack2: UILabel!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayCoins.count
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                      with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        value = row
        name = arrayCoins[row].getKeyCoin()
        return name
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerHackView.dataSource = self
        pickerHackView.delegate = self
        infoHack.isHidden = true
        infoHack2.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func convertHack(_ sender: Any) {
        for i in arrayCoins {
            if(name == i.getKeyCoin()){
                i.setValueCoin(valueCoin: Double(inputAmountHack.text ?? "0") ?? 0 )
                infoHack.text = "Chaval! Estas hecho todo un hacker:"
                infoHack2.text = "Moneda: \(i.getKeyCoin()) Valor Nuevo: \(i.getValueCoin())"
                infoHack.isHidden = false
                infoHack2.isHidden = false
            }
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
