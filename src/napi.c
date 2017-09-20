#include <stdio.h>
#include <node_api.h>


napi_value hello_world(napi_env env, napi_callback_info info)
{
	puts("Hello World!");
	return 0;
}

void init(napi_env env, napi_value exports, napi_value module, void* priv)
{
	napi_value fn;

	if(napi_ok == napi_create_function(env, 0, hello_world, 0, &fn))
	{
		if(napi_ok == napi_set_named_property(env, exports, "hello_world", fn))
			puts("hello_world registered");
	}
}

NAPI_MODULE(napibones, init);
