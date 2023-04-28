import SwiftUI

struct ContentView: View {
  @SceneStorage("selectedTab") private var selectedTab = 9
  
  var body: some View {
    ZStack {
      GradientBackground()
      TabView(selection: $selectedTab) {
        WelcomeView(selectedTab: $selectedTab)
          .tag(9)
        ForEach(Exercise.exercises.indices, id: \.self) { index in
          ExerciseView(index: index, selectedTab: $selectedTab)
            .tag(index)
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
