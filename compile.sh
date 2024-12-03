build () { 
  cd build
  make -j12 ammm/fast
  status=$?
  cd ..
  return $status
}

run ()
{
  build
  status=$?
  [[ $status -eq 0 ]] && ./build/ammm
}

generate() { 
  cmake . -B build -DCMAKE_BUILD_TYPE=Release
  ln -s build/compile_commands.json .
}

$@
