mv bundle.h ..
./deps/amalgamate -i deps/easylzma/src -i deps/brotli -w "*.c*;*.h*;*.inc" redist.cpp ../bundle.cpp
sed -i 's/#line/\/\/#line/g' ../bundle.cpp
sed -i 's/#pragma once/\/\/#pragma once/g' ../bundle.cpp
cp ../bundle.h .