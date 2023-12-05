//
//  Dishes.swift
//  FavDishes
//
//  Created by Hmoo Myat Theingi on 03/12/2023.
//

import SwiftUI

class Dishes: ObservableObject {
    @Published var dishes = [Dish]()

    init() {
        loadDishes()
    }

    private var fileURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentDirectory.appendingPathComponent("dishes.json")
    }

    func addDish(_ dish: Dish) {
        dishes.append(dish)
        saveDishes()
    }

    func deleteDish(at indexSet: IndexSet) {
           guard !indexSet.isEmpty else {
               return
           }

           dishes.remove(atOffsets: indexSet)
           saveDishes()
       }


    func loadDishes() {
        do {
            let data = try Data(contentsOf: fileURL)
            dishes = try JSONDecoder().decode([Dish].self, from: data)
        } catch {
            print("Error loading dishes: \(error)")
        }
    }

    func saveDishes() {
        do {
            let data = try JSONEncoder().encode(dishes)
            try data.write(to: fileURL)
        } catch {
            print("Error saving dishes: \(error)")
        }
    }
}
