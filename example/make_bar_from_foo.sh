#!/bin/bash

cat foo.go |\
    sed s/foo/bar/g |\
    sed s/Foo/Bar/g |\
    cat > bar.go

cat foo_test.go |\
    sed s/foo/bar/g |\
    sed s/Foo/Bar/g |\
    cat > bar_test.go
