//
//  Dish.swift
//  FavDishes
//
//  Created by Hmoo Myat Theingi on 03/12/2023.
//

import SwiftUI

struct Dish: Identifiable, Codable {
    var id = UUID()
    var name: String
    var imageData: Data // Change the image property to Data
    var restaurant: String

    var image: UIImage {
        guard let uiImage = UIImage(data: imageData) else {
            // Return a placeholder image or handle the error as needed
            return UIImage(systemName: "photo")!
        }
        return uiImage
    }

    static let example = Dish(name: "Unknown name", imageData: Data(), restaurant: "Unknown restaurant")
}
