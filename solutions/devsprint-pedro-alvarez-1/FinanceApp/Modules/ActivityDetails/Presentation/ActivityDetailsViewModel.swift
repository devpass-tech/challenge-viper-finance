//
//  ActivityDetailsViewModel.swift
//  FinanceApp
//
//  Created by Junior Fernandes on 16/11/22.
//

import UIKit

enum ActivityDetailsCategory: String {
    case shopping = "Shopping"
    case food = "Food"
    case travel = "Travel"
    case health = "Health"
    case transport = "Transport"
    
    private var imageName: String {
        switch self {
        case .shopping:
            return "bag.circle.fill"
        case .food:
            return "fork.knife.circle.fill"
        case .travel:
            return "airplane.circle.fill"
        case .health:
            return "heart.circle.fill"
        case .transport:
            return "car.circle.fill"
        }
    }
    
    var image: UIImage? {
        UIImage.init(named: imageName)
    }
}

struct ActivityDetailsViewModel: Equatable {
    let image: UIImage?
    let name: String
    let category: String
    let price: String
    let time: String
    
    init(entity: ActivityDetailsEntity) {
        self.image = ActivityDetailsCategory(rawValue: entity.category)?.image
        self.name = entity.name
        self.category = entity.category
        self.price = "$ \(entity.price)"
        self.time = entity.time
    }
    
    init(image: UIImage?,
         name: String,
         category: String,
         price: String,
         time: String
    ) {
        self.image = image
        self.name = name
        self.category = category
        self.price = price
        self.time = time
    }
    
    static var stub: ActivityDetailsViewModel? {
        ActivityDetailsViewModel(
            image: UIImage(named: "bag.circle.fill"),
            name: "Mall",
            category: "Shopping",
            price: "$ 100.0",
            time: "8:57 AM")
    }
}
