//
//  Mapper.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

protocol Mapper {
    associatedtype Domain
    associatedtype Response

    func call(_ response: Response) -> Domain
}
