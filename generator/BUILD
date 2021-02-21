package(default_visibility = ["//visibility:public"])

genrule(
    name = "protoc_gen",
    srcs = ["protoc"],
    outs = ["protoc.py"],
    cmd = "cat $(SRCS) > $(OUTS)",
)

py_library(
    name = "nanopb_pb2",
    srcs = ["proto/nanopb_pb2.py"],
)

py_library(
    name = "_utils",
    srcs = ["proto/_utils.py"],
)

py_binary(
    name = "nanopb_generator",
    srcs = ["nanopb_generator.py"],
    deps = [
        ":_utils",
        ":nanopb_pb2",
    ],
)
