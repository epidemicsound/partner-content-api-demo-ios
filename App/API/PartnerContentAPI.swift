import Foundation


struct PartnerContentAPI {
    let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJlbmQtdXNlciIsInRpZXJJZCI6IjIzNTgyOTViLWI2ZDAtNGQzNS04NDE1LTllYTY4Yjg5ZDM0YiIsImFwcE5hbWUiOiJTYW5kYm94IiwidGllck5hbWUiOiJiYXNlX3RpZXIiLCJhcHBJZCI6Ijk5MTIyMmNmLTUwMTYtNDFmNC04MzgxLWM5YTA1YWU5MGI3YyIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNjQ2Njc0MDc2LCJ1c2VySWQiOiJqb2FyIn0.sRkdw026eFlwBmxWjfQI9gCSXjduR8mlGsVnVZg5Ox8xYesKunFHjAjyZjb93_7h88oOuIPWtLXUdLP0OZZwQX-mK4xVnGQ62mpdzODTtsl5Z6VHzBT5NcZblKV7GHysosUShDPhXwwSDj5K7TSqNcFeg6Ke-unRt-hJ3WuXDNBJ-r8YzyTK2AyIhp5u7HqLkI9oHYw8nSXlgne0eh8njOxmcsu2-WUKPqvlsdI3jAN3RnuOk7VJdeJCaVl9vh89g3vXGqtzxB1xkKaQppM4hWhSkQJm42cQwcKWj3fj0y-VjWfdOGOim6Z8X-ZX4zZf2x2JhIOU3Zty9ZIy1KQsgQ"

    func getCollections(collectionsCompletionHandler: @escaping (CollectionsResponse?, Error?) -> Void) {

        if let url = URL(string: "https://partner-content-api-sandbox.epidemicsound.com/v0/collections") {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            let session = URLSession.shared

            let task = session.dataTask(with: request) { (data, response, error) -> Void in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(CollectionsResponse.self, from: data)
                        res.collections.forEach{ (c) -> Void in
                            print(c.name)
                        }
                        collectionsCompletionHandler(res, nil)
                    } catch let error {
                        print(error)
                        collectionsCompletionHandler(nil, error)
                    }
                }
            }
            task.resume()
        }
    }

    func getHLSTrack(id: String, hlsTrackCompletionHandler: @escaping (HLSTrackResponse?, Error?) -> Void) {

        if let url = URL(string: "https://partner-content-api-sandbox.epidemicsound.com/v0/tracks/\(id)/hls") {
            var request = URLRequest(url: url)
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            let session = URLSession.shared

            let task = session.dataTask(with: request) { (data, response, error) -> Void in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(HLSTrackResponse.self, from: data)
                        hlsTrackCompletionHandler(res, nil)
                    } catch let error {
                        print(error)
                        hlsTrackCompletionHandler(nil, error)
                    }
                }
            }
            task.resume()
        }
    }
}
