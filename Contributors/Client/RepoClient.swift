//
//  RepoClient.swift
//  Contributors
//
//  Created by varunbhalla19 on 10/01/23.
//

import Foundation

class RepoClient {
    
    let fetcher: HttpDownloader
    
    private lazy var decoder = JSONDecoder()
    
    init(fetcher: HttpDownloader = URLSession.shared) {
        self.fetcher = fetcher
    }
    
    func fetchOrgs() async throws -> [Org] {
        let data = try await fetcher.fetchOrgs()
        let repos = try decoder.decode(OrgResponse.self, from: data)
        return repos.items
    }
    
    func fetchRepo(for org: String) async throws -> [Repo] {
        let data = try await fetcher.fetchRepos(for: org)
        let repos = try decoder.decode([Repo].self, from: data)
        return repos
    }
    
    func fetchContributors(for org: String, and repo: String) async throws -> [User] {
        let data = try await fetcher.fetchContributors(for: org, and: repo)
        let users = try decoder.decode([User].self, from: data)
        return users
    }
}

