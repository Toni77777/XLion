Getting Started
===============

XLion is simple lightweight library for REST API written in Swift.


### GET Request

// TODO Create custom GetRequest class. 
Declare request and override `restMethod` and `baseUrl`, path variables.

```swift

import XLion

final class ProfileRequest: GetRequest<ProfileCodable> {
    
    override var baseUrl: String {
        return "http://localhost:8080/"
    }

    override var path: String {
        return "profile"
    }
}
```


Also you must declare response model. The model must implement [``Codable``](https://developer.apple.com/documentation/swift/codable) protocol.

```swift

struct ProfileCodable: Codable {
    var name: String?
    var surname: String?
    var avatarUrl: String?
}
```
