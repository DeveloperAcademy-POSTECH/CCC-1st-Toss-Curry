//
//  Model.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import Foundation
import UIKit

enum HomeSectionType {
    case tossBank
    case assets
    case consumption
    
    var sectionName: String {
        switch self {
        case .tossBank:
            return "토스뱅크"
        case .assets:
            return "자산"
        case .consumption:
            return "소비"
        }
    }
    
    var arrowImage: UIImage {
        switch self {
        case .consumption:
            return UIImage()
            
        default:
            return UIImage(
                systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16.0, weight: .bold))?.withTintColor(.gray) ?? UIImage()
        }
    }
}
