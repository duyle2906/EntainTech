//
//  ApiService.swift
//  DataLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation
import DomainLayer

public protocol ApiServiceProtocol {
    func requestAsync<T: Decodable>(endpoint: EndpointProtocol) async throws -> T
}

public final class ApiService: ApiServiceProtocol {
    
    private let urlSession: URLSession
    
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    public func requestAsync<T: Decodable>(endpoint: any EndpointProtocol) async throws -> T {
        do {
            let (data, response) = try await urlSession.data(for: endpoint.createRequest())
            return try handleResponse(data: data, response: response)
        } catch let error as ApiError {
            throw error
        } catch {
            throw ApiError.unknownError()
        }
    }
    
    private func handleResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw ApiError(errorCode: "Error-1000", message: "Invalid url")
        }
        switch response.statusCode {
        case 200...299:
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                return try decoder.decode(T.self, from: data)
            } catch {
                throw ApiError(errorCode: "Error-1001", message: "Error decoding data")
            }
        default:
            guard let error = try? JSONDecoder().decode(ApiError.self, from: data) else {
                throw ApiError.unknownError(statusCode: response.statusCode)
            }
            throw ApiError(statusCode: response.statusCode, errorCode: error.errorCode, message: error.message)
        }
    }
}

