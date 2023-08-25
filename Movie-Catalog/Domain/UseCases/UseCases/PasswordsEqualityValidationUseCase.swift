//
//  PasswordsEqualityValidationUseCase.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

final class PasswordsEqualityValidationUseCase {

    // MARK: - UseCase

    public func invoke(_ password1: String, _ password2: String) -> Bool {
        return password1 == password2
    }

}
