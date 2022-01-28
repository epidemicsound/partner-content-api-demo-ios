import Foundation


struct PartnerContentAPI {
    func getCollections(collectionsCompletionHandler: @escaping (CollectionsResponse?, Error?) -> Void) {
        
        if let url = URL(string: "https://partner-content-api-sandbox.epidemicsound.com/v0/collections") {
            var request = URLRequest(url: url)
            request.addValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJlbmQtdXNlciIsInRpZXJJZCI6IjIzNTgyOTViLWI2ZDAtNGQzNS04NDE1LTllYTY4Yjg5ZDM0YiIsImFwcE5hbWUiOiJKb25hcyBUZXN0aW5nIiwidGllck5hbWUiOiJiYXNlX3RpZXIiLCJhcHBJZCI6IjY3NjcyNTI3LTg3YzktNDZlZS04ODhmLTNhZDYxM2ExYWQyYyIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNjQzMzg0NzAyLCJ1c2VySWQiOiJjZWQ3NWY5Yy03ZWEwLTExZWMtOTBkNi0wMjQyYWMxMjAwMDMifQ.hZfsMtrLd_efvWszSBU73BGyAMbF5crFjvJmCYAZGDapbfcGtmR7R7v7DunkatmchzlmqV0zULhLjr-e67KChsNpyurFJG-UkNKUTNyC2Mz9stuKmyAPIpWGTC3so2hlHQ-6rmQMKMwCIqF0uT3TTpxk1ckKFHaOEsY0dRhl0HDFiAU5bnr7M6JDCfXtENdN9nnc-5XLDOtzyQ4F1GyG8WgS3V3gUYILak4ln6dxA-4GbGEf241pfn2JvXo92gIl3cP4MxUhTrMh83nqehueEU0NmFm-1GvRnSSNh7Cmn3NTMy1ymuhPskCG3KfLxNxkTDXxMwE2n2k-cfqm1a0eKg", forHTTPHeaderField: "Authorization")
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
