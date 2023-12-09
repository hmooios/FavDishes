//
//  NewDishForm.swift
//  FavDishes
//
//  Created by Hmoo Myat Theingi on 03/12/2023.
//

import SwiftUI

struct NewDishForm: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var restaurant = ""
    
    @State private var isPickerShowing = false
    @State private var selectedImage: UIImage?
    
    @ObservedObject var dishes: Dishes
    @State private var isShowingAlert = false
    
    var disableForm : Bool{
        name.isEmpty || restaurant.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()

                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)

                    }
                    
                    Button(action: {
                        isPickerShowing = true
                    }, label: {
                        Text("Select Photo")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                    Spacer()
                }
                .sheet(isPresented: $isPickerShowing) {
                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                }
                .padding(.vertical, 20)
                
                TextField("Dish Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Restaurant", text: $restaurant)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                               
                               if disableForm {
                                   isShowingAlert = true
                               } else {
                                   let newDish = Dish(name: name, imageData: selectedImage?.pngData() ?? Data(), restaurant: restaurant)
                                   dishes.addDish(newDish)
                                   
                                   // Optionally, clear the form fields
                                   name = ""
                                   restaurant = ""
                                   selectedImage = nil
                                   
                                   dismiss()
                               }
                           }, label: {
                               Text("Save Dish")
                                   .font(.headline)
                                   .foregroundColor(.white)
                                   .padding()
                                   .frame(maxWidth: .infinity)
                                   .background(Color.blue)
                                   .cornerRadius(10)
                           })
                           .padding(.horizontal)
                           .sensoryFeedback(.success, trigger: isShowingAlert)
                       }
                       .navigationTitle("Add New Dish")
                       .padding()
                       .alert(isPresented: $isShowingAlert) {
                           Alert(
                               title: Text("Fill the form"),
                               message: Text("You must fill menu and restaurant"),
                               dismissButton: .default(Text("I got it"))
                           )
                       }
                   }
        
        .navigationViewStyle(StackNavigationViewStyle()) 
    }
}
#Preview {
    ContentView()
}
