import Foundation

extension HistoryStore {
  func createDevData() {
    // Development data
    exerciseDays = [
      ExerciseDay(
        date: Date().addingTimeInterval(-86400),
        exercises: [
          Exercise.exercises[0].exerciseName,
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[2].exerciseName
        ]
      ),
      ExerciseDay(
        date: Date().addingTimeInterval(-86400 * 2),
        exercises: [
          Exercise.exercises[0].exerciseName,
          Exercise.exercises[1].exerciseName
        ]
      )
    ]
  }
  
  func copyHistoryTestData() {
    let filename = "history.plist"
    if let resourceURL = Bundle.main.resourceURL {
      let sourceURL = resourceURL.appending(component: filename)
      let documentsURL = URL.documentsDirectory
      let destinationURL = documentsURL.appending(component: filename)
      do {
        try FileManager.default.copyItem(at: sourceURL, to: destinationURL)
      } catch {
        print("Failed to copy", filename)
      }
      print("Sample History data copied to Documents directory")
    }
  }
  
}
