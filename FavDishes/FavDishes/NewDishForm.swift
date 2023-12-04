//
//  NewDishForm.swift
//  FavDishes
//
//  Created by Hmoo Myat Theingi on 03/12/2023.
//

import SwiftUI

struct NewDishForm: View {
    @Environment(\.dismiss) var dismiss
    @State private var name=""
    @State private var restaurant=""
    
    @State private var isPickerShowing = false
    @State private var selectedImage:UIImage?

    var body: some View {
        NavigationView{
            VStack{
                
                VStack{
                    if selectedImage != nil{
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .frame(width: 200,height: 200)
                    }
                    Button(action: {
                        isPickerShowing = true
                    }, label: {
                        Text("Select photo")
                            .foregroundColor(.white)
                            .font(.title3.bold())
                            .padding()
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                }
                .sheet(isPresented: $isPickerShowing, content: {
                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                })
                TextField("Name",text: $name)
                TextField("Restaurant", text: $restaurant)
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Save")
                        .font(.title.bold())
                })
            }.navigationTitle("New dish")
        }
    }
}

#Preview {
    NewDishForm()
}
