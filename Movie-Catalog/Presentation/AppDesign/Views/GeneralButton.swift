//
//  GeneralButton.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 24.08.2023.
//

import SwiftUI

struct GeneralButton<Content: View>: View {

    // MARK: - Public Properties

    @ViewBuilder public let content: Content

    public let action: () -> Void

    public var color: Color = AppColors.white.swiftUIColor

    public var backgroundColor: Color = AppColors.transparent.swiftUIColor

    public var isOutlined: Bool = false

    public var borderWidth: CGFloat = 1
    public var borderColor: Color = AppColors.gray.swiftUIColor

    public var cornerRadius: CGFloat = 4

    public var verticalPadding: CGFloat = 12
    public var horizontalPadding: CGFloat = 0

    public var isMaxWidth: Bool = true

    // MARK: - Body

    var body: some View {
        Button {
            action()
        } label: {
            content
                .frame(maxWidth: isMaxWidth ? .infinity : nil)
        }
        .foregroundColor(color)
        .padding(.vertical, verticalPadding)
        .padding(.horizontal, horizontalPadding)
        .background(
            ZStack {
                RoundedRectangle(
                    cornerRadius: cornerRadius
                )
                .stroke(lineWidth: isOutlined ? borderWidth : .zero)
                .foregroundColor(isOutlined ? borderColor : backgroundColor)
                if !isOutlined {
                    RoundedRectangle(
                        cornerRadius: cornerRadius
                    )
                    .foregroundColor(backgroundColor)
                }
            }
        )

    }
}

// MARK: - Preview

struct GeneralButton_Previews: PreviewProvider {
    @State static var isInFilledMode: Bool = false
    static var previews: some View {
        GeneralButton(
            content: {
                Text("asda")
            },
            action: {},
            isOutlined: false,
            isMaxWidth: false
        )
    }
}
