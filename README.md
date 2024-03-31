## MQTT (Message Queue Telemetry Transport)

### What is MQTT?
MQTT is a machine-to-machine (M2M)/”Internet of Things” connectivity protocol.
Used for simple communication between multiple devices with a simple messaging protocol in RealTime.

Some of the related concepts
- Publish: Sending a message.
- Subscribe: Receiving a message
- Broker: The broker is responsible for distributing messages to interested clients based on the topic of a message.
- Topic: A topic is a UTF-8 string, which the broker uses to filter messages for each connected client. A topic consists of one or more topic levels. Each topic level is separated by a forward slash. eg: global/demo

Some of the broker server tasks are
- Receive all messages
- Filter and rectify the interesting subscriber
- send/publish a message to all subscriber

### Why not HTTP for this purpose?
- No Good solution for push and Quality of service
- Require more bandwidth
- Acting as host requires more battery(To listen for incoming requests and server)
- More battery

## How to Setup
- Clone this Repository.
- Use a free public broker
  Broker: broker.emqx.io
  TCP Port: 1883
  Websocket Port: 8083
- Run the project

