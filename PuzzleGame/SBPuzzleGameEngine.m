//
//  SBPuzzleGameEngine.m
//  PuzzleGame
//
//  Created by Samuel Bowman on 6/24/17.
//  Copyright © 2017 Samuel Bowman. All rights reserved.
//

#import "SBPuzzleGameEngine.h"
#import "SBTransformBoard.h"
#import "SBPuzzleinator.h"
#import "SBPuzzlePiece.h"

@interface SBPuzzleGameEngine () {
    double _boardSize;
    SBPuzzlePiece *_emptyPiece;
    SBTransformBoard *_transform;
}

- (UIImage *)scaleImage:(UIImage *)image toSize:(double)size;
- (int)findEmptyPiece;

@end

@implementation SBPuzzleGameEngine

- (SBPuzzleGameEngine *)initEngine:(UIImage *)image withDimension:(int)dimension withSize:(double)size
{
    _boardSize = size;
    self.dimension = dimension;
    self.moves = 0;
    UIImage *newImage = [self scaleImage:image toSize:size];
    NSMutableArray *puzzle = [SBPuzzleinator generatePuzzle:newImage withDimension:dimension withFullSize:size];
    _emptyPiece = [puzzle objectAtIndex:(dimension-1)];
    self.puzzle = [SBPuzzleinator fisherYates:puzzle withDimension:dimension withPieceSize:(size/dimension)];
    self.emptyIndex = [self findEmptyPiece];
    self.pieceSize = _boardSize / dimension;
    return self;
}

- (void)moveUp
{
    _transform = [[SBTransformBoard alloc] initWithEngine:self withXDir:0 withYDir:1];
    if(_emptyIndex / _dimension == (_dimension-1)) return;
    self.puzzle = [_transform transform];
    self.emptyIndex = [self findEmptyPiece];
}

- (void)moveDown
{
    _transform = [[SBTransformBoard alloc] initWithEngine:self withXDir:0 withYDir:-1];
    if(_emptyIndex / _dimension == 0) return;
    self.puzzle = [_transform transform];
    self.emptyIndex = [self findEmptyPiece];
}

- (void)moveLeft
{
    _transform = [[SBTransformBoard alloc] initWithEngine:self withXDir:-1 withYDir:0];
    if(_emptyIndex % _dimension == (_dimension-1)) return;
    self.puzzle = [_transform transform];
    self.emptyIndex = [self findEmptyPiece];
}

- (void)moveRight
{
    _transform = [[SBTransformBoard alloc] initWithEngine:self withXDir:1 withYDir:0];
    if(_emptyIndex % _dimension == 0) return;
    self.puzzle = [_transform transform];
    self.emptyIndex = [self findEmptyPiece];
}

- (void)undoLastMove
{
    [_transform doInverse];
}

- (UIImage *)scaleImage:(UIImage *)image toSize:(double)size
{
    CGRect rect = CGRectMake(0, 0, size, size);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(newImage);
    UIImage *finalImage = [UIImage imageWithData:imageData];
    return finalImage;
}

- (int)findEmptyPiece
{
    int i = 0;
    for(SBPuzzlePiece *piece in _puzzle) {
        if([piece isEqual:_emptyPiece]) return i;
        i++;
    }
    return -1;
}

- (BOOL)isVictorious
{
    for(SBPuzzlePiece *piece in _puzzle) {
        if([piece xCurr] != [piece xDest] || [piece yCurr] != [piece yDest])
            return NO;
    }
    return YES;
}

@end
