/*
    Uri.complete()
 */

u = Uri({ path: "/a/b/c" })
assert(u.complete() == "http://localhost/a/b/c")

u = Uri({ scheme: "https", path: "/a/b/c" })
assert(u.complete() == "https://localhost/a/b/c")

u = Uri({ host: "www.example.com", path: "/a/b/c" })
assert(u.complete() == "http://www.example.com/a/b/c")

u = Uri({ host: "www.example.com", path: "/a/b/c", reference: "extra", query: "priority=high" })
assert(u.complete() == "http://www.example.com/a/b/c#extra?priority=high")

u = Uri({ path: "/a/b/c" })
assert(u.complete("http://example.com") == "http://example.com/a/b/c")

u = Uri({ path: "/a/b/c" })
assert(u.complete({ scheme: "https", port: 7777 }) == "https://localhost:7777/a/b/c")

u = Uri({ path: "/a/b/c" })
assert(u.complete(Uri("http://example.com")) == "http://example.com/a/b/c")

//  Relative 
u = Uri({ path: "a/b/c" })
assert(u.complete(Uri("http://example.com")) == "http://example.com/a/b/c")

//  Must not complete the port if already has a host
u = Uri({ host: "www.example.com", path: "/a/b/c", reference: "extra", query: "priority=high" })
assert(u.complete("http://ibm.com:7777/demo") == "http://www.example.com/a/b/c#extra?priority=high")

//  Port completion
assert(Uri(":4100").complete() == "http://localhost:4100/")
assert(Uri("127.0.0.1:4100").complete() == "http://127.0.0.1:4100/")
assert(Uri("https://127.0.0.1:4100").complete() == "https://127.0.0.1:4100/")

