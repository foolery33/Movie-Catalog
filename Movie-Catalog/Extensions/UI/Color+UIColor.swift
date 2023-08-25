//
//  Color+UIColor.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

import SwiftUI
import UIKit

extension Color {
    init(uiColor: UIColor) {
        self.init(
            red: Double(uiColor.rgba.red),
            green: Double(uiColor.rgba.green),
            blue: Double(uiColor.rgba.blue),
            opacity: Double(uiColor.rgba.alpha)
        )
    }
}
