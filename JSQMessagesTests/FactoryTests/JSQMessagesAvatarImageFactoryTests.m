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

#import "JSQMessagesAvatarImageFactory.h"


@interface JSQMessagesAvatarImageFactoryTests : XCTestCase
@end


@implementation JSQMessagesAvatarImageFactoryTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAvatarImageWithPlaceholder
{
    UIImage *image = [UIImage imageNamed:@"demo_avatar_jobs"];
    XCTAssertNotNil(image, @"Image should not be nil");
    
    CGFloat diameter = 50.0f;
    JSQMessagesAvatarImage *avatar = [JSQMessagesAvatarImageFactory avatarImageWithPlaceholder:image diameter:diameter];
    
    XCTAssertNotNil(avatar, @"Avatar should not be nil");
    XCTAssertTrue(CGSizeEqualToSize(avatar.avatarPlaceholderImage.size, CGSizeMake(diameter, diameter)), @"Avatar size should be equal to diameter");
    XCTAssertEqual(avatar.avatarPlaceholderImage.scale, [UIScreen mainScreen].scale, @"Avatar scale should be equal to screen scale");
    
    XCTAssertNotNil(avatar.avatarPlaceholderImage, @"Placeholder should not be nil");
}

- (void)testAvatarImageWithImageURLHighlightedImageURLPlaceholderImage
{
    UIImage *placeholder = [UIImage imageNamed:@"demo_avatar_jobs"];
    XCTAssertNotNil(placeholder, @"Image should not be nil");
    
    NSString *imageURL = @"https://pbs.twimg.com/profile_images/89328493/stevejobs.jpg";
    NSString *highlightedImageURL = @"http://celebirthdays.net/cdn/thumbs/large/steve-wozniak.jpg";
    
    CGFloat diameter = 50.0f;
    JSQMessagesAvatarImage *avatar = [JSQMessagesAvatarImageFactory avatarImageWithImageURL:imageURL highlightedImageURL:highlightedImageURL placeholderImage:placeholder diameter:diameter];
    
    XCTAssertNotNil(avatar, @"Avatar should not be nil");
    XCTAssertTrue(CGSizeEqualToSize(avatar.avatarPlaceholderImage.size, CGSizeMake(diameter, diameter)), @"Avatar size should be equal to diameter");
    XCTAssertEqual(avatar.avatarPlaceholderImage.scale, [UIScreen mainScreen].scale, @"Avatar scale should be equal to screen scale");
    XCTAssertEqual(avatar.avatarImageURL, imageURL, @"Avatar image url should be equal to imageURL");
    XCTAssertEqual(avatar.avatarHighlightedImageURL, highlightedImageURL, @"Avatar highlighted image url should be equal to highlightedImageURL");
}

- (void)testCircularAvatarImageWithDiameter
{
    UIImage *image = [UIImage imageNamed:@"demo_avatar_jobs"];
    XCTAssertNotNil(image, @"Image should not be nil");
    
    CGFloat diameter = 50.0f;
    
    UIImage *circularImage = [JSQMessagesAvatarImageFactory circularAvatarImage:image withDiameter:diameter];
    XCTAssertNotNil(circularImage, @"Circular image should not be nil");
    XCTAssertTrue(CGSizeEqualToSize(circularImage.size, CGSizeMake(diameter, diameter)), @"Avatar size should be equal to diameter");
}

- (void)testCircularAvatarHighlightedImageWithDiameter
{
    UIImage *image = [UIImage imageNamed:@"demo_avatar_jobs"];
    XCTAssertNotNil(image, @"Image should not be nil");
    
    CGFloat diameter = 50.0f;
    
    UIImage *circularImage = [JSQMessagesAvatarImageFactory circularAvatarHighlightedImage:image withDiameter:diameter];
    XCTAssertNotNil(circularImage, @"Circular image should not be nil");
    XCTAssertTrue(CGSizeEqualToSize(circularImage.size, CGSizeMake(diameter, diameter)), @"Avatar size should be equal to diameter");
}

- (void)testCircularAvatarPlaceholderImageBackgroundColorTextColorFontDiameter
{
    CGFloat diameter = 50.0f;
    UIImage *initialImage = [JSQMessagesAvatarImageFactory circularAvatarPlaceholderImage:@"TC"
                                                                                  backgroundColor:[UIColor lightGrayColor]
                                                                                        textColor:[UIColor darkGrayColor]
                                                                                             font:[UIFont systemFontOfSize:13.0f]
                                                                                         diameter:diameter];
    
    XCTAssertNotNil(initialImage, @"Image should not be nil");
    XCTAssertTrue(CGSizeEqualToSize(initialImage.size, CGSizeMake(diameter, diameter)), @"Avatar size should be equal to diameter");
}

@end
