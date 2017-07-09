//
//  SBPuzzleinator.h
//  CatPuzzle
//
//  Created by Samuel Bowman on 6/11/17.
//  Copyright © 2017 Samuel Bowman. All rights reserved.
//

#include <time.h>
#include <stdlib.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SBPuzzleinator : NSObject

+ (NSMutableArray *)generatePuzzle:(UIImage *)image withDimension:(int)dimension
                      withFullSize:(double)fullSize;
+ (NSMutableArray *)fisherYates:(NSMutableArray *)array withDimension:(int)dimension withPieceSize:(double)pieceSize;

@end
