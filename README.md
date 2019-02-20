# Making your first GraphQL iOS App
## 📈💖🍏

## Client Setup
**Install Apollo**

> `npm install -g apollo`
> `npm install -g apollo-codegen`

**Setup Project**
>- run `gem install cocoapods`
>- make a new iOS project
>- Add Apollo's GraphQL pod to your podfile
>- `cd newProjectName`
>- run `pod install`

**Grab schema from your endpoint**
>- In this case I will grab it from the production endpoint
>
> `
apollo schema:download --endpoint=https://api.aloompa.com/graphql schema.json`
>- get or make your .graphql file 
>
> `touch queries.graphql`
> 
> `vim queries.graphql`
>- ### 👩‍🏫 learn vim
```
query Performers  { 
        festapp(id: "230") {
            name
            startsAt
            endsAt
            eventSchedulesCount
            performers {
                  id
                  name
                  categories {
                    id,
                    name,
                  }
                  events {
                    startsAt
                    endsAt
                    stage {
                      name
                    }
                  }
        }
  }
}
```
>- Generate your api code 😮
>
>`apollo-codegen generate **/*.graphql --schema schema.json --output API.swift`
>- Add *queries.graphql and API.swift* to your xcodeworkspace
>- app delegate code 

```
import UIKit
import Apollo

// Change localhost to your machine's local IP address when running from a device
let apollo = ApolloClient(url: URL(string: "http://localhost:9000/graphql")!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        apollo.cacheKeyForObject = { $0["id"] }
        return true
    }
}
```

**Running GQL server locally** *(optional)*
> `cd ~/`

> `mkdir aloompaApis`

> `cd aloompaApis`

> `git clone git@github.com:Aloompa/aloompa-api-graphql.git`

> `git clone git@github.com:Aloompa/citizen-users-api.git`

> `git@github.com:Aloompa/festapi-graphql.git`

> run `npm i` in all directories

> cd `aloompa-api-graphql`

> run `npm run start:local` or `python start.py`

> Should be running on **Port 9000**

## Why we are here

```
   func loadData() {
        watcher = apollo.watch(query: PerformersQuery()) { (result, error) in
            if let error = error {
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            }
            // some lazy global variable should do
            self.festapp = result?.data?.festapp
        }
    }
```

