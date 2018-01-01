# codegen

This is a simple script suitable for facilitating code generation.

Unlike make, which relies on timestamps, it precisely tracks the 
input and output hashes of files so that code generation only runs
when it is needed.

Unlike some fancier real build systems, this is simple enough to
understand easily.

To use, create a git-style config file (I like to call mine `codegen`)
and place it in your source tree. It might look something like this:

```
[gen "bar"]
	in = foo_test.go
	in = foo.go
	out = bar_test.go
	out = bar.go
	run = ./gen.sh

[gen "date"]
	out = date.go
	run = (\
		echo \"package example\" \n \
		echo \"\" \n \
		echo \"const date = \\\"$(date)\\\"\") > date.go
```

Each `gen` section defines a rule that constructs the files listed in
`out` from the files listed in `in` by running `run`. 

After running generate for the first time, you'll see that your 
file now includes:

```
[file "codegen.conf"]
	foo = 9d30df65a4e476a04e8255f22d89f627a1b9edba
	date = 56938b98d7fe51450d64d66c5656111a2b4f56aa
[file "foo_test.go"]
	foo = 25c275c5a5d2ae07fae59a72cbc4b9241d76ad30
[file "foo.go"]
	foo = 890d2531d03cd352e90ef4a5449b64bdf9d2098e
[file "bar_test.go"]
	foo = 5c2cc9784f3fe35e10aa47ae61296d69eb0eef1e
[file "bar.go"]
	foo = 6dbb71b8a40a734a06aad9e41e44d73db213542a
[file "date.go"]
	date = 1a77530613ba42092b0293eb455204efdc12a2a4
[file "Generatefile"]
	foo = 0ed4578ff85eef070e8196821bd7eec5d6d91931
	date = 56938b98d7fe51450d64d66c5656111a2b4f56aa
```

Pro-tip: You can make your config file executable and use a 
shebang line at the start to make your generate file directly
runable.

```
#!/usr/bin/env ../generate 

[gen "bar"]
	in = foo.go
	out = bar.go
	run = ./gen.sh
```
