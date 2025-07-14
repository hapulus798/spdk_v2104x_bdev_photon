#include <photon/photon.h>
#include <photon/rpc/rpc.h>
#include <photon/net/socket.h>
#include <photon/common/alog-stdstring.h>

struct MyOperation {
    const static uint32_t IID = 0x111;
};

struct WritevBlocks: public MyOperation {
    const static uint32_t FID = 0x333;

    struct Request : public photon::rpc::Message {
        uint64_t offset_blocks;
        uint64_t num_blocks;
        photon::rpc::aligned_iovec_array buf;
        PROCESS_FIELDS(offset_blocks, num_blocks, buf);
    };

    struct Response : public photon::rpc::Message {
        int rc;
        PROCESS_FIELDS(rc);
    };
};

struct ReadvBlocks: public MyOperation {
    const static uint32_t FID = 0x555;

    struct Request : public photon::rpc::Message {
        uint64_t offset_blocks;
        uint64_t num_blocks;
        PROCESS_FIELDS(offset_blocks, num_blocks);
    };

    struct Response : public photon::rpc::Message {
        int rc;
        photon::rpc::aligned_iovec_array buf;
        PROCESS_FIELDS(rc, buf);
    };
};

class RPCServer {
public:
    RPCServer(std::string ip="127.0.0.1", uint16_t port=43548)
    :
    ep_(ip.c_str(), port),
    socket_server_(photon::net::new_tcp_socket_server()),
    skeleton_(photon::rpc::new_skeleton()) {
        skeleton_->register_service<WritevBlocks, ReadvBlocks>(this);
    }

    int do_rpc_service(WritevBlocks::Request* req, WritevBlocks::Response* resp, IOVector*, IStream*) {
        LOG_INFO("recieve writevblocks request: ", VALUE(req->offset_blocks), VALUE(req->num_blocks));
        resp->rc = 0;
        return 0;
    }

    int do_rpc_service(ReadvBlocks::Request* req, ReadvBlocks::Response* resp, IOVector*, IStream*) {
        LOG_INFO("recieve readvblocks request: ", VALUE(req->offset_blocks), VALUE(req->num_blocks));
        resp->rc = 0;
        return 0;
    }

    int run() {
        LOG_INFO("server run");
        auto handler = [&](photon::net::ISocketStream* socket_stream) {
            LOG_INFO("get into handler");
            return skeleton_->serve(socket_stream);
        };

        socket_server_->set_handler(handler);
        socket_server_->bind(ep_);
        socket_server_->listen();

        int rc = socket_server_->start_loop(true);
        return rc;
    }

private:
    photon::net::EndPoint ep_;
    std::unique_ptr<photon::net::ISocketServer> socket_server_;
    std::unique_ptr<photon::rpc::Skeleton> skeleton_;
};

int main() {
    photon::init();
    DEFER(photon::fini());

    RPCServer server;
    server.run();
}