#ifndef THRIFT_TOOL_H
#define THRIFT_TOOL_H

#include <thrift/Thrift.h>
#include <thrift/TApplicationException.h>
#include <thrift/TBase.h>
#include <thrift/protocol/TProtocol.h>
#include <thrift/transport/TTransport.h>
#include <thrift/transport/TBufferTransports.h>
#include <thrift/protocol/TBinaryProtocol.h>


namespace CppUtil {
class ThrfitTool {
public:
    template<typename ThriftStruct>
    static std::string thriftToString(const ThriftStruct& ts) {
        using namespace apache::thrift::transport;
        using namespace apache::thrift::protocol;
        TMemoryBuffer* buffer = new TMemoryBuffer;
        boost::shared_ptr<TTransport> trans(buffer);
        TBinaryProtocol protocol(trans);
        ts.write(&protocol);
        uint8_t* buf;
        uint32_t size;
        buffer->getBuffer(&buf, &size);
        return std::string((char*)buf, (unsigned int)size);
    }

    template<typename ThriftStruct>
    static bool stringToThrift(const std::string& buff,
                               ThriftStruct* ts) {
        using namespace apache::thrift::transport;
        using namespace apache::thrift::protocol;
        TMemoryBuffer* buffer = new TMemoryBuffer;
        buffer->write((const uint8_t*)buff.data(), buff.size());
        boost::shared_ptr<TTransport> trans(buffer);
        TBinaryProtocol protocol(trans);
        ts->read(&protocol);
        return true;
    }
    template<typename ThriftStruct>
    static std::string thriftToJson(const ThriftStruct& ts) {
        using namespace apache::thrift::transport;
        using namespace apache::thrift::protocol;
        TMemoryBuffer* buffer = new TMemoryBuffer;
        std::shared_ptr<TTransport> trans(buffer);
        TJSONProtocol protocol(trans);
        ts.write(&protocol);
        uint8_t* buf;
        uint32_t size;
        buffer->getBuffer(&buf, &size);
        return std::string((char*)buf, (unsigned int)size);
    }

    template<typename ThriftStruct>
    static bool jsonToThrift(const std::string& buff,
                               ThriftStruct* ts) {
        using namespace apache::thrift::transport;
        using namespace apache::thrift::protocol;
        TMemoryBuffer* buffer = new TMemoryBuffer;
        buffer->write((const uint8_t*)buff.data(), buff.size());
        std::shared_ptr<TTransport> trans(buffer);
        TJSONProtocol protocol(trans);
        ts->read(&protocol);
        return true;
    }
};
} // end of namespace cpputil
#endif // THRIFT_TOOL_H
