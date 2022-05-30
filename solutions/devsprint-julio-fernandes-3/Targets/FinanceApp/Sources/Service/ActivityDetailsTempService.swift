//
//  ActivityDetailsTempService.swift
//  FinanceApp
//
//  Created by Mobills on 28/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

protocol TempActivityDetailsServiceProtocol {
    func fetch(completion: @escaping (ActivityDetailsDTO) -> Void)
}

final class TempActivityDetailsService: TempActivityDetailsServiceProtocol {
    
    private let data = ActivityDetailsDTO(
        activityName: "Mall",
        category: "Shopping",
        price: 100,
        time: Date(timeIntervalSince1970: 1653566228),
        imageName: "bag.circle.fill"
    )
    
    func fetch(completion: @escaping (ActivityDetailsDTO) -> Void) {
        DispatchQueue.global(qos: .background).async {
            completion(self.data)
        }
    }
}
