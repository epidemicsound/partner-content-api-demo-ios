import Foundation

struct HLSTrackResponse: Decodable {
    let url: String
    let cookie: Cookie
    
    struct Cookie: Decodable {
        let name: String
        let domain: String
        let path: String
        let value: String
        let expires: String
    }
}
