//
//  Extension.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/11.
//

import UIKit

// 출처 : jeohong (https://github.com/DeveloperAcademy-POSTECH/CCC-1st-Toss-Chikong/blob/UI/Toss/Toss/ViewController.swift)
extension UIImage {
    func resizeTo(size: CGSize) -> UIImage {
        let rendered = UIGraphicsImageRenderer(size: size)
        let image = rendered.image { _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: size))
        }
        
        return image.withRenderingMode(self.renderingMode)
    }
}

// 출처 : https://ios-development.tistory.com/215
public extension UIView {
    func addBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }

    func addAboveTheBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }
    
    // 출처 : https://github.com/DeveloperAcademy-POSTECH/CCC-1st-Toss-Evan/commit/fa87f86d093a1c26e7746f6f44ac5326ee507fd9
    func halfRoundCorners(corner: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
