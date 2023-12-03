//
//  ContentView.swift
//  FavDishes
//
//  Created by Hmoo Myat Theingi on 03/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var dishes=Dishes()
    
    @State private var isShowingNewDishForm=false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(dishes.dishes){ dish in
                    NavigationLink {
                        DishDetailView()
                    } label: {
                        VStack{
                            Text(dish.name)
                        }
                    }

                }
            }
            .navigationTitle("My FavDishes")
            .toolbar{
                ToolbarItem {
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                         //   isEditing.toggle()
                        }
                }
                
            }
           
        }
    }
}

#Preview {
    ContentView(dishes: Dishes())
}
