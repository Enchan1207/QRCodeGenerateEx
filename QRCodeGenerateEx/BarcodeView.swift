//
//  BarcodeView.swift
//  QRCodeGenerateEx
//
//  Created by EnchantCode on 2021/01/16.
//

import Foundation
import UIKit
import CoreImage

@IBDesignable class BarcodeView: UIView {
    
    private let context = CIContext()
    private var internalDescriptor: CIBarcodeDescriptor? = nil
    
    public var descriptor: CIBarcodeDescriptor? {
        get{
            return internalDescriptor
        }
        
        set(value){
            self.internalDescriptor = value
            self.setNeedsDisplay()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        guard let descriptor = self.descriptor else {return}
        guard let barcodeImage = generateCodeFromDescriptor(descriptor: descriptor) else {return}
        barcodeImage.draw(in: rect)
    }
    
    // descriptorからUIImageを生成
    func generateCodeFromDescriptor(descriptor: CIBarcodeDescriptor) -> UIImage?{
        // descriptorからフィルタを作成し、CIImageを生成
        guard let filter = CIFilter(name: "CIBarcodeGenerator", parameters: ["inputBarcodeDescriptor": descriptor]) else {
            print("No such filter!")
            return nil
        }
        guard let outputImage = filter.outputImage else {
            print("Couldn't generate!")
            return nil
        }
        
        // 出力されたCIImageからCGImageを生成
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {return nil}
        
        // UIImageのイニシャライザにはCIImageを受け取るものもあるが、
        // 将来的にAffineTransformをかけたりすることを考えるとCGImageを生成しておくべきかと
        let uiImage = UIImage(cgImage: cgImage)
        return uiImage
    }
    
}
