import Foundation
import AppAuthCore
import AppAuth


class CollectionTracksViewModel: ObservableObject {
    private let player = Player()
    private let audioContentProvider = AudioContentProvider()
    let collectionTitle: String
    let tracks: [Track]?
    @Published var hlsTrackResponse: HLSTrackResponse? = nil
    private var userAgentSession: OIDExternalUserAgentSession?
    private var oidAgent: OIDExternalUserAgentIOS? = nil

    internal init(collectionTitle: String, tracks: [Track]?) {
        self.collectionTitle = collectionTitle
        self.tracks = tracks
        
        self.auth()
    }
    
    func auth() {
        let authorizationEndpoint = URL(string: "https://dev-auth-keycloak.epidemicsite.com/auth/realms/partner/protocol/openid-connect/auth")!
        let tokenEndpoint = URL(string: "https://dev-auth-keycloak.epidemicsite.com/auth/realms/partner/protocol/openid-connect/token")!
        let configuration = OIDServiceConfiguration(authorizationEndpoint: authorizationEndpoint,
                                                    tokenEndpoint: tokenEndpoint)
        
        let request = OIDAuthorizationRequest(configuration: configuration,
clientId: "partner-client-with-pkce",
                                              clientSecret: nil,
                                              scopes: nil,
                                              redirectURL: URL(string: "com.epidemicsound.partner-content-api-demo-ios:/oauthredirect")!,
                                              responseType: OIDResponseTypeCode,
                                              additionalParameters: nil)
        // performs authentication request
        print("Initiating authorization request with scope: \(request.scope ?? "nil")")
        
        oidAgent = OIDExternalUserAgentIOS(presenting: getHostingViewController())
        DispatchQueue.main.async {
            self.userAgentSession = OIDAuthorizationService.present(request, externalUserAgent: self.oidAgent!, callback: self.handleAuthorizationResponse)
        }
    }

    func didSelectTrack(track: Track) {
        PartnerContentAPI().getHLSTrack(id: track.id,
            hlsTrackCompletionHandler: {
                hlsTrackResponse, error in

                if let hlsTrackResponse = hlsTrackResponse {
                    DispatchQueue.main.async {
                        self.hlsTrackResponse = hlsTrackResponse
                        guard let trackURL = URL(string: hlsTrackResponse.url) else {
                            return
                        }
                        guard let signedCookie = SignedCookie(
                            name: hlsTrackResponse.cookie.name,
                            domain: hlsTrackResponse.cookie.domain,
                            path: hlsTrackResponse.cookie.path,
                            value: hlsTrackResponse.cookie.value,
                            expires: hlsTrackResponse.cookie.expires
                        ) else {
                            return
                        }
                        guard let avItem = self.audioContentProvider.avItem(for: TrackResource(
                            id: track.id,
                            name: track.title,
                            url: trackURL,
                            signedCookie: signedCookie
                        )) else {
                            return
                        }
                        self.player.play(avItem)
                    }
                }
            }
        )
    }

    private func getHostingViewController() -> UIViewController {
        return UIApplication.shared.windows.first!.rootViewController!
    }

    private func handleAuthorizationResponse(authorizationResponse: Optional<OIDAuthorizationResponse>, error: Optional<Error>) {
        print("Hello \(error)")
        print("Response \(authorizationResponse)")
        guard let tokenRequest = authorizationResponse?.tokenExchangeRequest() else {
            print("No token request!")
            return
        }
            
        DispatchQueue.main.async {
            OIDAuthorizationService.perform(tokenRequest) { tokenResponse, error in
                print("Token response \(tokenResponse)")
                print("Token response error \(error)")
            }
        }
    }
}
