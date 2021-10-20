INPUT_DIR="./protos"
OUT_DIR="./packages/grpc"
PROTOC_GENG_RPC="./node_modules/.bin/grpc_tools_node_protoc_plugin"
PROTOC_GEN_TS="./node_modules/.bin/protoc-gen-ts"

npx grpc_tools_node_protoc \
--proto_path="${INPUT_DIR}" \
--js_out="import_style=commonjs,binary:${OUT_DIR}" \
--grpc_out="grpc_js:${OUT_DIR}" \
--plugin="protoc-gen-grpc=${PROTOC_GENG_RPC}" \
--plugin="protoc-gen-ts=${PROTOC_GEN_TS}" \
--ts_out="${OUT_DIR}" \
${INPUT_DIR}/*.proto
