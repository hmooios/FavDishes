//
//  Dishes.swift
//  FavDishes
//
//  Created by Hmoo Myat Theingi on 03/12/2023.
//

import SwiftUI

class Dishes:ObservableObject{
    @Published var dishes = [Dish]()
    
    init(){
        loadDishes()
    }
    
    func loadDishes(){
        
    }
}
