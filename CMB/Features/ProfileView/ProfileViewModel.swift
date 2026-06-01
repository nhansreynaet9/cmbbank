import Foundation
import Combine

@MainActor
class ProfileViewModel: ObservableObject {

 
    @Published var profile: ProfileModel?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?


    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    let lastLogin  = "25 May 2024, 07:30 AM"
    let hasUpdate  = true
    
    init()  {
        
        Task {
            await fetchProfile()
        }
    }

    func fetchProfile() async {
        isLoading = true
        profile = .mock
        isLoading = false
    }
}
