//  This file was automatically generated and should not be edited.

import Apollo

public final class PerformersQuery: GraphQLQuery {
  public let operationDefinition =
    "query Performers($id: String!) {\n  festapp(id: $id) {\n    __typename\n    name\n    startsAt\n    events {\n      __typename\n      performers {\n        __typename\n        name\n      }\n      name\n      startsAt\n    }\n  }\n}"

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
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(festapp: Festapp? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "festapp": festapp.flatMap { (value: Festapp) -> ResultMap in value.resultMap }])
    }

    public var festapp: Festapp? {
      get {
        return (resultMap["festapp"] as? ResultMap).flatMap { Festapp(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "festapp")
      }
    }

    public struct Festapp: GraphQLSelectionSet {
      public static let possibleTypes = ["FestApp"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("startsAt", type: .scalar(String.self)),
        GraphQLField("events", type: .list(.object(Event.selections))),
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
  }
}