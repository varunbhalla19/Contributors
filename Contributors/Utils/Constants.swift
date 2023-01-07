//
//  Constants.swift
//  Contributors
//
//  Created by varunbhalla19 on 07/01/23.
//

import Foundation

class Constants {

    private let baseUrl = "https://api.github.com"
    
    let token = /* Your github token... */
    let accept_headerName = "Accept"
    let accept_headerValue = "application/vnd.github+json"
    let auth_headerName = "Authorization"
    let auth_headerValue: String

    private init(){
        auth_headerValue = "Bearer \(self.token)"
    }
    
    static let shared = Constants.init()
    
    func getOrgsUrl(_ org: String) -> URL? {
        .init(string: baseUrl + "/orgs/\(org)/repos?per_page=100")
    }
    
    func getContributorsUrl(_ org: String, _ repo: String) -> URL? {
        .init(string: baseUrl + "/repos/\(org)/\(repo)/contributors")
    }
    
    func getOrganizationsUrl() -> URL {
            .init(string: baseUrl + "/search/users?q=type:org")!
    }
    
    
}
