# Inter-Process Communication Mechanisms

| Mechanism          | Local/Remote | Speed     | Message Size   | Complexity | Example Use Case               |
|--------------------|--------------|-----------|----------------|------------|--------------------------------|
| Pipes              | Local        | High      | Small          | Low        | Parent-child process           |
| Shared Memory      | Local        | Very High | Large          | High       | Image/video processing         |
| Message Queue      | Local        | Medium    | Small-Medium   | Medium     | Task coordination              |
| Unix Sockets       | Local        | High      | Small-Medium   | Medium     | Modular desktop app            |
| Signals            | Local        | Very High | None           | Low        | Process control                |
| TCP/IP Sockets     | Remote       | Medium    | Large          | Medium     | Multiplayer game server        |
| HTTP API           | Remote       | Low-Med   | Medium         | Low        | Web services                   |
| gRPC               | Remote       | High      | Small-Large    | Medium     | Microservices architecture     |
| WebSocket          | Remote       | High      | Medium         | Medium     | Real-time dashboard            |
| RabbitMQ/Kafka     | Both         | High      | Small-Large    | High       | Event-driven architecture      |
