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

        let context = CIContext()

        // フィルタ設定
        let message = "Okaaaay, Fantastiiiic"
        let descriptor = CIQRCodeDescriptor(payload: message.data(using: .utf8)!, symbolVersion: 1, maskPattern: 0, errorCorrectionLevel: .levelM)!
        
        guard let filter = CIFilter(name: "CIBarcodeGenerator", parameters: ["inputBarcodeDescriptor": descriptor]) else {return}
        
        // フィルタ済みの画像を取得して
        guard let output = filter.outputImage else {return}
        guard let cgImage = context.createCGImage(output, from: output.extent) else {return}
 
        // UIIに出力
        let uiImage = UIImage(cgImage: cgImage)
        let imageView = UIImageView(image: uiImage)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
    }
}
