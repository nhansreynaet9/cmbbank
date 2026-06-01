//
//  MyProfileModel.swift
//  CMB
//

import Foundation

struct ProfileModel {
    let fullName: String
    let userID: String
    let gender: String
    let documentType: String
    let nidPassportNumber: String
    let expiryDate: String
    let email: String
    let phoneNumber: String
    let occupationType: String
    let companyBusinessType: String
    let monthlyIncome: String
}

extension ProfileModel {
    static let mock = ProfileModel(
        fullName: "Nhan Sreynaet",
        userID: "01233123124121",
        gender: "F",
        documentType: "National_ID",
        nidPassportNumber: "011357793",
        expiryDate: "2029-10-01",
        email: "Nhan Sreynaet@gmail.com",
        phoneNumber: "+8553344455",
        occupationType: "Salaried Employee",
        companyBusinessType: "Technology",
        monthlyIncome: "$1,500"
    )
}
