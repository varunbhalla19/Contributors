//
//  HttpDownloader.swift
//  Contributors
//
//  Created by varunbhalla19 on 09/01/23.
//

import Foundation

enum NwError: Error {
    case invalidOrgName, missingData, invalidOrgOrRepo
}

protocol HttpDownloader {
    func fetchRepos(for org: String) async throws -> Data
    func fetchContributors(for org: String, and repo: String) async throws -> Data
    func fetchOrgs() async throws -> Data
}

extension URLSession: HttpDownloader {
    
    func fetchOrgs() async throws -> Data {
        let url = Constants.shared.getOrganizationsUrl()
        var request = URLRequest(url: url)
        request.setHeaderValues()
        
        guard let (data, response) = try await data(for: request) as? (Data, HTTPURLResponse),
                (200..<300).contains(response.statusCode) else { throw NwError.missingData }
        
        return data
    }
        
    func fetchContributors(for org: String, and repo: String) async throws -> Data {
        guard let url = Constants.shared.getContributorsUrl(org, repo) else { throw NwError.invalidOrgOrRepo }
        var request = URLRequest(url: url)
        request.setHeaderValues()
        
        guard let (data, response) = try await data(for: request) as? (Data, HTTPURLResponse),
                (200..<300).contains(response.statusCode) else { throw NwError.missingData }
        
        return data
    }
        
    func fetchRepos(for org: String) async throws -> Data {
        guard let url = Constants.shared.getOrgsUrl(org) else { throw NwError.invalidOrgName }
        var request = URLRequest(url: url)
        request.setHeaderValues()
        
        guard let (data, response) = try await data(for: request) as? (Data, HTTPURLResponse),
                (200..<300).contains(response.statusCode) else { throw NwError.missingData }
        
        return data
    }
    
}

