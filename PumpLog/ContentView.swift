import SwiftUI

struct ContentView: View {
    @StateObject private var trainingStore = TrainingStore()
    @State private var showAddView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("PumpLog")
                    .font(.largeTitle)
                    .bold()
                
                Text("今日のトレーニング")
                    .font(.headline)
                
                if trainingStore.trainings.isEmpty {
                    Text("まだ記録がありません")
                        .foregroundStyle(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(trainingStore.trainings) { training in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(training.name)
                                    .font(.headline)
                                
                                Text("\(training.part) / \(training.weight)kg × \(training.reps)回 × \(training.sets)セット")
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .onDelete { indexSet in
                            trainingStore.trainings.remove(atOffsets: indexSet)
                        }
                    }
                }
                
                Button {
                    showAddView = true
                } label: {
                    Text("＋ トレーニングを追加")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
            }
            .padding()
            .sheet(isPresented: $showAddView) {
                AddTrainingView(trainings: $trainingStore.trainings)
            }
        }
    }
}

#Preview {
    ContentView()
}
