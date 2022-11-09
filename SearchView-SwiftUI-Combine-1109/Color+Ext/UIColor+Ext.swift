//
//  Color+Ext.swift
//  SearchView-SwiftUI-Combine-1109
//
//  Created by Chris Kim on 11/10/22.
//

import Foundation
import UIKit

extension UIColor {
    
    /// Get Search Image Color
    /// - Returns: Search Image Color
    func getSearchImageColor() -> UIColor {
        return UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1.0)
    }
 
    /// Get Search View Background Color
    /// - Returns: Search View Background Color
    func getSearchViewBackgroundColor() -> UIColor {
        return UIColor(red: 0.967, green: 0.967, blue: 0.967, alpha: 1.0)
    }
    
    /// Get Keywords Text Color
    /// - Returns: Popular Keywords Text Color
    func getKeywordsColor() -> UIColor {
        return UIColor(red: 0.425, green: 0.391, blue: 0.391, alpha: 1.0)
    }
    
    /// Get Keywords Border Color
    /// - Returns: Keywords Border Color
    func getKeywordBorderColor() -> UIColor {
        return UIColor(red: 0.883, green: 0.861, blue: 0.861, alpha: 1.0)
    }
}
