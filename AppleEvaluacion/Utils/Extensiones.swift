//
//  Extensiones.swift
//  AppleEvaluacion
//
//  Created by Ulises Atonatiuh Gonzalez Hernandez on 10/10/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import UIKit

extension Error {
    func printDescription() {
        print(self)
    }
}
//UIIMAGE
extension UIImage {

    convenience init?(url: URL?) {
        guard let url = url else { return nil }

        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
   func roundedImageWithBorder(width: CGFloat, color: UIColor) -> UIImage? {
      let square = CGSize(width: min(size.width, size.height) + width * 2, height: min(size.width, size.height) + width * 2)
      let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
      imageView.contentMode = .center
      imageView.image = self
      imageView.layer.cornerRadius = square.width/2
      imageView.layer.masksToBounds = true
      imageView.layer.borderWidth = width
      imageView.layer.borderColor = color.cgColor
      UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
      guard let context = UIGraphicsGetCurrentContext() else { return nil }
      imageView.layer.render(in: context)
      let result = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return result
    }
}

//TEXTFIELD
extension UITextField {
    func setBottomBorder(wide: CGFloat) {
           self.borderStyle = UITextField.BorderStyle.none
           self.backgroundColor = UIColor.clear
           let width = 1.0
           
           let borderLine = UIView()
           borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - width, width: Double(wide), height: width)
            borderLine.backgroundColor = .black
           self.addSubview(borderLine)
       }
}

//VIEW
extension UIView {
   
func shakeError() {
    let animation = CAKeyframeAnimation(keyPath: Strings.translationAnimation.rawValue)
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
    layer.add(animation, forKey: Strings.typeAnimation.rawValue)
           }
    
}

extension UIViewController {
func presentAlert(withTitle title: String, message: String, isCorrectAction: @escaping (() -> Void)) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: Strings.okAlert.rawValue, style: .default) { action in
        isCorrectAction()
    }
    let cancelAction = UIAlertAction(title: Strings.cancelAlert.rawValue, style: .default) { action in
    }
    alertController.addAction(okAction)
    alertController.addAction(cancelAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
