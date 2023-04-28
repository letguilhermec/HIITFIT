import SwiftUI

struct ExerciseView: View {
  @EnvironmentObject var history: HistoryStore
  let index: Int
  @State private var timerDone = false
  @State private var showTimer = false
  @State private var showSuccess = false
  @State private var showHistory = false
  @Binding var selectedTab: Int
  
  var exercise: Exercise {
    Exercise.exercises[index]
  }
  var lastExercise: Bool {
    index + 1 == Exercise.exercises.count
  }
  
  var startButton: some View {
    RaisedButton(buttonText: "Start Exercise") {
      showTimer.toggle()
    }
  }
  
  var doneButton: some View {
    Button("Done") {
      history.addDoneExercise(exercise.exerciseName)
      timerDone = false
      showTimer.toggle()
      
      if lastExercise {
        showSuccess.toggle()
      } else {
        selectedTab += 1
      }
    }
  }
  
  var historyButton: some View {
    Button(
      action: {
        showHistory = true
      }, label: {
        Text("History")
          .fontWeight(.bold)
          .padding([.leading, .trailing], 5)
      })
    .padding(.bottom, 10)
    .buttonStyle(EmbossedButtonStyle())
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        HeaderView(selectedTab: $selectedTab ,titleText: exercise.exerciseName)
          .padding(.bottom)
        Spacer()
        ContainerView {
          VStack {
            VideoPlayerView(videoName: exercise.videoName)
              .frame(height: geometry.size.height * 0.35)
              .padding(20)
            HStack(spacing: 150) {
              startButton
                .padding([.leading, .trailing], geometry.size.width * 0.1)
                .sheet(isPresented: $showTimer) {
                  TimerView(
                    timerDone: $timerDone,
                    exerciseName: exercise.exerciseName)
                  .onDisappear {
                    if timerDone {
                      history.addDoneExercise(exercise.exerciseName)
                      timerDone = false
                      if lastExercise {
                        showSuccess.toggle()
                      } else {
                        withAnimation {
                          selectedTab += 1
                        }
                      }
                    }
                  }
                }
                .sheet(isPresented: $showSuccess) {
                  SuccessView(selectedTab: $selectedTab)
                    .presentationDetents([.medium, .large])
                }
            }
            .font(.title3)
            .padding()
            Spacer()
            RatingView(exerciseIndex: index)
              .padding()
            historyButton
              .sheet(isPresented: $showHistory) {
                HistoryView(showHistory: $showHistory)
              }
              .padding(.bottom)
          }
        }
        .frame(height: geometry.size.height * 0.8)
      }
    }
  }
}
  
struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseView(index: 0, selectedTab: .constant(0))
      .environmentObject(HistoryStore())
  }
}
