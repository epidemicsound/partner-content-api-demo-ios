import Foundation
import AppAuthCore
import AppAuth

class AuthService {
    
    let onSuccess: (String) -> Void
    
    init(onSuccess: @escaping (String) -> Void) {
        self.onSuccess = onSuccess
    }
    
    private var userAgentSession: OIDExternalUserAgentSession?
    private var oidAgent: OIDExternalUserAgentIOS? = nil
    
    private var accessToken: String?
    
    func auth() {
        let authorizationEndpoint = URL(string: "https://dev-auth-keycloak.epidemicsite.com/auth/realms/epidemic-dev-realm/protocol/openid-connect/auth")!
        let tokenEndpoint = URL(string: "https://dev-auth-keycloak.epidemicsite.com/auth/realms/epidemic-dev-realm/protocol/openid-connect/token")!
        let configuration = OIDServiceConfiguration(authorizationEndpoint: authorizationEndpoint,
                                                    tokenEndpoint: tokenEndpoint)
        
        let request = OIDAuthorizationRequest(configuration: configuration,
                                              clientId: "papi-development-external-0af9cb57-0e5e-49ac-8bdf-f4cfcc127f73",
                                              clientSecret: nil,
                                              scopes: nil,
                                              redirectURL: URL(string: "com.epidemicsound.partner-content-api-demo-ios:/oauthredirect")!,
                                              responseType: OIDResponseTypeCode,
                                              additionalParameters: nil)
        // performs authentication request
        print("Initiating authorization request with scope: \(request.scope ?? "nil")")
        
        
        DispatchQueue.main.async {
            self.oidAgent = OIDExternalUserAgentIOS(presenting: self.getHostingViewController())
            self.userAgentSession = OIDAuthorizationService.present(request, externalUserAgent: self.oidAgent!, callback: self.handleAuthorizationResponse)
        }
    }
    
    func getAccessToken() -> String? {
        return accessToken
    }
    
    private func getHostingViewController() -> UIViewController {
        return UIApplication.shared.windows.first!.rootViewController!
    }

    private func handleAuthorizationResponse(authorizationResponse: Optional<OIDAuthorizationResponse>, error: Optional<Error>) {
        
        print("Response \(String(describing: authorizationResponse))")
        print("Error \(String(describing: error))")
        
        guard let tokenRequest = authorizationResponse?.tokenExchangeRequest() else {
            print("No token request!")
            return
        }
            
        DispatchQueue.main.async {
            OIDAuthorizationService.perform(tokenRequest) { tokenResponse, error in
                                
                print("Token response \(String(describing: tokenResponse))")
                print("Token response error \(String(describing: error))")
                print("Access token: " + (tokenResponse!.accessToken)!)
                
                self.accessToken = tokenResponse!.accessToken
                
                if(tokenResponse!.accessToken != nil) {
                    self.onSuccess(tokenResponse!.accessToken!)
                }
            }
        }
    }
}
