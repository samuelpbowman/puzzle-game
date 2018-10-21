//
//  SBTransformBoard.h
//  PuzzleGame
//
//  Created by Samuel Bowman on 6/30/17.
//  Copyright © 2017 Samuel Bowman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SBPuzzleGameEngine;

@interface SBTransformBoard : NSObject

- (SBTransformBoard *)initWithEngine:(SBPuzzleGameEngine *)engine withXDir:(int)xDir withYDir:(int)yDir;
- (NSMutableArray *)transform;
- (NSMutableArray *)doInverse;

@end
