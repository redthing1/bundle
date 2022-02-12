bundle/redist
=============

- This optional folder is used to regenerate the amalgamated distribution. Do not include it into your project.
- Regenerate the distribution by typing the following lines:
```
move /y bundle.h ..
deps\amalgamate -i deps\easylzma\src -i deps\brotli -w "*.c*;*.h*;*.inc" redist.cpp ..\bundle.cpp
deps\fart.exe -- ..\bundle.cpp "#line" "//#line"
deps\fart.exe -- ..\bundle.cpp "#pragma once" "//#pragma once"
copy /y ..\bundle.h
```


on linux:

to build amalgamate: https://github.com/redthing1/Amalgamate

`g++ juce_core_amalgam.cpp  Amalgamate.cpp -o amalgamate -lstdc++ -lpthread -ldl`

```
mv bundle.h ..
./deps/amalgamate -i deps/easylzma/src -i deps/brotli -w "*.c*;*.h*;*.inc" redist.cpp ../bundle.cpp
sed -i 's/#line/\/\/#line/g' ../bundle.cpp
sed -i 's/#pragma once/\/\/#pragma once/g' ../bundle.cpp
cp ../bundle.h .
```