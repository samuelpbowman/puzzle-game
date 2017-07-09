//
//  SBPuzzlePiece.m
//  CatPuzzle
//
//  Created by Samuel Bowman on 6/19/17.
//  Copyright © 2017 Samuel Bowman. All rights reserved.
//

#import "SBPuzzlePiece.h"

@implementation SBPuzzlePiece

//@synthesize xCurr;
//@synthesize yCurr;

- (SBPuzzlePiece *)initWithPicture:(UIImage *)image withDestX:(double)destX withDestY:(double)destY
{
    self = [super initWithImage:image];
    self.xDest = destX;
    self.yDest = destY;
    self.xCurr = destX;
    self.yCurr = destY;
    return self;
}

@end
