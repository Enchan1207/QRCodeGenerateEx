//
//  ViewController.swift - いろんな二次元コードを作ってみる
//  QRCodeGenerateEx
//
//  Created by EnchantCode on 2021/01/15.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = CIContext()
        let ciImage: CIImage?
        ciImage = CIImage(color: .white)
//        ciImage = CIImage(contentsOf: URL(string: "https://ayame-store.jp/images/2020/12/th/DSC_1129.JPG")!)
        
        guard ciImage != nil else {return}
        
        // フィルタ設定
        let filterName = "CICode128BarcodeGenerator"
        guard let filter = CIFilter(name: filterName) else {
            print("Filter not found: \(filterName)")
            return
        }
        
        let message = "Okaaaay, Fantastiiiic"
        let messageData = message.data(using: .isoLatin1)
        filter.setValue(messageData, forKey: "inputMessage")
        
        // フィルタ済みの画像を取得して
        guard let output = filter.outputImage else {
            print("Couldn't get output image.")
            return
        }
        guard let cgImage = context.createCGImage(output, from: output.extent) else {return}
 
        // UIIに出力
        let uiImage = UIImage(cgImage: cgImage)
        let imageView = UIImageView(image: uiImage)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        
    }


}
