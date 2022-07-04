//
//  Model.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import Foundation
import UIKit

// TODO: 더미데이터 구현
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
    
    var listImage: UIImage {
        switch self {
        case .tossBank:
            return UIImage(named: "TossBankImage") ?? UIImage()
        case .assets:
            return UIImage(named: "TossBankImage") ?? UIImage()
        case .consumption:
            return UIImage(named: "TossBankImage") ?? UIImage()
        }
    }
    
    var listCellDescriptionText: String {
        switch self {
        case .tossBank:
            return "7월 1일 대출 규제 변경"
        case .assets:
            return "보통예금(IBK나라사랑통장)"
        case .consumption:
            return "이번 달 쓴 금액"
        }
    }
    
    var listCellMainText: String {
        switch self {
        case .tossBank:
            return "새 대출한도를 확인해보세요"
        case .assets:
            return "100,000 원"
        case .consumption:
            return "100,000 원"
        }
    }
}
