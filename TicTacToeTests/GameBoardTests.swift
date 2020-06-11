//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Harmony Radley on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    // With any functional tests, be sure to name it with test...
    func testCreatingEmptyBoard() {
        let board = GameBoard()

        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x, y)])
            }
        }
    }

    func testPlacingMarks() {
        var board = GameBoard()

        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0, 0)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2, 2)], .x)

        // This ensures all other spaces in the board are nil (empty)
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 { continue }
                if x == 2 && y == 2 { continue }
                XCTAssertNil(board[(x, y)])
            }
        }

        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { error in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
    }

    func testIsFull() {
        
    }

}
