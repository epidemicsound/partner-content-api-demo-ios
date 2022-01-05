import Foundation

struct SignedCookie {
    let httpCookie: HTTPCookie

    init?(
        name: String,
        domain: String,
        path: String,
        value: String,
        expires: String
    ) {
        guard let cookie = HTTPCookie(
            properties: [
                .name: name,
                .domain: domain,
                .path: path,
                .value: value,
                .expires: expires
            ]) else { return nil }

        self.httpCookie = cookie
    }
}

