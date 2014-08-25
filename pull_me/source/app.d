import vibe.d;
import std.process;

string GIT_ROOT = "/var/www/lauri/";

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.port = 1337;
	settings.bindAddresses = ["::1", "127.0.0.1", "0.0.0.0"];
	logInfo("Server running in leet port 1337 on 0.0.0.0");
    
    auto router = new URLRouter;
    router.get("/", &hello);
    router.post("/", &githubHook);

	listenHTTP(settings, router);
}

void hello(HTTPServerRequest req, HTTPServerResponse res)
{
	res.writeBody("Hello, Wörld!!!");
}

void githubHook(HTTPServerRequest req, HTTPServerResponse res)
{
    auto result = executeShell("./jekyll_pull_and_build.sh");
    res.writeBody(result.output);
}
