//
//  ImagePicker.swift
//  FavDishes
//
//  Created by Hmoo Myat Theingi on 03/12/2023.
//


import Foundation
import UIKit
import SwiftUI

struct ImagePicker:UIViewControllerRepresentable{
    
    @Binding var selectedImage:UIImage?
    @Binding var isPickerShowing:Bool
    
    func makeUIViewController(context: Context) -> UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var parent : ImagePicker
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image selected")
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            DispatchQueue.main.async{
                self.parent.selectedImage = image
            }
        }
        parent.isPickerShowing = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled")
        parent.isPickerShowing = false

    }
}
