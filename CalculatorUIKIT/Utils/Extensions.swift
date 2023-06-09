//
//  Extensions.swift
//  CalculatorUIKIT
//
//  Created by swostik gautam on 08/06/2023.
//

import Foundation

extension String {
    func getCharacterAtIndex(_ index:Int) -> String {
        let stringArray:[String] = Array(self).map{ String($0) }
        return stringArray[index]
    }
    
    func replaceWith(from:String , by:String) -> String {
        return self.replacingOccurrences(of: from, with: by)
    }
}
