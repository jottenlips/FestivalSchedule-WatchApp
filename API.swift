//  This file was automatically generated and should not be edited.

import Apollo

public final class PerformersQuery: GraphQLQuery {
  public let operationDefinition =
    "query Performers {\n  festapp(id: \"754\") {\n    __typename\n    name\n    startsAt\n    endsAt\n    eventSchedulesCount\n    eventsCount\n    events {\n      __typename\n      performers {\n        __typename\n        name\n      }\n      name\n      startsAt\n    }\n    performers {\n      __typename\n      id\n      name\n      categories {\n        __typename\n        id\n        name\n      }\n      events {\n        __typename\n        startsAt\n        endsAt\n        stage {\n          __typename\n          name\n        }\n      }\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("festapp", arguments: ["id": "754"], type: .object(Festapp.selections)),
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
        GraphQLField("endsAt", type: .scalar(String.self)),
        GraphQLField("eventSchedulesCount", type: .scalar(Int.self)),
        GraphQLField("eventsCount", type: .scalar(Int.self)),
        GraphQLField("events", type: .list(.object(Event.selections))),
        GraphQLField("performers", type: .list(.object(Performer.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, startsAt: String? = nil, endsAt: String? = nil, eventSchedulesCount: Int? = nil, eventsCount: Int? = nil, events: [Event?]? = nil, performers: [Performer?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "FestApp", "name": name, "startsAt": startsAt, "endsAt": endsAt, "eventSchedulesCount": eventSchedulesCount, "eventsCount": eventsCount, "events": events.flatMap { (value: [Event?]) -> [ResultMap?] in value.map { (value: Event?) -> ResultMap? in value.flatMap { (value: Event) -> ResultMap in value.resultMap } } }, "performers": performers.flatMap { (value: [Performer?]) -> [ResultMap?] in value.map { (value: Performer?) -> ResultMap? in value.flatMap { (value: Performer) -> ResultMap in value.resultMap } } }])
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

      public var endsAt: String? {
        get {
          return resultMap["endsAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "endsAt")
        }
      }

      public var eventSchedulesCount: Int? {
        get {
          return resultMap["eventSchedulesCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "eventSchedulesCount")
        }
      }

      public var eventsCount: Int? {
        get {
          return resultMap["eventsCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "eventsCount")
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

      public var performers: [Performer?]? {
        get {
          return (resultMap["performers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Performer?] in value.map { (value: ResultMap?) -> Performer? in value.flatMap { (value: ResultMap) -> Performer in Performer(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Performer?]) -> [ResultMap?] in value.map { (value: Performer?) -> ResultMap? in value.flatMap { (value: Performer) -> ResultMap in value.resultMap } } }, forKey: "performers")
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

      public struct Performer: GraphQLSelectionSet {
        public static let possibleTypes = ["Performer"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("categories", type: .list(.object(Category.selections))),
          GraphQLField("events", type: .list(.object(Event.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, name: String? = nil, categories: [Category?]? = nil, events: [Event?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Performer", "id": id, "name": name, "categories": categories.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, "events": events.flatMap { (value: [Event?]) -> [ResultMap?] in value.map { (value: Event?) -> ResultMap? in value.flatMap { (value: Event) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
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

        public var categories: [Category?]? {
          get {
            return (resultMap["categories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Category?] in value.map { (value: ResultMap?) -> Category? in value.flatMap { (value: ResultMap) -> Category in Category(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, forKey: "categories")
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

        public struct Category: GraphQLSelectionSet {
          public static let possibleTypes = ["PerformerCategory"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PerformerCategory", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
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

        public struct Event: GraphQLSelectionSet {
          public static let possibleTypes = ["Event"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("startsAt", type: .scalar(String.self)),
            GraphQLField("endsAt", type: .scalar(String.self)),
            GraphQLField("stage", type: .object(Stage.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(startsAt: String? = nil, endsAt: String? = nil, stage: Stage? = nil) {
            self.init(unsafeResultMap: ["__typename": "Event", "startsAt": startsAt, "endsAt": endsAt, "stage": stage.flatMap { (value: Stage) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          public var endsAt: String? {
            get {
              return resultMap["endsAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endsAt")
            }
          }

          public var stage: Stage? {
            get {
              return (resultMap["stage"] as? ResultMap).flatMap { Stage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "stage")
            }
          }

          public struct Stage: GraphQLSelectionSet {
            public static let possibleTypes = ["Stage"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Stage", "name": name])
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
}