//
//  SBTransformBoard.m
//  PuzzleGame
//
//  Created by Samuel Bowman on 6/30/17.
//  Copyright © 2017 Samuel Bowman. All rights reserved.
//

#import "SBTransformBoard.h"
#import "SBPuzzleGameEngine.h"
#import "SBPuzzlePiece.h"

@interface SBTransformBoard () {
    int _xDir;
    int _yDir;
    int _dimension;
    NSMutableArray *_puzzle;
    int _emptyIndex;
    double _pieceSize;
    int _undoCount;
}

- (void)swapIndex:(int)first withIndex:(int)second;

@end

@implementation SBTransformBoard

- (SBTransformBoard *)initWithEngine:(SBPuzzleGameEngine *)engine withXDir:(int)xDir withYDir:(int)yDir
{
    _undoCount = 0;
    _xDir = xDir;
    _yDir = yDir;
    _dimension = [engine dimension];
    _puzzle = [engine puzzle];
    _emptyIndex = [engine emptyIndex];
    _pieceSize = [engine pieceSize];
    return self;
}

- (NSMutableArray *)transform
{
    SBPuzzlePiece *emptyPiece = [_puzzle objectAtIndex:_emptyIndex];
    int newIndex;
    if(_xDir == 0)
        newIndex = (_emptyIndex+(_dimension*_yDir));
    else if(_yDir == 0)
        newIndex = (_emptyIndex-_xDir);
    else
        return _puzzle;
    
    SBPuzzlePiece *nonEmptyPiece = [_puzzle objectAtIndex:newIndex];
    double x1 = [emptyPiece xCurr];
    double y1 = [emptyPiece yCurr];
    double x2 = [nonEmptyPiece xCurr];
    double y2 = [nonEmptyPiece yCurr];
    
    CGRect destRect = CGRectMake(x1, y1, _pieceSize, _pieceSize);
    CGRect sourceRect = CGRectMake(x2, y2, _pieceSize, _pieceSize);
    
    nonEmptyPiece.frame = destRect;
    emptyPiece.frame = sourceRect;
    
    [nonEmptyPiece setXCurr:x1];
    [nonEmptyPiece setYCurr:y1];
    [emptyPiece setXCurr:x2];
    [emptyPiece setYCurr:y2];
    
    [self swapIndex:_emptyIndex withIndex:newIndex];
    
    return _puzzle;
}

- (NSMutableArray *)doInverse
{
    if(_undoCount > 0) return _puzzle;
    SBPuzzlePiece *emptyPiece = [_puzzle objectAtIndex:_emptyIndex];
    int newIndex;
    if(_xDir == 0)
        newIndex = (_emptyIndex+(_dimension*_yDir));
    else if(_yDir == 0)
        newIndex = (_emptyIndex-_xDir);
    else
        return _puzzle;
    
    SBPuzzlePiece *nonEmptyPiece = [_puzzle objectAtIndex:newIndex];
    double x1 = [emptyPiece xCurr];
    double y1 = [emptyPiece yCurr];
    double x2 = [nonEmptyPiece xCurr];
    double y2 = [nonEmptyPiece yCurr];

    CGRect emptyRect = CGRectMake(x1, y1, _pieceSize, _pieceSize);
    CGRect nonEmptyRect = CGRectMake(x2, y2, _pieceSize, _pieceSize);
    nonEmptyPiece.frame = emptyRect;
    emptyPiece.frame = nonEmptyRect;
    
    [nonEmptyPiece setXCurr:x1];
    [nonEmptyPiece setYCurr:y1];
    [emptyPiece setXCurr:x2];
    [emptyPiece setYCurr:y2];
    
    [self swapIndex:_emptyIndex withIndex:newIndex];
    _undoCount++;
    return _puzzle;
}

- (void)swapIndex:(int)first withIndex:(int)second
{
    SBPuzzlePiece *temp = [_puzzle objectAtIndex:first];
    [_puzzle replaceObjectAtIndex:first withObject:[_puzzle objectAtIndex:second]];
    [_puzzle replaceObjectAtIndex:second withObject:temp];
}

@end
