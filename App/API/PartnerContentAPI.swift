import Foundation


struct PartnerContentAPI {
    func getCollections(collectionsCompletionHandler: @escaping (CollectionsResponse?, Error?) -> Void) {
        
        if let url = URL(string: "https://partner-content-api-sandbox.epidemicsound.com/v0/collections") {
            var request = URLRequest(url: url)
            request.addValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJlbmQtdXNlciIsInRpZXJJZCI6IjIzNTgyOTViLWI2ZDAtNGQzNS04NDE1LTllYTY4Yjg5ZDM0YiIsImFwcE5hbWUiOiJTYW5kYm94IiwidGllck5hbWUiOiJiYXNlX3RpZXIiLCJhcHBJZCI6Ijk5MTIyMmNmLTUwMTYtNDFmNC04MzgxLWM5YTA1YWU5MGI3YyIsImlzcyI6IkVwaWRlbWljIFNvdW5kIiwiZXhwIjoxNjQzMzc4MTUzLCJ1c2VySWQiOiJmZjNjYWYyMy04ZDIwLTRmMTktYTJhNC1mOGM5NDkzZmY3ZTkifQ.QUMTjCkJ63eHZE5nqbUidixOrDqkddC7mYSn-HIq7bEE_NBPsU2Y5ILXsoolzJ8YLubGGP7MjHyWTvpe53GpRTZtcAKMpLIH6vC9B_CdWkZ6osSAR4MmLbz-zMl-TPU4FAYuaeaT1Ds_2RmhnFDV1dm_GvufJLaX2i3ikG5ZMDwB0RGfnA9pP68gXEv8YUu7igDlqgSbtCa-hfe4YF96SZoqu-zGCstKwG1WuTme4u005LEN-1hrX5AGFjQ3ymoJY-Pv0p7dF9DP03Bc3xjpwbOKe9WwmZJdMUPofO4CYtuY_6mxKY4DVe25eysi33VtPqif1nIKgWDiDqI5Mc6Flg", forHTTPHeaderField: "Authorization")
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
