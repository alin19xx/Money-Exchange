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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayCoins.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayCoins[row].getKeyCoin()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerHackView.dataSource = self
        pickerHackView.delegate = self
        // Do any additional setup after loading the view.
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
