//
//  Network.swift
//  PieChart
//
//  Created by Michel Bardawil on 16/10/2020.
//  Copyright © 2020 TNODA.com. All rights reserved.
//
import Apollo
import Foundation
class Network {
  static let shared = Network()
  
  private(set) lazy var apollo: ApolloClient = {
      // The cache is necessary to set up the store, which we're going to hand to the provider
      let cache = InMemoryNormalizedCache()
      let store = ApolloStore(cache: cache)
      
      let client = URLSessionClient()
      let provider = NetworkInterceptorProvider(store: store, client: client)
      let url = URL(string: "https://ddapi.production.dietdoctor.com/v1")!

      let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                               endpointURL: url)
                                                               

      // Remember to give the store you already created to the client so it
      // doesn't create one on its own
      return ApolloClient(networkTransport: requestChainTransport,
                          store: store)
  }()
}
