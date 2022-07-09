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

enum ConsumeType {
    case account
    case card
    case etc
}

struct TossData {
    let sectionType: HomeSectionType
    let sectionList: [SectionList]
}

struct SectionList {
    let image: String
    let description: String
    let title: String
    let type: ConsumeType
}

let tossRow = SectionList(image: "TossBankImage", description: "7월 1일 대출 규제 변경", title: "새 대출한도를 확인해보세요", type: .etc)

let assetRow1 = SectionList(image: "assetCorp", description: "보통예금(IBK나라사랑통장)", title: "100,000원", type: .account)
let assetRow2 = SectionList(image: "assetToss", description: "투자/토스증권", title: "100,000원", type: .account)

let consumeRow1 = SectionList(image: "ConsumptionImage", description: "이번 달 쓴 금액", title: "300,000원", type: .card)
let consumeRow2 = SectionList(image: "DdayImage", description: "7월 11일 낼 카드값", title: "50,000원", type: .etc)

let tossSectionData = TossData(sectionType: .tossBank, sectionList: [tossRow])
let assetSectionData = TossData(sectionType: .assets, sectionList: [assetRow1, assetRow2])
let consumeSectionData = TossData(sectionType: .consumption, sectionList: [consumeRow1, consumeRow2])

let dummyData = [tossSectionData, assetSectionData, consumeSectionData]
