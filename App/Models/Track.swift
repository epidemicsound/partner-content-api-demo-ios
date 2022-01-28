import Foundation

struct Track: Decodable, Identifiable {
    let id: String
    let title: String
    let images: Images
    
    struct Images: Decodable {
        let standard: String
        let large: String
        
        enum CodingKeys: String, CodingKey {
            case standard = "default"
            case large = "L"
        }
    }
}
