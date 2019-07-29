//
//  ROT13.swift
//  TextTransformer
//
//  Created by taco on 7/28/19.
//  Copyright © 2019 tacoTruck. All rights reserved.
//

import Foundation

struct ROT13 {
    private static var key = [Character: Character]()   //static implies it is created once and only once
    
    private static let upperCase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    private static let lowerCase = Array("abcdefghijklmnopqrstuvwxyz")
    
    static func string(_ string: String) -> String {
        if ROT13.key.isEmpty {
            for i in 0..<26 {
                ROT13.key[ROT13.upperCase[i]] = ROT13.upperCase[(i + 13) % 26]  //modulus allows to go back to start of alphabet
                ROT13.key[ROT13.lowerCase[i]] = ROT13.lowerCase[(i + 13) % 26]
                
            }
        }
        
    let transformed = string.map { ROT13.key[$0, default: $0] }
    return String(transformed)
    }
}
