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

#import "JSQMessagesAvatarImage.h"
#import "JSQMessagesCollectionViewFlowLayout.h"


@interface JSQMessagesAvatarImageTests : XCTestCase

@end


@implementation JSQMessagesAvatarImageTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInitInvalid
{
    XCTAssertThrows([JSQMessagesAvatarImage avatarImageWithPlaceholder:nil], @"Invalid init should throw");
    XCTAssertThrows([[JSQMessagesAvatarImage alloc] initWithAvatarImageURL:nil highlightedImageURL:nil placeholderImage:nil diameter:kJSQMessagesCollectionViewAvatarSizeDefault], @"Invalid init should throw");
}

- (void)testInitValid
{
    UIImage *mockImage = [UIImage imageNamed:@"demo_avatar_jobs"];
    JSQMessagesAvatarImage *avatar = [JSQMessagesAvatarImage avatarImageWithPlaceholder:mockImage];
    XCTAssertNotNil(avatar, @"Valid init should succeed");
    
    JSQMessagesAvatarImage *avatar2 = [JSQMessagesAvatarImage avatarWithImageURL:@"https://pbs.twimg.com/profile_images/89328493/stevejobs.jpg"];
    XCTAssertNotNil(avatar2, @"Valid init should succeed");
}

- (void)testCopy
{
    UIImage *mockImage = [UIImage imageNamed:@"demo_avatar_jobs"];
    JSQMessagesAvatarImage *avatar = [[JSQMessagesAvatarImage alloc] initWithAvatarImageURL:@"https://pbs.twimg.com/profile_images/89328493/stevejobs.jpg"
                                                                        highlightedImageURL:@"https://pbs.twimg.com/profile_images/89328493/stevejobs.jpg"
                                                                           placeholderImage:mockImage
                                                                                   diameter:30.0f];

    JSQMessagesAvatarImage *copy = [avatar copy];
    XCTAssertNotNil(copy, @"Copy should succeed");
    XCTAssertFalse(avatar == copy, @"Copy should return new, distinct instance");
    XCTAssertEqual(avatar.avatarImageURL, copy.avatarImageURL, @"Image URLs should be equal");
    XCTAssertEqual(avatar.avatarHighlightedImageURL, copy.avatarHighlightedImageURL, @"Image URLs should be equal");
    XCTAssertNotEqualObjects(avatar.avatarPlaceholderImage, copy.avatarPlaceholderImage, @"Images should not be equal");
    XCTAssertNotEqual(avatar.avatarPlaceholderImage, copy.avatarPlaceholderImage, @"Images should not be equal");
}

@end
