//
//  MasterPlaylist.swift
//  Pantomime
//
//  Created by Thomas Christensen on 25/08/16.
//  Copyright © 2016 Sebastian Kreutzberger. All rights reserved.
//

import Foundation

open class MasterPlaylist {
    var playlists = [MediaPlaylist]()
    open var path: String?

    public init() {}

    open func addPlaylist(_ playlist: MediaPlaylist) {
        playlists.append(playlist)
    }

    open func getPlaylist(_ index: Int) -> MediaPlaylist? {
        if index >= playlists.count {
            return nil
        }
        return playlists[index]
    }

    open func getPlaylistCount() -> Int {
        return playlists.count
    }

    open func availableVarientMetadata() -> VarientMetadata {
        var high: Double = 0
        var medium: Double = 0
        var low: Double = 0

        let bandwidths: [Double] = playlists.map { (mediaPlaylist: MediaPlaylist) -> Double in
            return mediaPlaylist.bandwidth
        }
        .sorted { (a, b) -> Bool in
            return a < b
        }

        if let firstElement = bandwidths.first {
            low = firstElement
        }

        if let lastElement = bandwidths.last {
            high = lastElement
        }

        let totalBandwidths = bandwidths.count

        if totalBandwidths - 2 > 0 {
            medium = bandwidths[totalBandwidths - 2]
        }
        return VarientMetadata(high: high, medium: medium, low: low)
    }
}
