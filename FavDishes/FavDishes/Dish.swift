//
//  Dish.swift
//  FavDishes
//
//  Created by Hmoo Myat Theingi on 03/12/2023.
//

import SwiftUI
struct Dish:Identifiable{
    var id=UUID()
    var name:String
    var image:UIImage
    var restaurant:String
    
    static let example = Dish(name: "Unknown name", image: UIImage(systemName: "photo")!, restaurant: "Unknown restaurant")
}
