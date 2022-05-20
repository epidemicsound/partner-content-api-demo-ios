import Foundation


struct PartnerContentAPI {

    func getCollections(accessToken: String?, collectionsCompletionHandler: @escaping (CollectionsResponse?, Error?) -> Void) {

        
        if(accessToken == nil) {
            return
        }
        
        if let url = URL(string: "https://partner-content-api-dev.epidemicsite.com/v0/collections") {
            var request = URLRequest(url: url)
            request.addValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")
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

    func getHLSTrack(accessToken: String?, id: String, hlsTrackCompletionHandler: @escaping (HLSTrackResponse?, Error?) -> Void) {

        if let url = URL(string: "https://partner-content-api-dev.epidemicsite.com/v0/tracks/\(id)/hls") {
            var request = URLRequest(url: url)
            request.addValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")
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
