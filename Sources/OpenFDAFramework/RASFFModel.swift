//
//  RASFFModel.swift
//  OpenFDAShareData
//
//  Created by robevans on 8/16/23.
//

import Foundation

// MARK: - Welcome
struct EURecall: Codable {
    let notifications: [EUNotification]
    let totalPages, totalElements: Int
}

// MARK: - Notification
struct EUNotification: Codable, StatsRepresentable {
    let notifID: Int
    let ecValidationDate, reference: String
    let notifyingCountry: GenericNotificationClassification
    let subject: String
    let productCategory, productType: GenericNotificationClassification
    let notificationClassification: NotificationClassification
    let riskDecision: RiskDecision
    let published: Bool
    let originCountries: [String]?

    enum CodingKeys: String, CodingKey {
        case notifID = "notifId"
        case ecValidationDate, reference, notifyingCountry, subject, productCategory, productType, notificationClassification, riskDecision, published, originCountries
    }

    var dateToParse: String {
        return ecValidationDate
    }

    var location: String {
        return notifyingCountry.description
    }

    var risk: String {
        return riskDecision.description.rawValue
    }
}

// MARK: - NotificationClassification
struct GenericNotificationClassification: Codable {
    let id: Int
    let description: String
}

struct NotificationClassification: Codable {
    let id: Int
    let description: String
}

enum NotificationClassificationType: String, Codable {
    case notificationForAttention = "information notification for attention"
    case alertNotification = "alert notification"
    case followUpNotification = "information notification for follow-up"
    case borderRejectionNotification = "border rejection notification"
}

struct RiskDecision: Codable {
    let id: Int
    let description: RiskDecisionType
}

@frozen enum RiskDecisionType: String, Codable {
    case potentiallySerious = "potentially serious"
    case serious = "serious"
    case potentialRisk = "potential risk"
    case notSerious = "not serious"
    case noRisk = "no risk"
}

let euMockData: [EUNotification] = [
    EUNotification(notifID: 123456, ecValidationDate: "05-09-2023 10:15:30", reference: "2023.7890", notifyingCountry: GenericNotificationClassification(id: 24, description: "France"), subject: "Salmonella outbreak in imported tomatoes", productCategory: GenericNotificationClassification(id: 17239, description: "fresh produce"), productType: GenericNotificationClassification(id: 235, description: "Food"), notificationClassification: NotificationClassification(id: 87, description: ".alertNotification.description"), riskDecision: RiskDecision(id: 12323, description: .notSerious), published: true, originCountries: ["Spain", "Italy"]),
    EUNotification(notifID: 789012, ecValidationDate: "10-09-2023 14:20:45", reference: "2023.9021", notifyingCountry: GenericNotificationClassification(id: 12, description: "Germany"), subject: "Allergen alert: Peanut traces found in chocolate bars", productCategory: GenericNotificationClassification(id: 20456, description: "confectionery"), productType: GenericNotificationClassification(id: 154, description: "Food"), notificationClassification: NotificationClassification(id: 123, description: "borderRejectionNotification"), riskDecision: RiskDecision(id: 12323, description: .potentialRisk), published: true, originCountries: ["Belgium", "Netherlands"]),
    EUNotification(notifID: 345678, ecValidationDate: "15-09-2023 08:30:10", reference: "2023.10987", notifyingCountry: GenericNotificationClassification(id: 9, description: "United Kingdom"), subject: "Recall: Tainted milk bottles from a specific batch", productCategory: GenericNotificationClassification(id: 30987, description: "dairy products"), productType: GenericNotificationClassification(id: 543, description: "Food"), notificationClassification: NotificationClassification(id: 456, description: "followUpNotification"), riskDecision: RiskDecision(id: 12323, description: .potentiallySerious), published: true, originCountries: ["Ireland"]),
    EUNotification(notifID: 567890, ecValidationDate: "20-09-2023 16:55:00", reference: "2023.2345", notifyingCountry: GenericNotificationClassification(id: 33, description: "Spain"), subject: "Pesticide residue in imported strawberries", productCategory: GenericNotificationClassification(id: 12876, description: "berries"), productType: GenericNotificationClassification(id: 432, description: "Food"), notificationClassification: NotificationClassification(id: 678, description: "followUpNotification"), riskDecision: RiskDecision(id: 12323, description: .serious), published: false, originCountries: ["Mexico"]),
    EUNotification(notifID: 987654, ecValidationDate: "25-09-2023 12:40:15", reference: "2023.5432", notifyingCountry: GenericNotificationClassification(id: 8, description: "Canada"), subject: "Possible contamination in canned soup batch", productCategory: GenericNotificationClassification(id: 876, description: "canned goods"), productType: GenericNotificationClassification(id: 654, description: "Food"), notificationClassification: NotificationClassification(id: 4321, description: "followUpNotification"), riskDecision: RiskDecision(id: 12323, description: .noRisk), published: true, originCountries: ["USA"]),
    EUNotification(notifID: 789012, ecValidationDate: "02-09-2023 14:20:45", reference: "2023.9021", notifyingCountry: GenericNotificationClassification(id: 12, description: "Germany"), subject: "Allergen alert: Peanut traces found in chocolate bars", productCategory: GenericNotificationClassification(id: 20456, description: "confectionery"), productType: GenericNotificationClassification(id: 154, description: "Food"), notificationClassification: NotificationClassification(id: 123, description: "borderRejectionNotification"), riskDecision: RiskDecision(id: 12323, description: .serious), published: true, originCountries: ["Belgium", "Netherlands"]),
    EUNotification(notifID: 345678, ecValidationDate: "15-09-2023 08:30:10", reference: "2023.10987", notifyingCountry: GenericNotificationClassification(id: 9, description: "United Kingdom"), subject: "Recall: Tainted milk bottles from a specific batch", productCategory: GenericNotificationClassification(id: 30987, description: "dairy products"), productType: GenericNotificationClassification(id: 543, description: "Food"), notificationClassification: NotificationClassification(id: 456, description: "followUpNotification"), riskDecision: RiskDecision(id: 12323, description: .potentiallySerious), published: true, originCountries: ["Ireland"]),
    EUNotification(notifID: 567890, ecValidationDate: "23-09-2023 16:55:00", reference: "2023.2345", notifyingCountry: GenericNotificationClassification(id: 33, description: "Spain"), subject: "Pesticide residue in imported strawberries", productCategory: GenericNotificationClassification(id: 12876, description: "berries"), productType: GenericNotificationClassification(id: 432, description: "Food"), notificationClassification: NotificationClassification(id: 678, description: "followUpNotification"), riskDecision: RiskDecision(id: 12323, description: .notSerious), published: false, originCountries: ["Mexico"]),
    EUNotification(notifID: 987654, ecValidationDate: "22-09-2023 12:40:15", reference: "2023.5432", notifyingCountry: GenericNotificationClassification(id: 8, description: "Canada"), subject: "Possible contamination in canned soup batch", productCategory: GenericNotificationClassification(id: 876, description: "canned goods"), productType: GenericNotificationClassification(id: 654, description: "Food"), notificationClassification: NotificationClassification(id: 4321, description: "followUpNotification"), riskDecision: RiskDecision(id: 12323, description: .potentialRisk), published: true, originCountries: ["USA"])
]

protocol StatsRepresentable {
    var dateToParse: String { get }
    var location: String { get }
    var risk: String { get }
}
