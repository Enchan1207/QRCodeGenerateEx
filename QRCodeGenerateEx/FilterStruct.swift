//
//  FilterStruct.swift
//  QRCodeGenerateEx
//
//  Created by EnchantCode on 2021/01/19.
//

import Foundation

struct Filter {
    let name: String
    let options: FilterOption
}

struct FilterOption{
    let inputMessage: String?
    let inputCorrectionLevel: Any?
    let inputLayers: Int?
    let inputCompactStyle: Bool?
    let inputMinWidth: Int?
    let inputMaxWidth: Int?
    let inputMinHeight: Int?
    let inputMaxHeight: Int?
    let inputDataColumns: Int?
    let inputRows: Int?
    let inputPreferredAspectRatio: Double?
    let inputAlwaysSpecifyCompaction: Double?
}
