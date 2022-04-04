//
//  Metrics.swift
//  iOS5-HW14-CollectionFoto
//
//  Created by Дарья Кретюк on 03.04.2022.
//

import Foundation
import UIKit

typealias layoutComposition = (countColumn: Int,
                               widthDimensionItem: Double,
                               heightDimensionGroup: Double,
                               bottomItem: CGFloat,
                               bottomSection: CGFloat
)

enum Metric: Int, CaseIterable {
    case myAlbum
    case commonAlbum
    case peoplePlace
    case typeMedia
    case others
    
    func columnCountHeight() -> layoutComposition {
        switch self {
        case .myAlbum: return (countColumn: 2,
                               widthDimensionItem: 200.0,
                               heightDimensionGroup: 0.55,
                               bottomItem: 70,
                               bottomSection: 20
        )
        case .commonAlbum: return (countColumn: 1,
                                   widthDimensionItem: 206.0,
                                   heightDimensionGroup: 0.27,
                                   bottomItem: 70,
                                   bottomSection: 20
        )
        case .peoplePlace: return (countColumn: 1,
                                   widthDimensionItem: 206.0,
                                   heightDimensionGroup: 0.27,
                                   bottomItem: 70,
                                   bottomSection: 20
        )
        case .typeMedia: return (countColumn: 1,
                                 widthDimensionItem: 50.0,
                                 heightDimensionGroup: 0.63,
                                 bottomItem: 0,
                                 bottomSection: 10
        )
        case .others: return (countColumn: 1,
                              widthDimensionItem: 50.0,
                              heightDimensionGroup: 0.3,
                              bottomItem: 0,
                              bottomSection: 0)
        }
    }

}


