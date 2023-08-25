//
//  SignInScreenView.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

import SwiftUI

struct SignInScreenView: View {

    // MARK: - Public Properties

    @ObservedObject public var viewModel: SignInScreenViewModel

    // MARK: - Private Properties

    @FocusState private var focusField: FocusField?

    // MARK: - Body

    var body: some View {
        ZStack {
            AppColors.background.swiftUIColor.edgesIgnoringSafeArea(.all)
            VStack {
                Image(uiImage: AppImages.appLogo)
                Spacer().frame(height: Constants.loginTextFieldTopSpacing)
                Group {
                    GeneralTextField(
                        text: $viewModel.username,
                        placeholder: R.string.localizable.login(),
                        isAutocorrectionDisabled: true,
                        autocapitalizationMode: .never,
                        submitLabel: .next,
                        onSubmitAction: {
                            focusField = .password
                        }
                    )
                    .focused($focusField, equals: .username)
                    Spacer().frame(height: AppConstants.spacingMedium)
                    GeneralTextField(
                        text: $viewModel.password,
                        placeholder: R.string.localizable.password(),
                        isSecured: true,
                        isAutocorrectionDisabled: true,
                        autocapitalizationMode: .never,
                        submitLabel: .done,
                        onSubmitAction: {

                        }
                    )
                }
                .focused($focusField, equals: .password)
                Spacer()
                GeneralButton(
                    content: {
                        Text(R.string.localizable.enter())
                            .font(AppFonts.medium15)
                    },
                    action: {
                        viewModel.loginUser()
                    },
                    color: viewModel.areFieldsValid ?
                        AppColors.white.swiftUIColor :
                        AppColors.accent.swiftUIColor,
                    backgroundColor: viewModel.areFieldsValid ?
                        AppColors.accent.swiftUIColor :
                        AppColors.transparent.swiftUIColor,
                    isOutlined: viewModel.areFieldsValid ?
                        false :
                        true,
                    isMaxWidth: true
                )
                .disabled(!viewModel.areFieldsValid)
                Spacer().frame(height: AppConstants.spacingSmall)
                GeneralButton(
                    content: {
                        Text(R.string.localizable.registration())
                            .font(AppFonts.medium15)
                    },
                    action: {

                    },
                    color: AppColors.accent.swiftUIColor,
                    verticalPadding: AppConstants.spacingTiny,
                    isMaxWidth: false
                )
                Spacer().frame(height: AppConstants.spacingTiny)
            }
            .modifier(KeyboardToolbarModifier { focusField = nil })
            .padding(.top, AppConstants.spacingHuge)
            .padding(.bottom, AppConstants.spacingTiny)
            .padding(.horizontal, AppConstants.spacingMedium)
            .alert(
                R.string.localizable.error(),
                isPresented: $viewModel.isAlertShowing,
                actions: {
                    Button(R.string.localizable.ok(), action: {})
                },
                message: {
                    Text(viewModel.error)
                }
            )

            LoaderView(isShowing: $viewModel.isLoading)
        }
    }

}

// MARK: - Preview

struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView(
            viewModel: SignInScreenViewModel(
                dependencies: .init(
                    loginUserUseCase: UseCaseProvider.instance.loginUserUseCase,
                    getLoginErrorUseCase: UseCaseProvider.instance.getLoginErrorUseCase
                )
            )
        )
    }
}

// MARK: - FocusField

private extension SignInScreenView {
    enum FocusField: Hashable {
        case username
        case password
    }
}

// MARK: - Constants

private extension SignInScreenView {
    enum Constants {
        static let loginTextFieldTopSpacing: CGFloat = 96
    }
}
