//
//  ViewController.swift - いろんな二次元コードを作ってみる
//  QRCodeGenerateEx
//
//  Created by EnchantCode on 2021/01/15.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var MessageField: UITextField!
    
    let items: [BarcodeType] = [.QR, .Aztec, .Code128, .PDF417]
    var currentMessage: String?
    var currentSelectedCodeType: BarcodeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pickerView初期化
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.currentSelectedCodeType = self.items.first
        
        // messageField初期化
        self.MessageField.delegate = self
    }
    
    // フィルタの出力からUIImageを生成
    func generateUIImageFromFilterOutput(filter: CIFilter) -> UIImage?{
        // 10倍にアフィン変換
        guard let outputImage = filter.outputImage?.transformed(by: CGAffineTransform(scaleX: 10, y: 10)) else {return nil}
        
        // CIImage -> CGImage -> UIImage
        guard let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent) else {return nil}
        let uiImage = UIImage(cgImage: cgImage)
        return uiImage
    }
}
