//
//  SBPuzzlePiece.h
//  CatPuzzle
//
//  Created by Samuel Bowman on 6/19/17.
//  Copyright © 2017 Samuel Bowman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBPuzzlePiece : UIImageView

@property double xDest;
@property double yDest;
@property double xCurr;
@property double yCurr;
@property BOOL movable;

- (SBPuzzlePiece *)initWithPicture:(UIImage *)image withDestX:(double)destX withDestY:(double)destY;

//- (void)flipMovability;
//- (BOOL)isBlank;

@end
