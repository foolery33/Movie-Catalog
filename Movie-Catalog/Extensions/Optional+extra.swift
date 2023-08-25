//
//  Optional+extra.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 23.08.2023.
//

extension Optional {
    func orEmptyArray<T>() -> [T] where Wrapped == [T] {
        return self ?? []
    }
}

extension Optional where Wrapped == String {
    var orEmpty: String {
        return self ?? ""
    }
}

extension Optional where Wrapped == Int {
    var orZero: Int {
        return self ?? .zero
    }
}

extension Optional where Wrapped == Bool {
    var orFalse: Bool {
        return self ?? false
    }
}
