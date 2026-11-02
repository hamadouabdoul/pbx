echo Entrez le nom du projet

read project_name

mkdir -p ./$project_name/{include/$project_name,src,app,tests,docs}

cd $project_name
touch CmakeLists.txt CMakePresets.json .clang-tidy .gitignore README.md pbx.txt


#Contenue de CMakeLists.txt
echo "
cmake_minimum_required(VERSION 3.25)
project($project_name VERSION 1.0 LANGUAGES CXX)
add_executable(bulletin main.cpp moyenne.cpp)
target_compile_features(bulletin PRIVATE cxx_std_23)
" >> CMakeLists.txt

#Contenue de CmakePresets
echo "
{
    version: 6,
    configurePresets: [
        {
            name: debug,
            displayName: Debug,
            generator: Ninja,
            binaryDir: /build/debug,
            cacheVariables: { CMAKE_BUILD_TYPE: Debug } 
        },
        {
            name: release,
            displayName: Release,
            generator: Ninja,
            binaryDir: /build/release,
            cacheVariables: { CMAKE_BUILD_TYPE: Release }
        }
    ],
    buildPresets: [
        { name: debug,
        configurePreset: debug },
        { name: release, configurePreset: release }
    ]
}
" >> CmakePresets.json

#Contenue .clang-tidy
echo "
BasedOnStyle: LLVM
IndentWidth: 4
ColumnLimit: 100
PointerAlignment: Left
BreakBeforeBraces: Custom
BraceWrapping:
AfterFunction: true
AfterClass: false
AfterStruct: false
AfterControlStatement: Never
AllowShortFunctionsOnASingleLine: Inline
" >> .clang-tidy

#Contenue du .gitignore
echo "
build/
cmake‐build‐*/
out/
# Fichiers générés
compile_commands.json
*.o
*.obj
*.a
*.lib
*.so
*.dll
*.exe
# Caches des outils
.cache/
.idea/
" >> .gitignore

echo "PROJECT BASE X

Project $project_name build by PBX VERSION 0.1. Contact +227 91 33 43 83 for review.

Copy the code on github.com/hamadouabdoul/pbx.sh" >> pbx.txt

git init
git add .
git commit -m "Premier commit par pbx!!!"
