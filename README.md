# GTFS

`vtprotobuf` bindings for GTFS 2.0 Realtime Protobuf.

## Updating the bindings

1. Install [`protoc`](https://grpc.io/docs/protoc-installation/) using your
   package manager or by downloading a pre-built binary.

2. Install the `protoc-gen-go` and `protoc-gen-go-vtproto` plugins.

```bash
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install github.com/planetscale/vtprotobuf/cmd/protoc-gen-go-vtproto@latest
```

3. Run `make`.
