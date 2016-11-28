//
// Created by Thomas Christensen on 26/08/16.
// Copyright (c) 2016 Sebastian Kreutzberger. All rights reserved.
//

import Foundation

open class ReaderBuilder {

    public enum ReaderBuilderError: Error {
        case illegalReference(reference:String)
    }

    public enum ReaderTypes {
        case stringreader, httpreader, filereader
    }

    static func createURLReader(reference: URL) -> BufferedReader {
        return URLBufferedReader(uri: reference)
    }

    static func createStringReader(reference: String) -> BufferedReader {
        return StringBufferedReader(string: reference)
    }

    static func createFileReader(reference: String) -> BufferedReader? {
        return FileBufferedReader(path: reference)
    }

    static func createReader(reader: ReaderTypes, reference: String) throws -> BufferedReader {

        switch reader {
        case .stringreader:
            return StringBufferedReader(string: reference)
        case .filereader:
            return FileBufferedReader(path: reference)
        case .httpreader:
            if let uriOK = URL(string: reference) {
                return URLBufferedReader(uri: uriOK)
            } else {
                throw ReaderBuilderError.illegalReference(reference: reference)
            }
        }
    }
}
