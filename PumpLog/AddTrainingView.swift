import SwiftUI

struct AddTrainingView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var trainings: [Training]
    
    @State private var name = ""
    @State private var part = "胸"
    @State private var weight = ""
    @State private var reps = ""
    @State private var sets = ""
    
    let parts = ["胸", "背中", "肩", "腕", "脚", "腹筋"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("種目") {
                    TextField("例：ベンチプレス", text: $name)
                    
                    Picker("部位", selection: $part) {
                        ForEach(parts, id: \.self) { part in
                            Text(part)
                        }
                    }
                }
                
                Section("記録") {
                    TextField("重量 kg", text: $weight)
                        .keyboardType(.numberPad)
                    
                    TextField("回数", text: $reps)
                        .keyboardType(.numberPad)
                    
                    TextField("セット数", text: $sets)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("トレーニング追加")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("キャンセル") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
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
                    .disabled(name.isEmpty || weight.isEmpty || reps.isEmpty || sets.isEmpty)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
