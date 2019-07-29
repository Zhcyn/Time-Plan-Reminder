//
//  Colors.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 6/28/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

enum Colors {
    case gcolor1, gcolor2, gcolor3, gcolor4, gcolor5, gcolor6, gcolor7, gcolor8, gcolor9, gcolor10
    
    func gradientValues() -> (color1: String, color2: String) {
        switch self {
        case .gcolor1:
            return ("FE9E9B", "FEDC9D")
        case .gcolor2:
            return ("9ADFFB", "9BFCEE")
        case .gcolor3:
            return ("DE9AF7", "FB9AC0")
        case .gcolor4:
            return ("9AC4F1", "A2F2C6")
        case .gcolor5:
            return ("4BBEF6", "A392FF")
        case .gcolor6:
            return ("D3FBA6", "A9FBAA")
        case .gcolor7:
            return ("FEAEA8", "FEE6D6")
        case .gcolor8:
            return ("AAEBF7", "D6F9EA")
        case .gcolor9:
            return ("FEEAB1", "FEE6E8")
        case .gcolor10:
            return ("EDC0CE", "BFBEF2")
        }
    }
    
    static func getAllValues() -> [(String, String)] {
        let arrColors = [gcolor1, gcolor2, gcolor3, gcolor4, gcolor5, gcolor6, gcolor7, gcolor8, gcolor9, gcolor10]
        var gradientColors: [(String, String)] = []
        arrColors.forEach {
            let graColor = $0.gradientValues()
            gradientColors.append(graColor)
        }
        
        return gradientColors
    }
}

