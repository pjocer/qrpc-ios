## qrpc-iOS

> a iOS library that lets iOS clients access a qRPC service. You can find out much more about [qRPC](https://github.com/zhiqiangxu/qrpc).

### Install

```
pod 'InnotechIMProtocol'
```

### Usage

初始化

```
/**
实例方法

@param delegate InnotechIMProtocol
@param queue 代理回调所处线程
@return instance
*/
- (instancetype)initWithDelegate:(id<InnotechIMProtocol>)delegate delegateQueue:(dispatch_queue_t)queue NS_DESIGNATED_INITIALIZER;

```

连接/断开

```
/**
连接server

@param host host
@param port port
@param errPtr errPtr
@return result
*/
- (BOOL)connectToHost:(NSString*)host onPort:(uint16_t)port error:(NSError **)errPtr;

/**
断开连接
*/
- (void)disconnect;
```

发送数据包

```
/**
发送指令消息

@param cmd 指令
@param params 参数
@param sendProgress 发送进度
@param sendCompeletion 发送完成
@param receiveHandler 接收到resp时，可能会需要外层处理这些数据，处理过后需要通过`completion`block通知协议层已处理完毕
@param completion 处理完resp时
@return INXSCommandInfo instance
*/
- (INXSCommandInfo *)sendDataByCMD:(int32_t)cmd
andParams:(NSString * _Nullable)params
sendProgress:(InnotechIMProtocolProgressBlock _Nullable)sendProgress
sendCompeletion:(InnotechIMProtocolCompeletionBlock _Nullable)sendCompeletion
receiveHandler:(InnotechIMProtocolReceiveHandler _Nullable)receiveHandler
completion:(InnotechIMProtocolCompeletionBlock _Nullable)completion;
```

代理

```
@protocol InnotechIMProtocol <NSObject>

/**
成功连接

@param manager InnotechIMProtocolManager
@param host host
@param port port
*/
- (void)protocolManager:(InnotechIMProtocolManager *)manager didConnectToHost:(NSString *)host port:(uint16_t)port;

/**
断开连接

@param manager InnotechIMProtocolManager
@param err error
*/
- (void)protocolManagerDidDisconnect:(InnotechIMProtocolManager *)manager withError:(NSError *)err;
@optional

/**
收到数据流

@discussion 该方法与发送指令方法中的`receiveHandler`有同样的作用，供上层在收到resp后对resp data进行处理
只需存在一种处理就好，优先使用block
无论block形式还是delegate形式的处理,都需要上层在处理完resp data后自行调用INXSCommandInfo.completion，用以dequeue数据流队列。该completion也是发送指令时传入的completion。

@param manager InnotechIMProtocolManager
@param info 收到的数据流信息
*/
- (void)protocolManager:(InnotechIMProtocolManager *)manager didReadData:(INXSCommandInfo *)info;
@end
```
