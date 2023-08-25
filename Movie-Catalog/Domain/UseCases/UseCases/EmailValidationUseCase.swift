//
//  EmailValidationUseCase.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

final class EmailValidationUseCase {

    // MARK: - UseCase

    public func invoke(_ email: String) -> Bool {
        let emailRegex = "^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email.lowercased())
    }

}
