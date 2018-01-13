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
        var high: Double?
        var medium: Double?
        var low: Double?
        
        var availableBandwidths: [Double] = [Double]()

        for playlist in playlists {
            if let bandwidth = playlist.bandwidth {
                availableBandwidths.append(bandwidth)
            }
        }
        
        let sortedArray: [Double] = availableBandwidths.sorted { (a, b) -> Bool in
            a < b
        }

        if let firstElement = sortedArray.first {
            low = firstElement
        }

        if let lastElement = sortedArray.last {
            high = lastElement
        }

        let totalBandwidths = sortedArray.count

        if totalBandwidths - 2 > 0 {
            medium = sortedArray[totalBandwidths - 2]
        }
        return VarientMetadata(high: high, medium: medium, low: low)
    }
}
