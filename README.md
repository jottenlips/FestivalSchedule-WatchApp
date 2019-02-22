# Making a GraphQL/Aloompa Api iOS App
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
query Performers($id: String!)  {
        festapp(id: $id) {
            name
            startsAt
            events {
                performers {
                    name
                }
                name
                startsAt
            }
  }
}

```
>- Generate your api code 😮
>
>`apollo-codegen generate **/*.graphql --schema schema.json --output API.swift`
>- Add *queries.graphql and API.swift* to your xcodeworkspace
>- Apollo code to add to your class or delegate

```
import Apollo

var 👩‍🚀: ApolloClient {
    return configureApollo()
}

func configureApollo() -> ApolloClient {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = CONFIG_HEADERS;
    let url = URL(string: "https://api.aloompa.com/graphql")!
    let 👩‍🚀 = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    👩‍🚀.cacheKeyForObject = { $0["id"] }
    return 👩‍🚀;
}

}
```
>- config.swift 

```
let CONFIG_HEADERS = ["applicationtoken": "", "authorization": ""]
```

**Running GQL server locally** *(optional)*
> `cd ~/`

> `mkdir aloompaApis`

> `cd aloompaApis`

> `git clone git@github.com:Aloompa/aloompa-api-graphql.git`

> `git clone git@github.com:Aloompa/citizen-users-api.git`

> `git clone git@github.com:Aloompa/festapi-graphql.git`

> run `npm i` in all directories

> cd `aloompa-api-graphql`

> run `npm run start:local` or `python start.py`

> Should be running on **Port 9000**

## Why we are here

```
   func loadData() {
   let watcher = apollo.watch(query: PerformersQuery(id: someIdString)) { (result, error) in
            if let error = error {
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            }
            // some lazy global variable should do
            self.festapp = result?.data?.festapp
        }
    }
```
