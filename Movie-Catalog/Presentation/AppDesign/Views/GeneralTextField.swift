//
//  GeneralTextField.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

import SwiftUI

struct GeneralTextField: View {

    // MARK: - Public Properties

    @Binding public var text: String
    public var textColor: Color? = AppColors.accent.swiftUIColor

    public var placeholder: String = ""
    public var placeholderColor: Color = AppColors.grayFaded.swiftUIColor

    public var isSecured: Bool = false

    public var font: Font = AppFonts.regular14

    public var borderColor: Color = AppColors.grayFaded.swiftUIColor
    public var borderLineWidth: CGFloat = 1

    public var verticalPadding: CGFloat = 13
    public var horizontalPadding: CGFloat = AppConstants.spacingMedium

    public var isAutocorrectionDisabled: Bool = false
    public var autocapitalizationMode: TextInputAutocapitalization = .sentences

    public var submitLabel: SubmitLabel = .next
    public var onSubmitAction: () -> Void = {}

    // MARK: - Private Properties

    @State private var isSecuredText: Bool = true

    // MARK: - Body

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(placeholderColor)
                    .font(font)
                    .padding(.horizontal, horizontalPadding)
            }
            Group {
                if isSecured {
                    ZStack(alignment: .trailing) {
                        Button(
                            action: {
                                isSecuredText.toggle()
                            }, label: {
                                Image(systemName: isSecuredText ? "eye" : "eye.slash")
                            }
                        )
                        .padding(.trailing, horizontalPadding)
                        Group {
                            if isSecuredText {
                                SecureField("", text: $text)
                            } else {
                                TextField(
                                    "",
                                    text: $text
                                )
                            }
                        }
                        .padding(.leading, horizontalPadding)
                        .padding(.trailing, horizontalPadding * 3)
                    }
                } else {
                    TextField("", text: $text)
                        .padding(.horizontal, horizontalPadding)
                }
            }
            .foregroundColor(textColor)
            .font(font)
            .padding(.vertical, verticalPadding)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: borderLineWidth)
                    .foregroundColor(borderColor)
            )
            .submitLabel(submitLabel)
            .onSubmit {
                onSubmitAction()
            }
            .textInputAutocapitalization(autocapitalizationMode)
            .autocorrectionDisabled(isAutocorrectionDisabled)
        }
    }
}

// MARK: - Preview

struct GeneralTextField_Previews: PreviewProvider {
    @State static var text: String = "adsfadasdfsdasdfasdfasdfsadfasdfasdfasdfasdfasdff"
    static var previews: some View {
        GeneralTextField(
            text: $text,
            isSecured: false
        )
        .preferredColorScheme(.light)
    }
}
