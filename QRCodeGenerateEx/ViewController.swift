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
        
        // 描画
        let context = CIContext()
        guard let filter = CIFilter(name: "CIEdges") else {
            print("Filter not found!")
            return
        }

        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        
        let ciImage = CIImage(contentsOf: URL(string: "https://ayame-store.jp/files/theme_configs/main_image_1.JPG")!)!
        
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        
        let output = filter.outputImage!
        let cgImage = context.createCGImage(output, from: output.extent)!
 
        // UIIに出力
        let uiImage = UIImage(cgImage: cgImage)
        let imageView = UIImageView(image: uiImage)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        
    }


}
