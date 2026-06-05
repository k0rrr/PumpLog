import SwiftUI

struct AddTrainingView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var trainings: [Training]
    
    @State private var name = ""
    @State private var part = ""
    @State private var weight = ""
    @State private var reps = ""
    @State private var sets = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("トレーニング内容") {
                    TextField("種目名", text: $name)
                    TextField("部位", text: $part)
                    
                    TextField("重量 kg", text: $weight)
                        .keyboardType(.numberPad)
                    
                    TextField("回数", text: $reps)
                        .keyboardType(.numberPad)
                    
                    TextField("セット数", text: $sets)
                        .keyboardType(.numberPad)
                }
                
                Button("保存") {
                    let newTraining = Training(
                        name: name,
                        part: part,
                        weight: weight,
                        reps: reps,
                        sets: sets
                    )
                    
                    trainings.append(newTraining)
                    dismiss()
                }
                .disabled(
                    name.isEmpty ||
                    weight.isEmpty ||
                    reps.isEmpty ||
                    sets.isEmpty
                )
            }
            .navigationTitle("トレーニング追加")
        }
    }
}

#Preview {
    ContentView()
}
