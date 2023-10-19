//
//  General.extension.swift
//  MealAppHomework
//
//  Created by Macbook Air on 15.10.2023.
//

import Foundation
import UIKit


extension UIView {
    func addSubviews(_ views : [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}

extension UIViewController {
    
    func presentAlert(title : String,message : String,type : UIAlertController.Style,actions : [UIAlertAction] = [UIAlertAction(title: "OK", style: .cancel)]) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: type)
        actions.forEach { act in
            alert.addAction(act)
        }
        
        present(alert, animated: true)
    }
}
