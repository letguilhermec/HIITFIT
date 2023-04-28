import SwiftUI

struct WelcomeView: View {
  @EnvironmentObject var historyStore: HistoryStore
  @State private var showReports = false
  @State private var showHistory = false
  @Binding var selectedTab: Int
  
  var getStartedButton: some View {
    RaisedButton(buttonText: "Get Started") {
      selectedTab = 0
    }
    .padding()
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
  
  var reportsButton: some View {
    Button(
      action: {
        showReports = true
      }, label: {
        Text("Reports")
          .fontWeight(.bold)
          .padding([.leading, .trailing], 5)
      })
    .padding(.bottom, 10)
    .buttonStyle(EmbossedButtonStyle())
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(
          selectedTab: $selectedTab,
          titleText: "Welcome")
        Spacer()
        ContainerView {
          ViewThatFits {
            VStack {
              WelcomeView.images
              WelcomeView.welcomeText
              getStartedButton
              Spacer()
              HStack {
                historyButton
                  .padding(.trailing)
                reportsButton
              }
            }
            VStack {
              WelcomeView.welcomeText
              getStartedButton
              Spacer()
              HStack {
                historyButton
                  .padding(.trailing)
                reportsButton
              }
            }
          }
        }
        .frame(height: geometry.size.height * 0.8)
      }
      .sheet(isPresented: $showHistory) {
        HistoryView(showHistory: $showHistory)
      }
      .sheet(isPresented: $showReports) {
        BarChartWeekView()
      }
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView(selectedTab: .constant(9))
      .previewLayout(.sizeThatFits)
  }
}
