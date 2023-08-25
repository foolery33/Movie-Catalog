//
//  KeyboardToolbarModifier.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import SwiftUI

struct KeyboardToolbarModifier: ViewModifier {

    // MARK: - Public Properties

    public var action: () -> Void

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Button(R.string.localizable.done()) {
                            action()
                        }
                        Spacer()
                    }
                    .foregroundColor(AppColors.accent.swiftUIColor)
                }
            }
    }

}
