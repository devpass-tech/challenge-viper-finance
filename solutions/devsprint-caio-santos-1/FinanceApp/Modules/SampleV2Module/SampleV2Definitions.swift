//
//  SampleV2Definitions.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/02/22.
//

import Foundation

// MARK: - Enums

enum SampleV2SectionType {
    case section1
    case section2
    case sectionN
}

enum SampleV2CellType {
    case cell1
    case cell2
    case cellN
}

// MARK: - Data Source

public struct SampleV2Transporter {
    let value1: String?
    let value2: String?

    init(value1: String?, value2: String?) {
        self.value1 = value1
        self.value2 = value2
    }
}
