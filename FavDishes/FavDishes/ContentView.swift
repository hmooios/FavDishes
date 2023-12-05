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
    
    @State private var isEditing = false

    
    var body: some View {
        NavigationView{
            List{
                ForEach(dishes.dishes){ dish in
                    Section{
                                            NavigationLink {
                                                DishDetailView(dish: dish)
                                            } label: {
                                                VStack {
                                                                                Image(uiImage: dish.image)
                                                                                    .resizable()
                                                                                    .aspectRatio(contentMode: .fill)
                                                                                    .frame(height: 150)
                                                                                    .clipped()
                                                                                Text(dish.restaurant)
                                                                                    .font(.subheadline)
                                                                                    .foregroundColor(.secondary)
                                                                            }
                      }
                    }
                }
                .onDelete(perform: deleteDish)

            }
            .navigationTitle("My FavDishes")
            .toolbar{
                ToolbarItem {
                    Button(action: {
                        isShowingNewDishForm = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            isEditing.toggle()
                        }
                }
                
            }
            .sheet(isPresented: $isShowingNewDishForm, content: {
                NewDishForm(dishes:dishes)
            })
        }
        
    }
    
    private func deleteDish(at offsets:IndexSet){
        dishes.deleteDish(at: offsets)
    }

}

#Preview {
    ContentView(dishes: Dishes())
}
