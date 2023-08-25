//
//  EmptyFieldValidationUseCase.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

final class EmptyFieldValidationUseCase {

    // MARK: - UseCase

    public func invoke(_ field: String) -> Bool {
        return field.isEmpty
    }

}
