INPUT_DIR="./protos"
OUT_DIR="./packages/grpc"

npx grpc_tools_node_protoc \
--proto_path="${INPUT_DIR}" \
--js_out="import_style=commonjs,binary:${OUT_DIR}" \
--grpc_out="grpc_js:${OUT_DIR}" \
--plugin="protoc-gen-grpc=./node_modules/.bin/grpc_tools_node_protoc_plugin" \
--plugin=protoc-gen-ts=./node_modules/.bin/protoc-gen-ts \
--ts_out="${OUT_DIR}" \
${INPUT_DIR}/*.proto
