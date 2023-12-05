//
//  DishDetailView.swift
//  FavDishes
//
//  Created by Hmoo Myat Theingi on 03/12/2023.
//

import SwiftUI

struct DishDetailView: View {
    var dish:Dish
    var body: some View {
        Form{
            Section{
                Image(uiImage: dish.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
            }
            Section("Menu"){
                Text(dish.name)
            }
            Section("Location"){
                Text(dish.restaurant)

            }
        }
    }
}

#Preview {
    DishDetailView(dish: Dish.example)
}
