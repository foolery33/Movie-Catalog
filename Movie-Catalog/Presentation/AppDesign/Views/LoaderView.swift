//
//  LoaderView.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import SwiftUI

struct LoaderView: View {

    // MARK: - Public Properties

    @Binding public var isShowing: Bool

    // MARK: - Body

    var body: some View {
        ZStack {
            AppColors.background.swiftUIColor.opacity(Constants.loaderViewBackgroundOpacity)
                .frame(
                    width: Constants.loaderViewBackgroundSize,
                    height: Constants.loaderViewBackgroundSize
                )
                .cornerRadius(Constants.loaderViewBackgroundCornerRadius)
            ProgressView()
                .progressViewStyle(
                    CircularProgressViewStyle(
                        tint: AppColors.white.swiftUIColor
                    )
                )
        }
        .opacity(isShowing ? 1 : 0)
    }
}

// MARK: - Preview

struct SwiftUILoaderView_Previews: PreviewProvider {
    @State static var isShowing: Bool = true
    static var previews: some View {
        LoaderView(isShowing: $isShowing)
    }
}

// MARK: - Constants

private extension LoaderView {
    enum Constants {
        static let loaderViewBackgroundSize: CGFloat = 55
        static let loaderViewBackgroundCornerRadius: CGFloat = 8
        static let loaderViewBackgroundOpacity: CGFloat = 0.7
    }
}
