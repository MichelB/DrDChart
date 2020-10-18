// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetRecipesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetRecipes($page: Int!, $pageSize: Int!) {
      listRecipes(input: {page: $page, includePremiumPreview: true, pageSize: $pageSize}) {
        __typename
        recipes {
          __typename
          id
          title
          description
          nutrition {
            __typename
            values {
              __typename
              carbs
              fat
              protein
              calories
              fiber
            }
            percentages {
              __typename
              carbs
              fat
              protein
            }
          }
        }
        nextPage
      }
    }
    """

  public let operationName: String = "GetRecipes"

  public var page: Int
  public var pageSize: Int

  public init(page: Int, pageSize: Int) {
    self.page = page
    self.pageSize = pageSize
  }

  public var variables: GraphQLMap? {
    return ["page": page, "pageSize": pageSize]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("listRecipes", arguments: ["input": ["page": GraphQLVariable("page"), "includePremiumPreview": true, "pageSize": GraphQLVariable("pageSize")]], type: .nonNull(.object(ListRecipe.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(listRecipes: ListRecipe) {
      self.init(unsafeResultMap: ["__typename": "Query", "listRecipes": listRecipes.resultMap])
    }

    public var listRecipes: ListRecipe {
      get {
        return ListRecipe(unsafeResultMap: resultMap["listRecipes"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "listRecipes")
      }
    }

    public struct ListRecipe: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ListRecipesResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("recipes", type: .nonNull(.list(.object(Recipe.selections)))),
          GraphQLField("nextPage", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(recipes: [Recipe?], nextPage: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "ListRecipesResponse", "recipes": recipes.map { (value: Recipe?) -> ResultMap? in value.flatMap { (value: Recipe) -> ResultMap in value.resultMap } }, "nextPage": nextPage])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of recipes.
      public var recipes: [Recipe?] {
        get {
          return (resultMap["recipes"] as! [ResultMap?]).map { (value: ResultMap?) -> Recipe? in value.flatMap { (value: ResultMap) -> Recipe in Recipe(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Recipe?) -> ResultMap? in value.flatMap { (value: Recipe) -> ResultMap in value.resultMap } }, forKey: "recipes")
        }
      }

      /// Token to retrieve the next page of results, or empty if there are no
      /// more results in the list.
      public var nextPage: Int? {
        get {
          return resultMap["nextPage"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "nextPage")
        }
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Recipe"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("nutrition", type: .nonNull(.object(Nutrition.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String, description: String, nutrition: Nutrition) {
          self.init(unsafeResultMap: ["__typename": "Recipe", "id": id, "title": title, "description": description, "nutrition": nutrition.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A unique identifier.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The title of the recipe.
        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// The desctiption of the recipe.
        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// The nutritional value of the recipe.
        public var nutrition: Nutrition {
          get {
            return Nutrition(unsafeResultMap: resultMap["nutrition"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "nutrition")
          }
        }

        public struct Nutrition: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Nutrition"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("values", type: .nonNull(.object(Value.selections))),
              GraphQLField("percentages", type: .nonNull(.object(Percentage.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(values: Value, percentages: Percentage) {
            self.init(unsafeResultMap: ["__typename": "Nutrition", "values": values.resultMap, "percentages": percentages.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The nutritional values
          public var values: Value {
            get {
              return Value(unsafeResultMap: resultMap["values"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "values")
            }
          }

          /// The nutritional percentages
          public var percentages: Percentage {
            get {
              return Percentage(unsafeResultMap: resultMap["percentages"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "percentages")
            }
          }

          public struct Value: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["NutritionValues"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("carbs", type: .nonNull(.scalar(Double.self))),
                GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
                GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
                GraphQLField("calories", type: .nonNull(.scalar(Double.self))),
                GraphQLField("fiber", type: .scalar(Double.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(carbs: Double, fat: Double, protein: Double, calories: Double, fiber: Double? = nil) {
              self.init(unsafeResultMap: ["__typename": "NutritionValues", "carbs": carbs, "fat": fat, "protein": protein, "calories": calories, "fiber": fiber])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The carbs
            public var carbs: Double {
              get {
                return resultMap["carbs"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "carbs")
              }
            }

            /// The fat
            public var fat: Double {
              get {
                return resultMap["fat"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "fat")
              }
            }

            /// The protein
            public var protein: Double {
              get {
                return resultMap["protein"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "protein")
              }
            }

            /// The calories
            public var calories: Double {
              get {
                return resultMap["calories"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "calories")
              }
            }

            public var fiber: Double? {
              get {
                return resultMap["fiber"] as? Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "fiber")
              }
            }
          }

          public struct Percentage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["NutritionPercentages"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("carbs", type: .nonNull(.scalar(Double.self))),
                GraphQLField("fat", type: .nonNull(.scalar(Double.self))),
                GraphQLField("protein", type: .nonNull(.scalar(Double.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(carbs: Double, fat: Double, protein: Double) {
              self.init(unsafeResultMap: ["__typename": "NutritionPercentages", "carbs": carbs, "fat": fat, "protein": protein])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var carbs: Double {
              get {
                return resultMap["carbs"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "carbs")
              }
            }

            public var fat: Double {
              get {
                return resultMap["fat"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "fat")
              }
            }

            public var protein: Double {
              get {
                return resultMap["protein"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "protein")
              }
            }
          }
        }
      }
    }
  }
}
