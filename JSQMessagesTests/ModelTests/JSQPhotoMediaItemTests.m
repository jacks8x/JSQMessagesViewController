//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  MIT License
//  Copyright (c) 2014 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import <XCTest/XCTest.h>

#import "JSQPhotoMediaItem.h"


@interface JSQPhotoMediaItemTests : XCTestCase

@end


@implementation JSQPhotoMediaItemTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testPhotoItemInit
{
    JSQPhotoMediaItem *item = [[JSQPhotoMediaItem alloc] initWithImageURL:@"https://media.timeout.com/images/101714767/617/347/image.jpg"];
    XCTAssertNotNil(item);
}

- (void)testPhotoItemIsEqual
{
    JSQPhotoMediaItem *item = [[JSQPhotoMediaItem alloc] initWithImageURL:@"https://media.timeout.com/images/101714767/617/347/image.jpg"];

    JSQPhotoMediaItem *copy = [item copy];

    XCTAssertEqualObjects(item, copy, @"Copied items should be equal");

    XCTAssertEqual([item hash], [copy hash], @"Copied item hashes should be equal");

    XCTAssertEqualObjects(item, item, @"Item should be equal to itself");
}

- (void)testPhotoItemArchiving
{
    JSQPhotoMediaItem *item = [[JSQPhotoMediaItem alloc] initWithImageURL:@"https://media.timeout.com/images/101714767/617/347/image.jpg"];

    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:item];
    
    JSQPhotoMediaItem *unarchivedItem = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    XCTAssertEqualObjects(item, unarchivedItem);
}

@end
