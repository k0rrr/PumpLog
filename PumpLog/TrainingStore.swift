//
//  TrainingStore.swift
//  PumpLog
//
//  Created by Kairi Tayama on 2026/06/05.
//

import Foundation

class TrainingStore: ObservableObject {
    @Published var trainings: [Training] = [] {
        didSet {
            save()
        }
    }
    
    private let key = "trainings"
    
    init() {
        load()
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(trainings) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Training].self, from: data) {
            trainings = decoded
        }
    }
}
