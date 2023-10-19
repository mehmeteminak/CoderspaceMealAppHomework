//
//  AllCategorys.swift
//  MealAppHomework
//
//  Created by Macbook Air on 15.10.2023.
//

import Foundation

// MARK: - Cast
struct AllCategorys: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
