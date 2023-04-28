import SwiftUI

struct AddHistoryView: View {
  @Binding var addMode: Bool
  @State private var exerciseDate = Date()
  
  var body: some View {
    VStack {
      ZStack {
        Text("Add Exercise")
          .font(.title)
        Button("Done") {
          addMode = false
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
      }
      ButtonsView(date: $exerciseDate)
      DatePicker(
        "Choose Date",
        selection: $exerciseDate,
        in: ...Date(),
        displayedComponents: .date)
      .datePickerStyle(.graphical)
    }
    .padding()
  }
}

struct ButtonsView: View {
  @EnvironmentObject var history: HistoryStore
  @Binding var date: Date
  
  var body: some View {
    HStack {
      ForEach(Exercise.exercises.indices, id: \.self) { index in
        let exerciseName = Exercise.exercises[index].exerciseName
        Button(exerciseName) {
          history.addExercise(date: date, exerciseName: exerciseName)
        }
      }
    }
    .buttonStyle(EmbossedButtonStyle(buttonScale: 1.5))
  }
}

struct AddHistoryView_Previews: PreviewProvider {
  static var previews: some View {
    AddHistoryView(addMode: .constant(true))
      .environmentObject(HistoryStore(preview: true))
  }
}
