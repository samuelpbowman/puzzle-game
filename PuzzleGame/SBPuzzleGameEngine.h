//
//  SBPuzzleGameEngine.h
//  PuzzleGame
//
//  Created by Samuel Bowman on 6/24/17.
//  Copyright © 2017 Samuel Bowman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SBPuzzleGameEngine : NSObject

@property int moves;
@property int dimension;
@property int emptyIndex;
@property double pieceSize;
@property (strong, nonatomic) NSMutableArray *puzzle;

- (SBPuzzleGameEngine *)initEngine:(UIImage *)image withDimension:(int)dimension withSize:(double)size;
- (void)moveUp;
- (void)moveDown;
- (void)moveLeft;
- (void)moveRight;
- (void)undoLastMove;
- (BOOL)isVictorious;

@end
