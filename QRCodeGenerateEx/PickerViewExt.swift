//
//  PickerViewExt.swift
//  QRCodeGenerateEx
//
//  Created by EnchantCode on 2021/01/19.
//

import Foundation
import UIKit

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.items[row].rawValue
    }
    
}

extension ViewController: UIPickerViewDelegate {
    // アイテムが選択されたら
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currentSelectedCodeType = self.items[row]
    }
}
