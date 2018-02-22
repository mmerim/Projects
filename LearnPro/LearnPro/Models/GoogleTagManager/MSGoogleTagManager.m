//
//  MSGoogleTagManager.m
//  MegaShopping
//
//  Created by Megatex on 11/28/16.
//  Copyright © 2016 Gor Hakobyan. All rights reserved.
//

#import "MSGoogleTagManager.h"


//#import "TAGContainer.h"
//#import "TAGContainerOpener.h"
//#import "TAGManager.h"
//#import "TAGDataLayer.h"

//NSString *const kMSGTMEcommerceListShop = @"Shop";
//NSString *const kMSGTMEcommerceListSearch = @"Search";
//NSString *const kMSGTMEcommerceListUserPosts = @"User Posts";
//NSString *const kMSGTMEcommerceListUserLikes = @"User Likes";
//NSString *const kMSGTMEcommerceListUserProducts = @"User Products";
//NSString *const kMSGTMEcommerceListUserProductsAdd = @"User Products Add";
//NSString *const kMSGTMEcommerceListRelatedPosts = @"Related Posts";
//NSString *const kMSGTMEcommerceListRelatedItems = @"Related Products";
//NSString *const kMSGTMEcommerceListDiscover = @"Discover";
//NSString *const kMSGTMEcommerceListPost = @"Post";
//NSString *const kMSGTMEcommerceListPostAdd = @"Post Add";
//NSString *const kMSGTMEcommerceListBrandProducts = @"Brand Products";
//
//NSUInteger const kMSGTMEcommerceCheckoutStepReviewCart = 1;
//NSUInteger const kMSGTMEcommerceCheckoutStepShippingPaymentInfo = 2;
//NSUInteger const kMSGTMEcommerceCheckoutStepPurchaseCompleted = 3;
//
//NSString *const kMSGTMEcommerceAffiliationOnlineStore = @"Online Store";
//
//static NSString *const kMSGTMEcommerceCurrencyCode = @"USD";
//
//@interface MSGoogleTagManager () <TAGContainerOpenerNotifier>
//
//@property (nonatomic, strong, readwrite) TAGManager *tagManager;
//@property (nonatomic, strong, readwrite) TAGContainer *container;
//
//@property (nonatomic, copy) NSString *currentScreen;
//
//@property (nonatomic, strong) NSMutableArray *impressionProducts;
//
//@property (nonatomic, assign) NSUInteger currentStep;
//
//@end
//
@implementation MSGoogleTagManager
//
//+ (instancetype)sharedInstance {
//    static MSGoogleTagManager *sharedTagManager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedTagManager = [[self alloc] init];
//    });
//    return sharedTagManager;
//}
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        self.tagManager = [TAGManager instance];
//        
//        // Optional: Change the LogLevel to Verbose to enable logging at VERBOSE and higher levels.
//        //        [self.tagManager.logger setLogLevel:kTAGLoggerLogLevelVerbose];
//        [self.tagManager.logger setLogLevel:kTAGLoggerLogLevelError];
//        
//        self.impressionProducts = [[NSMutableArray alloc] init];
//    }
//    return self;
//}
//
//+ (void)startWithContainerId:(NSString *)containerId {
//    [[self sharedInstance] startWithContainerId:containerId];
//}
//
//+ (void)sendScreenViewWithName:(NSString *)screenName {
//    [[self sharedInstance] sendScreenViewWithName:screenName];
//}
//
//+ (void)sendEvent:(NSString *)eventName withVariables:(NSDictionary *)variables {
//    [[self sharedInstance] sendEvent:eventName withVariables:variables];
//}
//
////+ (void)sendProductImpression:(HBProduct *)product list:(NSString *)list {
////    HBGoogleTagManager *sharedInstance = [self sharedInstance];
////    [NSObject cancelPreviousPerformRequestsWithTarget:sharedInstance];
////    [sharedInstance addProductImpression:product];
////    [sharedInstance performSelector:@selector(sendProductImpressions:) withObject:list afterDelay:0.0];
////}
////
////+ (void)sendProductClick:(HBProduct *)product list:(NSString *)list {
////    [[self sharedInstance] sendProductClick:product list:list];
////}
////
////+ (void)sendProductDetails:(HBProduct *)product list:(NSString *)list {
////    [[self sharedInstance] sendProductDetails:product list:list];
////}
////
////+ (void)sendAddToShoppingCart:(HBShoppingCartModel *)cartItem {
////    [self sendAddToShoppingCart:cartItem quantity:[cartItem amount]];
////}
////
////+ (void)sendRemoveFromShoppingCart:(HBShoppingCartModel *)cartItem {
////    [self sendRemoveFromShoppingCart:cartItem quantity:[cartItem amount]];
////}
////
////+ (void)sendAddToShoppingCart:(HBShoppingCartModel *)cartItem quantity:(NSUInteger)quantity {
////    [[self sharedInstance] sendAddToShoppingCart:cartItem quantity:quantity];
////}
////
////+ (void)sendRemoveFromShoppingCart:(HBShoppingCartModel *)cartItem quantity:(NSUInteger)quantity {
////    [[self sharedInstance] sendRemoveFromShoppingCart:cartItem quantity:quantity];
////}
//
//+ (void)sendCheckoutStep:(NSUInteger)step withShoppingCartItems:(NSSet *)cartItems {
//    [self sendCheckoutStep:step option:nil withShoppingCartItems:cartItems];
//}
//
//+ (void)sendCheckoutStep:(NSUInteger)step option:(NSString *)option withShoppingCartItems:(NSSet *)cartItems {
//    [[self sharedInstance] sendCheckoutStep:step option:option withShoppingCartItems:cartItems];
//}
//
//+ (void)sendCheckoutOptionStep:(NSUInteger)step option:(NSString *)option {
//    [[self sharedInstance] sendCheckoutOptionStep:step option:option];
//}
//
//+ (void)abandonCheckout {
//    [[self sharedInstance] abandonCheckout];
//}
//
////+ (void)sendPurchase:(HBPurchaseInfo *)purchase {
////    [[self sharedInstance] sendPurchase:purchase];
////}
//
//+ (void)sendRefundWithTransactionId:(NSString *)transactionId orderItems:(NSSet *)items {
//    [[self sharedInstance] sendRefundWithTransactionId:transactionId orderItems:items];
//}
//
//- (void)startWithContainerId:(NSString *)containerId {
//    [TAGContainerOpener openContainerWithId:containerId
//                                 tagManager:self.tagManager
//                                   openType:kTAGOpenTypePreferFresh
//                                    timeout:nil
//                                   notifier:self];
//}
//
//- (void)sendScreenViewWithName:(NSString *)screenName {
//    self.currentScreen = screenName;
//    [self pushDataToDataLayer:@{@"event": @"openScreen", @"screenName": screenName}];
//}
//
//- (void)sendEvent:(NSString *)eventName withVariables:(NSDictionary *)variables {
//    NSMutableDictionary *eventData = [[NSMutableDictionary alloc] init];
//    [eventData setObject:eventName forKey:@"event"];
//    if (variables) {
//        [eventData addEntriesFromDictionary:variables];
//    }
//    [self pushDataToDataLayer:[eventData copy]];
//}
//
////- (void)addProductImpression:(HBProduct *)product {
////    if (product) {
////        [self.impressionProducts addObject:product];
////    }
////}
//
//- (void)sendProductImpressions:(NSString *)list {
////    NSArray *products = [self.impressionProducts copy];
////    [self.impressionProducts removeAllObjects];
////    NSMutableArray *impressionObjects = [[NSMutableArray alloc] init];
////    for (HBProduct *product in products) {
////        NSMutableDictionary *impressionData = [self productDataFromProduct:product];
////        if ([list isKindOfClass:[NSString class]]) {
////            [impressionData setObject:list forKey:@"list"];
////        }
////        [impressionObjects addObject:[impressionData copy]];
////    }
//    //    [self clearEcommerceData];
//    //[self pushDataToDataLayer:@{@"ecommerce": @{@"currencyCode": kHBGTMEcommerceCurrencyCode,
//    //                                            @"impressions": [impressionObjects copy]}}];
//}
//
////- (void)sendProductClick:(HBProduct *)product list:(NSString *)list {
////    if (product) {
////        NSMutableDictionary *productData = [self productDataFromProduct:product];
////        NSMutableDictionary *actionFieldData = [[NSMutableDictionary alloc] init];
////        if ([list isKindOfClass:[NSString class]]) {
////            [actionFieldData setObject:list forKey:@"list"];
////        }
////        [self clearEcommerceData];
////        [self pushDataToDataLayer:@{@"event": @"productClick",
////                                    @"ecommerce": @{@"currencyCode": kHBGTMEcommerceCurrencyCode,
////                                                    @"click": @{@"actionField": [actionFieldData copy],
////                                                                @"products": @[[productData copy]]}}}];
////    }
////}
////
////- (void)sendProductDetails:(HBProduct *)product list:(NSString *)list {
////    if (product) {
////        NSMutableDictionary *productData = [self productDataFromProduct:product];
////        NSMutableDictionary *actionFieldData = [[NSMutableDictionary alloc] init];
////        if ([list isKindOfClass:[NSString class]]) {
////            [actionFieldData setObject:list forKey:@"list"];
////        }
////        //        [self clearEcommerceData];
////        [self pushDataToDataLayer:@{@"ecommerce": @{@"currencyCode": kHBGTMEcommerceCurrencyCode,
////                                                    @"detail": @{@"actionField": [actionFieldData copy],
////                                                                 @"products": @[[productData copy]]}}}];
////    }
////}
////
////- (void)sendAddToShoppingCart:(HBShoppingCartModel *)cartItem quantity:(NSUInteger)quantity {
////    if (cartItem && cartItem.product) {
////        NSMutableDictionary *itemData = [self cartItemDataFromCartItem:cartItem quantity:quantity];
////        [self clearEcommerceData];
////        [self pushDataToDataLayer:@{@"event": @"addToCart",
////                                    @"ecommerce": @{@"currencyCode": kHBGTMEcommerceCurrencyCode,
////                                                    @"add": @{@"products": @[[itemData copy]]}}}];
////    }
////}
////
////- (void)sendRemoveFromShoppingCart:(HBShoppingCartModel *)cartItem quantity:(NSUInteger)quantity {
////    if (cartItem && cartItem.product) {
////        NSMutableDictionary *itemData = [self cartItemDataFromCartItem:cartItem quantity:quantity];
////        [self clearEcommerceData];
////        [self pushDataToDataLayer:@{@"event": @"removeFromCart",
////                                    @"ecommerce": @{@"currencyCode": kHBGTMEcommerceCurrencyCode,
////                                                    @"remove": @{@"products": @[[itemData copy]]}}}];
////    }
////}
//
//- (void)sendCheckoutStep:(NSUInteger)step option:(NSString *)option withShoppingCartItems:(NSSet *)cartItems {
////    if (self.currentStep < step) {
////        self.currentStep = step;
////        
////        NSMutableArray *itemObjects = [[NSMutableArray alloc] init];
////        for (HBShoppingCartModel *item in cartItems) {
////            if (item.product) {
////                NSMutableDictionary *itemData = [self cartItemDataFromCartItem:item quantity:[item amount]];
////                [itemObjects addObject:itemData];
////            }
////        }
////        if ([itemObjects count] > 0) {
////            NSMutableDictionary *actionFieldData = [[NSMutableDictionary alloc] init];
////            [actionFieldData setObject:[NSString stringWithFormat:@"%lu", (unsigned long)step] forKey:@"step"];
////            if ([option isKindOfClass:[NSString class]]) {
////                [actionFieldData setObject:option forKey:@"option"];
////            }
////            [self clearEcommerceData];
////            [self pushDataToDataLayer:@{@"event": @"checkout",
////                                        @"ecommerce": @{@"currencyCode": kHBGTMEcommerceCurrencyCode,
////                                                        @"checkout": @{@"actionField": [actionFieldData copy],
////                                                                       @"products": [itemObjects copy]}}}];
////        }
////    }
//}
//
//- (void)sendCheckoutOptionStep:(NSUInteger)step option:(NSString *)option {
////    if (self.currentStep == step) {
////        if ([option isKindOfClass:[NSString class]]) {
////            [self clearEcommerceData];
////            [self pushDataToDataLayer:@{@"event": @"checkoutOption",
////                                        @"ecommerce": @{@"currencyCode": kHBGTMEcommerceCurrencyCode,
////                                                        @"checkout_option": @{@"actionField": @{@"step": [NSString stringWithFormat:@"%lu", (unsigned long)step],
////                                                                                                @"option": option}}}}];
////        }
////    }
//}
//
//- (void)abandonCheckout {
//    self.currentStep = 0;
//}
//
////- (void)sendPurchase:(HBPurchaseInfo *)purchase {
////    NSMutableArray *itemObjects = [[NSMutableArray alloc] init];
////    for (HBShoppingCartModel *item in purchase.items) {
////        if (item.product) {
////            NSMutableDictionary *itemData = [self cartItemDataFromCartItem:item quantity:[item amount]];
////            [itemObjects addObject:itemData];
////        }
////    }
////    
////    NSMutableDictionary *actionFieldData = [[NSMutableDictionary alloc] init];
////    if ([purchase.transactionId isKindOfClass:[NSString class]]) {
////        [actionFieldData setObject:purchase.transactionId forKey:@"id"];
////    }
////    if ([purchase.affiliation isKindOfClass:[NSString class]]) {
////        [actionFieldData setObject:purchase.affiliation forKey:@"affiliation"];
////    }
////    if ([purchase.revenue isKindOfClass:[NSString class]]) {
////        [actionFieldData setObject:purchase.revenue forKey:@"revenue"];
////    }
////    if ([purchase.tax isKindOfClass:[NSString class]]) {
////        [actionFieldData setObject:purchase.tax forKey:@"tax"];
////    }
////    if ([purchase.shipping isKindOfClass:[NSString class]]) {
////        [actionFieldData setObject:purchase.shipping forKey:@"shipping"];
////    }
////    if ([purchase.coupon isKindOfClass:[NSString class]]) {
////        [actionFieldData setObject:purchase.coupon forKey:@"coupon"];
////    }
////    
////    [self clearEcommerceData];
////    [self pushDataToDataLayer:@{@"event": @"purchase",
////                                @"ecommerce": @{@"currencyCode": kHBGTMEcommerceCurrencyCode,
////                                                @"purchase": @{@"actionField": [actionFieldData copy],
////                                                               @"products": [itemObjects copy]}}}];
////}
//
//- (void)sendRefundWithTransactionId:(NSString *)transactionId orderItems:(NSSet *)items {
////    if ([items count] > 0) {
////        NSMutableArray *itemObjects = [[NSMutableArray alloc] init];
////        for (HBUserOrderItem *item in items) {
////            [itemObjects addObject:@{@"id": [NSString stringWithFormat:@"%lu", (unsigned long)item.productID],
////                                     @"quantity": [NSString stringWithFormat:@"%lu", (unsigned long)item.quantity]}];
////        }
////        
////        [self clearEcommerceData];
////        [self pushDataToDataLayer:@{@"event": @"refund",
////                                    @"ecommerce": @{@"currencyCode": kHBGTMEcommerceCurrencyCode,
////                                                    @"refund": @{@"actionField": @{@"id": transactionId},
////                                                                 @"products": [itemObjects copy]}}}];
////    }
//}
//
//- (void)clearEcommerceData {
//    [self pushDataToDataLayer:@{@"ecommerce": [NSNull null]}];
//}
//
//- (void)pushDataToDataLayer:(NSDictionary *)data {
//    NSLog(@"Push: %@", data);
//    [self.tagManager.dataLayer push:data];
//}
//
////- (NSMutableDictionary *)productDataFromProduct:(HBProduct *)product {
////    NSMutableDictionary *productData = [[NSMutableDictionary alloc] init];
////    NSString *value = [NSString stringWithFormat:@"%lu", (unsigned long)[product productID]];
////    [productData setObject:value forKey:@"id"];
////    value = [product name];
////    if ([value isKindOfClass:[NSString class]]) {
////        [productData setObject:value forKey:@"name"];
////    }
////    value = [product price];
////    if ([value isKindOfClass:[NSString class]]) {
////        [productData setObject:value forKey:@"price"];
////    }
////    value = [product brand];
////    if ([value isKindOfClass:[NSString class]]) {
////        [productData setObject:value forKey:@"brand"];
////    }
////    value = [product category];
////    if ([value isKindOfClass:[NSString class]]) {
////        [productData setObject:value forKey:@"category"];
////    }
////    return productData;
////}
//
////- (NSMutableDictionary *)cartItemDataFromCartItem:(HBShoppingCartModel *)cartItem quantity:(NSUInteger)quantity {
////    NSMutableDictionary *cartItemData = [self productDataFromProduct:cartItem.product];
////    if ([cartItem type] == kHBShoppingCartTryType) {
////        [cartItemData setObject:@"0.0" forKey:@"price"];
////        [cartItemData setObject:@"1" forKey:@"quantity"];
////    } else {
////        [cartItemData setObject:[NSString stringWithFormat:@"%lu", (unsigned long)quantity] forKey:@"quantity"];
////    }
////    return cartItemData;
////}
//
//#pragma mark -
//#pragma TAGContainerOpenerNotifier
//
//- (void)containerAvailable:(TAGContainer *)container {
//    // Note that containerAvailable may be called on any thread, so you may need to dispatch back to
//    // your main thread.
//    dispatch_async(dispatch_get_main_queue(), ^{
//        self.container = container;
//    });
//}

@end
