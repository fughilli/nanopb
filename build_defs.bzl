def nanopb_library(name, srcs = []):
    if (len(srcs) != 1):
        fail("srcs must have one element")

    native.genrule(
        name = name + "_nanopb_gen",
        srcs = srcs,
        outs = [name + ".nanopb.h", name + ".nanopb.c"],
        cmd = ("$(location @com_github_nanopb_nanopb//:nanopb_shim) " +
               "$(location " +
               "@com_github_nanopb_nanopb//generator:nanopb_generator) " +
               "$(SRCS) $(OUTS)"),
        tools = [
            "@com_github_nanopb_nanopb//generator:nanopb_generator",
            "@com_github_nanopb_nanopb//:nanopb_shim",
        ],
    )

    native.cc_library(
        name = name,
        srcs = [name + ".nanopb.c"],
        hdrs = [name + ".nanopb.h"],
        deps = [
            "@com_github_nanopb_nanopb//:nanopb",
        ],
        copts = [
            "-isystemnanopb",
        ],
    )
