//
//  String+Extensions.swift
//  facefootball
//
//  Created by Christian Contreras on 2/11/23.
//

import Foundation
import UIKit

extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        
        return result
        
    }
    
    @MainActor
    func openUrl() {
        let application:UIApplication = UIApplication.shared
        if let url = URL(string: self),
           application.canOpenURL(url) {
            application.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func toDouble() -> Double {
        return Double(self) ?? .zero
    }
    
    func replaceHtml() -> String {
        return replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
