//  This file was automatically generated and should not be edited.

import Apollo

public final class PerformersQuery: GraphQLQuery {
  public let operationDefinition =
    "query Performers($id: String!) {\n  festapp(id: $id) {\n    __typename\n    name\n    startsAt\n    events(per: 5000, sortBy: \"startsAt\") {\n      __typename\n      performers {\n        __typename\n        name\n      }\n      name\n      startsAt\n    }\n  }\n  me {\n    __typename\n    id\n    email\n    profileImage\n    app {\n      __typename\n      id\n    }\n  }\n}"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("festapp", arguments: ["id": GraphQLVariable("id")], type: .object(Festapp.selections)),
      GraphQLField("me", type: .object(Me.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(festapp: Festapp? = nil, me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "festapp": festapp.flatMap { (value: Festapp) -> ResultMap in value.resultMap }, "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var festapp: Festapp? {
      get {
        return (resultMap["festapp"] as? ResultMap).flatMap { Festapp(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "festapp")
      }
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Festapp: GraphQLSelectionSet {
      public static let possibleTypes = ["FestApp"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("startsAt", type: .scalar(String.self)),
        GraphQLField("events", arguments: ["per": 5000, "sortBy": "startsAt"], type: .list(.object(Event.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, startsAt: String? = nil, events: [Event?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "FestApp", "name": name, "startsAt": startsAt, "events": events.flatMap { (value: [Event?]) -> [ResultMap?] in value.map { (value: Event?) -> ResultMap? in value.flatMap { (value: Event) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var startsAt: String? {
        get {
          return resultMap["startsAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "startsAt")
        }
      }

      public var events: [Event?]? {
        get {
          return (resultMap["events"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Event?] in value.map { (value: ResultMap?) -> Event? in value.flatMap { (value: ResultMap) -> Event in Event(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Event?]) -> [ResultMap?] in value.map { (value: Event?) -> ResultMap? in value.flatMap { (value: Event) -> ResultMap in value.resultMap } } }, forKey: "events")
        }
      }

      public struct Event: GraphQLSelectionSet {
        public static let possibleTypes = ["Event"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("performers", type: .list(.object(Performer.selections))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("startsAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(performers: [Performer?]? = nil, name: String? = nil, startsAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Event", "performers": performers.flatMap { (value: [Performer?]) -> [ResultMap?] in value.map { (value: Performer?) -> ResultMap? in value.flatMap { (value: Performer) -> ResultMap in value.resultMap } } }, "name": name, "startsAt": startsAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var performers: [Performer?]? {
          get {
            return (resultMap["performers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Performer?] in value.map { (value: ResultMap?) -> Performer? in value.flatMap { (value: ResultMap) -> Performer in Performer(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Performer?]) -> [ResultMap?] in value.map { (value: Performer?) -> ResultMap? in value.flatMap { (value: Performer) -> ResultMap in value.resultMap } } }, forKey: "performers")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var startsAt: String? {
          get {
            return resultMap["startsAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "startsAt")
          }
        }

        public struct Performer: GraphQLSelectionSet {
          public static let possibleTypes = ["Performer"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Performer", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(String.self)),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("profileImage", type: .scalar(String.self)),
        GraphQLField("app", type: .object(App.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, email: String? = nil, profileImage: String? = nil, app: App? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "profileImage": profileImage, "app": app.flatMap { (value: App) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String? {
        get {
          return resultMap["id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var profileImage: String? {
        get {
          return resultMap["profileImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profileImage")
        }
      }

      public var app: App? {
        get {
          return (resultMap["app"] as? ResultMap).flatMap { App(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "app")
        }
      }

      public struct App: GraphQLSelectionSet {
        public static let possibleTypes = ["App"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "App", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}