import Foundation


struct PartnerContentAPI {
    let token = "<token>"

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
