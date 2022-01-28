import Foundation


struct PartnerContentAPI {
    func getCollections(collectionsCompletionHandler: @escaping (CollectionsResponse?, Error?) -> Void) {
        
        if let url = URL(string: "https://partner-content-api-sandbox.epidemicsound.com/v0/collections") {
            var request = URLRequest(url: url)
            request.addValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJlbmQtdXNlciIsInRpZXJJZCI6IjIzNTgyOTViLWI2ZDAtNGQzNS04NDE1LTllYTY4Yjg5ZDM0YiIsImFwcE5hbWUiOiJTYW5kYm94IiwidGllck5hbWUiOiJiYXNlX3RpZXIiLCJhcHBJZCI6Ijk5MTIyMmNmLTUwMTYtNDFmNC04MzgxLWM5YTA1YWU5MGI3YyIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNjQzMzgwNzg5LCJ1c2VySWQiOiJmZjNjYWYyMy04ZDIwLTRmMTktYTJhNC1mOGM5NDkzZmY3ZTkifQ.UvoRATY7zodxyxNzsd2Aut80S27K4cqwXvwwe7kNJgMjvKIozQujt-zNbcXVCBTVD84IoU5J1I1z77RhJvbG405wC2x4p9PgYa_b7JK2tVthvKAVIF-0EXQGZ7MjTsV49HSgPcWpfMyHXaxt4LCRoaoM1nDsPlc49cArGJ7jZMHhg0fN05DAnvycoo_EYTvYZJXbfd8kHhCcD-vyX9civ8KxTVpVxlceAkjw6wX_u94JsKE7IS0COny1WeAsTMPg1XJCftsJ3PCyVp5SfOtu11A5hadevx0DJUpQjJ9JK1Woys1iq3ExrJvq3-1xat4jFvvDP9mp2KwZfovVp6z0vw", forHTTPHeaderField: "Authorization")
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
}
