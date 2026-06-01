//
//  ProfileViewModel.swift
//  CMB
//

import SwiftUI
import Combine
class ProfileInfoViewModel: ObservableObject {

    @Published var profile: ProfileModel?
    @Published var isLoading = false



    var personalInfoRows: [(icon: String, label: String, value: String)] {
        guard let profile else { return [] }
        return [
            ("person.circle", "Full Name",          profile.fullName),
            ("person",        "Gender",              profile.gender),
            ("doc.text",      "Document Type",       profile.documentType),
            ("creditcard",    "NID/Passport Number", profile.nidPassportNumber),
            ("clock",         "Expiry Date",         profile.expiryDate),
            ("envelope",      "Email",               profile.email),
            ("phone",         "Phone Number",        profile.phoneNumber),
        ]
    }


    var residentialAddressRows: [(icon: String, label: String, value: String)] {
        guard let profile else { return [] }
        return [
            ("creditcard", "NID/Passport Number", profile.nidPassportNumber),
            ("clock",      "Expiry Date",         profile.expiryDate),
            ("envelope",   "Email",               profile.email),
            ("phone",      "Phone Number",        profile.phoneNumber),
        ]
    }



    var employmentDetailRows: [(icon: String, label: String, value: String)] {
        guard let profile else { return [] }
        return [
            ("briefcase",     "Occupation Type",      profile.occupationType),
            ("building.2",    "Company Business Type", profile.companyBusinessType),
            ("dollarsign.circle", "Monthly Income",   profile.monthlyIncome),
        ]
    }

    // MARK: - Fetch

    func fetchProfile() async {
        isLoading = true
        // TODO: Replace with real API call
        try? await Task.sleep(nanoseconds: 500_000_000)
        await MainActor.run {
            profile = .mock
            isLoading = false
        }
    }
}
