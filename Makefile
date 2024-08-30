gen_go=$(shell which protoc-gen-go)
gen_vtproto=$(shell which protoc-gen-go-vtproto)
proto=proto/gtfs-realtime.proto
pkg=./feed

all: $(proto)
ifndef gen_go
	$(error "protoc-gen-go not installed.\nto install, run the following command:\n\ngo install google.golang.org/protobuf/cmd/protoc-gen-go@latest")
endif
ifndef gen_vtproto
	$(error "protoc-gen-go-vtproto not installed.\nto install, run the following command:\n\ngo install github.com/planetscale/vtprotobuf/cmd/protoc-gen-go-vtproto@latest")
endif
	protoc \
	--go_out=. --plugin protoc-gen-go="$(gen_go)" \
	--go_opt=M$<=$(pkg) \
	--go-vtproto_out=. --plugin protoc-gen-go-vtproto="$(gen_vtproto)" \
	--go-vtproto_opt=M$<=$(pkg) \
        --go-vtproto_opt=features=marshal+unmarshal+size+pool \
        --go-vtproto_opt=pool=./feed.FeedMessage \
        --go-vtproto_opt=pool=./feed.FeedEntity \
        --go-vtproto_opt=pool=./feed.TripUpdate \
        --go-vtproto_opt=pool=./feed.TripDescriptor \
        --go-vtproto_opt=pool=./feed.EntitySelector \
        --go-vtproto_opt=pool=./feed.Stop \
	$<

$(proto):
	wget -O $@ https://gtfs.org/documentation/realtime/gtfs-realtime.proto
