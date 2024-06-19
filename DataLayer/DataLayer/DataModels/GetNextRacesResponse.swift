//
//  GetNextRacesResponse.swift
//  DataLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation
import DomainLayer

// MARK: - GetNextRacesResponse
public struct GetNextRacesResponse: Decodable {
    public let status: Int
    public let data: Data
    public let message: String
    
    // MARK: - Data
    public struct Data: Codable {
        public let nextToGoIds: [String]
        public let raceSummaries: [String: RaceSummary]

        public enum CodingKeys: String, CodingKey {
            case nextToGoIds = "next_to_go_ids"
            case raceSummaries = "race_summaries"
        }
    }

    // MARK: - RaceSummary
    public struct RaceSummary: Codable {
        public let raceID, raceName: String
        public let raceNumber: Int
        public let meetingID, meetingName, categoryID: String
        public let advertisedStart: AdvertisedStart
        public let raceForm: RaceForm
        public let venueID, venueName, venueState: String
        public let venueCountry: VenueCountry

        public enum CodingKeys: String, CodingKey {
            case raceID = "race_id"
            case raceName = "race_name"
            case raceNumber = "race_number"
            case meetingID = "meeting_id"
            case meetingName = "meeting_name"
            case categoryID = "category_id"
            case advertisedStart = "advertised_start"
            case raceForm = "race_form"
            case venueID = "venue_id"
            case venueName = "venue_name"
            case venueState = "venue_state"
            case venueCountry = "venue_country"
        }
    }

    // MARK: - AdvertisedStart
    public struct AdvertisedStart: Codable {
        public let seconds: Int
    }

    // MARK: - RaceForm
    public struct RaceForm: Codable {
        public let distance: Int
        public let distanceType: DistanceType
        public let distanceTypeID: String
        public let trackCondition: DistanceType
        public let trackConditionID: String
        public let weather: DistanceType?
        public let weatherID: String?
        public let raceComment, additionalData: String
        public let generated: Int
        public let silkBaseURL: String
        public let raceCommentAlternative: String

        public enum CodingKeys: String, CodingKey {
            case distance
            case distanceType = "distance_type"
            case distanceTypeID = "distance_type_id"
            case trackCondition = "track_condition"
            case trackConditionID = "track_condition_id"
            case weather
            case weatherID = "weather_id"
            case raceComment = "race_comment"
            case additionalData = "additional_data"
            case generated
            case silkBaseURL = "silk_base_url"
            case raceCommentAlternative = "race_comment_alternative"
        }
    }

    // MARK: - DistanceType
    public struct DistanceType: Codable {
        public let id, name, shortName: String
        public let iconURI: String?

        public enum CodingKeys: String, CodingKey {
            case id, name
            case shortName = "short_name"
            case iconURI = "icon_uri"
        }
    }

    public enum VenueCountry: String, Codable {
        case aus = "AUS"
        case jpn = "JPN"
    }
    
}

// MARK: - Convert to races entities
extension GetNextRacesResponse {
    
    func getRaceCategoryFor(_ categoryId: String) -> RaceCategory {
        if categoryId == "9daef0d7-bf3c-4f50-921d-8e818c60fe61" {
            return .greyhound
        } else if categoryId == "161d9be2-e909-4326-8c2c-35ed71fb460b" {
            return .harness
        } else if categoryId == "4a2788f8-e825-4d36-9894-efd4baf1cfae" {
            return .horse
        }
        return .unknown
    }
    
    func toEntities() -> [Race] {
        return self.data.raceSummaries.values.map { raceSummary in
            let id = raceSummary.raceID
            let category = getRaceCategoryFor(raceSummary.categoryID)
            let meetingName = raceSummary.meetingName
            let raceNumber = raceSummary.raceNumber
            let startTimeInSeconds = TimeInterval(raceSummary.advertisedStart.seconds)
            return Race(id: id, category: category, meetingName: meetingName, raceNumber: raceNumber, startTimeInSeconds: startTimeInSeconds)
        }
        
    }
}

