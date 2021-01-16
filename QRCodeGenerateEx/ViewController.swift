//
//  ViewController.swift - いろんな二次元コードを作ってみる
//  QRCodeGenerateEx
//
//  Created by EnchantCode on 2021/01/15.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    
    @IBOutlet weak var barcodeView: BarcodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let message = "Hello, World!!"
        let descriptor = CIQRCodeDescriptor(payload: message.data(using: .utf8)!, symbolVersion: 1, maskPattern: 0, errorCorrectionLevel: .levelM)!
        
        BarcodeView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)).generateCodeFromDescriptor(descriptor: descriptor)
        
        barcodeView.descriptor = descriptor
        //
        //        let bView = BarcodeView(descriptor: descriptor)
        //        self.view.addSubview(bView)
    }
    
    
}

