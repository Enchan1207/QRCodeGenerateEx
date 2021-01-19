//
//  MessageFieldExt.swift
//  QRCodeGenerateEx
//
//  Created by EnchantCode on 2021/01/19.
//

import Foundation
import UIKit

extension ViewController: UITextFieldDelegate {
    // 編集終了時
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 入力内容を取得して
        self.currentMessage = textField.text
        
        // 対応するCIFilterを作って
        let filter: CIFilter?
        switch self.currentSelectedCodeType {
        case .QR:
            guard let data = currentMessage?.data(using: .utf8) else {return}
            filter = CIFilter(
                name: "CIQRCodeGenerator",
                parameters: [
                    "inputMessage": data,
                    "inputCorrectionLevel": "L"
                ]
            )
            
        case .Aztec:
            guard let data = currentMessage?.data(using: .isoLatin1) else {return}
            filter = CIFilter(
                name: "CIAztecCodeGenerator",
                parameters: [
                    "inputMessage": data,
                    "inputCorrectionLevel": 20,
                    "inputLayers": 4,
                    "inputCompactStyle": 1
                ]
            )
            
        case .PDF417:
            guard let data = currentMessage?.data(using: .ascii) else {return}
            filter = CIFilter(
                name: "CIPDF417BarcodeGenerator",
                parameters: [
                    "inputMessage": data,
                    "inputMinWidth": 60,
                    "inputMaxWidth": 200,
                    "inputMinHeight": 60,
                    "inputMaxHeight": 200,
                    "inputDataColumns": 1,
                    "inputRows": 3,
                    "inputPreferredAspectRatio": 0,
                    "inputCompactionMode": 3,
                    "inputCompactStyle": 1,
                    "inputCorrectionLevel": 4,
                    "inputAlwaysSpecifyCompaction": 0
                ]
            )
        
        case .Code128:
            guard let data = currentMessage?.data(using: .ascii) else {return}
            filter = CIFilter(
                name: "CICode128BarcodeGenerator",
                parameters: [
                    "inputMessage": data,
                    "inputQuietSpace": 1 // 0~20
                ]
            )
            
        case .none:
            filter = nil
            
        default:
            filter = nil
            
        }

        //更新
        guard filter != nil else {return}
        self.imageView.image = self.generateUIImageFromFilterOutput(filter: filter!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
