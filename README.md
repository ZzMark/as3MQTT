as3MQTT
=======

Pure/Native Action Script 3 that implements the MQTT (Message Queue Telemetry Transport) protocol, a lightweight protocol for publish/subscribe messaging.

## feature

- unlock max username length and topic name length
- support big(>64k) message
- add WILL

## quick start

```ts
private var mqtt:MQTTSocket;

public function connect():void {
    mqtt = new MQTTSocket();

    mqtt.username = 'test';
    mqtt.password = 'passwd';

    mqtt.willTopic = 'mqtt/logout';
    mqtt.willQos = 1;
    mqtt.willPayload = 'logout';
 
    // event listeners
    mqtt.addEventListener(MQTTEvent.CONNECT, onConnect);
    mqtt.addEventListener(MQTTEvent.CLOSE, onClose);
    mqtt.addEventListener(MQTTEvent.ERROR, onError);
    mqtt.addEventListener(MQTTEvent.MESSGE, onMessage);

    mqtt.connect('iot.eclipse.org', 1883);
}

private function onConnect(event:MQTTEvent):void {
    logger.log("MQTT connected: {0}", event.message);
    var qos:Array = new Array();
    qos.push(1);
    mqtt.subscribe(new Array('mqtt/subscribe'), qos, 1);
}

private function onClose(event:MQTTEvent):void {
    logger.log("MQTT close: {0}", event.message);
}

private function onError(event:MQTTEvent):void {
    logger.error("MQTT Error: {0}", event.message);
}

private function onMessage(event:MQTTEvent):void {
    logger.error("MQTT Error: {0}", event.message);
}
```

## Overview

MQ Telemetry Transport (MQTT) is a lightweight broker-based publish/subscribe messaging protocol designed to be open, simple, lightweight and easy to implement. These characteristics make it ideal for use in constrained environments, for example, but not limited to:

    #1.Where the network is expensive, has low bandwidth or is unreliable
    #2.When run on an embedded device with limited processor or memory resources

Features of the protocol include:

    #1.The publish/subscribe message pattern to provide one-to-many message distribution and decoupling of applications
    #2.A messaging transport that is agnostic to the content of the payload
    #3.The use of TCP/IP to provide basic network connectivity
    #4.Three qualities of service for message delivery:
        Qos(0):"At most once", where messages are delivered according to the best efforts of the underlying TCP/IP network. Message loss or duplication can occur. This level could be used, for example, with ambient sensor data where it does not matter if an individual reading is lost as the next one will be published soon after.
        Qos(1):"At least once", where messages are assured to arrive but duplicates may occur.
        Qos(2):"Exactly once", where message are assured to arrive exactly once. This level could be used, for example, with billing systems where duplicate or lost messages could lead to incorrect charges being applied.
    #5.A small transport overhead (the fixed-length header is just 2 bytes), and protocol exchanges minimised to reduce network traffic
    #6.A mechanism to notify interested parties to an abnormal disconnection of a client using the Last Will and Testament feature


## MQ Telemetry Transport (MQTT) V3.1.1 Protocol Specification

http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/mqtt-v3.1.1.pdf

中文版本：http://mcxiaoke.github.io/mqtt/protocol/MQTT-3.1.1-CN.html

## Tips

Mosquitto console at Linux: tcpdump -nl -A port 1883

## Other client libraries 

https://github.com/mqtt/mqtt.github.io/wiki/libraries
